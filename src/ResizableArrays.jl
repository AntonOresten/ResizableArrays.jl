module ResizableArrays

export ResizableArray
export ResizableVector, ResizableMatrix

"""
    ResizableArray{T, N} <: AbstractArray{T, N}

An array that can be resized in-place
"""
struct ResizableArray{T, N} <: AbstractArray{T, N}
    data::Vector{T}
    dims::Ref{NTuple{N, Int}}
    
    function ResizableArray{T, N}(array::AbstractArray{T, N}) where {T, N}
        new{T, N}(vec(array), size(array))
    end

    @inline function ResizableArray(array::AbstractArray{T, N}) where {T, N}
        ResizableArray{T, N}(array)
    end
end

const ResizableVector{T} = ResizableArray{T, 1}
const ResizableMatrix{T} = ResizableArray{T, 2}

@inline Base.size(a::ResizableArray) = a.dims[]
@inline Base.length(a::ResizableArray) = length(a.data)

@inline Base.getindex(a::ResizableArray, i::Integer) = a.data[i]
@inline Base.getindex(a::ResizableArray{T, N}, i...) where {T, N} = a[LinearIndices(size(a))[i...]]

@inline Base.setindex!(a::ResizableArray, v, i::Integer) = (a.data[i] = v)
@inline Base.setindex!(a::ResizableArray{T, N}, v, i...) where {T, N} = (a[LinearIndices(size(a))[i...]] = v)

function Base.resize!(a::ResizableArray{T, N}, dims...) where {T, N}
    all(>=(0), dims) || throw(ArgumentError("Dimensions must be non-negative"))
    a.dims[] = Tuple(dims)
    resize!(a.data, prod(dims))
    return a
end

function Base.append!(array::ResizableArray{T, N}, other::AbstractArray{T, N}) where {T, N}
    size(array)[1:N-1] == size(other)[1:N-1] || throw(DimensionMismatch("Arrays must have same dimensions except for last dimension"))
    array.dims[] = Tuple([collect(size(array)[1:N-1]); size(array, N) + size(other, N)])
    append!(array.data, other)
    return array
end

end
