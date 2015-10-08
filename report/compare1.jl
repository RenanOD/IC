include("../src/functions_Nf.jl")

include("print_table.jl")

table = compute_table(x->exp(x), 0.0, 1.0, exp(1)-1.0)
plot_table(table)
