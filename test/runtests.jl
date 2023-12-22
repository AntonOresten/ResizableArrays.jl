using ResizableArrays
using Test

@testset "ResizableArrays.jl" begin
    # Test the creation of ResizableArray
    @testset "ResizableArray Creation" begin
        ra = ResizableArray(ones(2, 3))
        @test isa(ra, ResizableArray)
        @test size(ra) == (2, 3)
        @test all(ra .== 1)
    end
    
    # Test resizing functionality
    @testset "Resizing" begin
        ra = ResizableArray(ones(2, 3))
        resize!(ra, 3, 3)
        @test size(ra) == (3, 3)
        @test length(ra) == 9
    
        resize!(ra, 2, 2)
        @test size(ra) == (2, 2)
        @test length(ra) == 4
    end
    
    # Test indexing and setting values
    @testset "Indexing and Setting Values" begin
        ra = ResizableArray(ones(2, 3))
        @test ra[1, 1] == 1
    
        ra[1, 1] = 10
        @test ra[1, 1] == 10
    
        ra[2, 3] = 20
        @test ra[2, 3] == 20
    end
    
    # Test concatenation
    @testset "Concatenation" begin
        ra = ResizableArray(ones(2, 3))
        other = ones(2, 2)
        append!(ra, other)
        @test size(ra) == (2, 5)
        @test ra[1, 4] == 1
        @test ra[2, 5] == 1
    end
    
    # Error handling
    @testset "Error Handling" begin
        ra = ResizableArray(ones(2, 3))
        @test_throws ArgumentError resize!(ra, -1, 3)  # Negative dimensions are not allowed
    
        @test_throws DimensionMismatch append!(ra, ones(3, 3))  # Incompatible dimensions for concatenation
    end
    
end
