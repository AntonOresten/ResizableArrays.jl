# ResizableArrays

[![Latest Release](https://img.shields.io/github/release/anton083/ResizableArrays.jl.svg)](https://github.com/anton083/ResizableArrays.jl/releases/latest)
[![MIT license](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/license/MIT)
[![Build Status](https://github.com/anton083/ResizableArrays.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/anton083/ResizableArrays.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/anton083/ResizableArrays.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/anton083/ResizableArrays.jl)

So, I had this idea in a moment of coding zen: what if we could make arrays in Julia a bit more... resizable? And right then and there, ResizableArrays.jl was born. It's a tiny, humble package that tries to make arrays more flexible by letting you resize them on the fly, by storing the data in a vector (which is resizable in base Julia).

This package implements the `ResizableArray` type, which enables you to resize an array, while not necessarily changing its location in memory.

# FAQ

**Q**: Why?
**A**: Good question.