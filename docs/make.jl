using Rethinking
using Documenter

makedocs(;
    modules=[Rethinking],
    authors="andreas koher",
    repo="https://github.com/andreasko/Rethinking.jl/blob/{commit}{path}#L{line}",
    sitename="Rethinking.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://andreasko.github.io/Rethinking.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/andreasko/Rethinking.jl",
)
