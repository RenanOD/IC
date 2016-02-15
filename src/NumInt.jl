module NumInt

Pkg.clone("https://github.com/ajt60gaibb/FastGaussQuadrature.jl")
using FastGaussQuadrature

include("closed_formulas.jl")
include("gauss_formulas.jl")
include("adaptive_formulas.jl")
include("improper_formulas.jl")
include("sinh_tanh.jl")

end
