using Rethinking
using Test
using Turing
using DataFrames
using PrettyTables

@testset "Rethinking.jl" begin
    @model function test(y)
        μ ~ Normal(10, 1)
        σ ~ Exponential(5)
        y .~ Normal(μ, σ)
    end
    y = randn(1000)*5 .+ 10
    res = quap(test(y))
    μ, σ = res.coef.μ, res.coef.σ
    @test round(μ) == 10
    @test round(σ) == 5

    df = DataFrame((a=rand(1000)))
    @test isnothing(precise(df))
    """
    ┌───────┬───────────────────────────────────────────┐
    │ param │ mean   std  5.5%   50%  94.5%   histogram │
    ├───────┼───────────────────────────────────────────┤
    │     a │ 0.51  0.28  0.06  0.52   0.95  ▆▇▇▇▇▇█▇▆▇ │
    └───────┴───────────────────────────────────────────┘
    """
end
