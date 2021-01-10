module Rethinking

using PrettyTables
using StatsBase
using Optim
using Turing
using LinearAlgebra
using StatsBase
using DataFrames

include("quap.jl")
include("precise.jl")

export quap
export precise
end
