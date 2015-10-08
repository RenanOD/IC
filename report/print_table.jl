function compute_table(f, a, b, exact)

  Nf = [2^4, 2^5, 2^6, 2^7, 2^8, 2^9, 2^10, 2^11, 2^12];
  u = size(Nf, 1); k = 1;
  functions = [trapezoidal_rule, simpsons_rule, mid_point, sinh_tanh, open_formula];
  t = size(functions, 1);
  
  table = cell(u + 1, t + 1)
  table[1,:] = ["Nf"; "TR"; "SR"; "MP"; "ST"; "OP"]

  for i = 1:u 
    table[i + 1,1] = Nf[i];
  end
  
  for k = 1:t
    for i = 2:1:u + 1
      g = functions[k]
      table[i, k + 1] = abs(exact - g(f, a, b, Nf = Nf[i - 1]))
    end
  end

  return table
end

function print_table(table)
  # Depois
  (m,n) = size(tabela)
  for i = 1:m
    print(join(tabela[i,:], " & "))
    println(" \\\\ \\hline")
  end
end

using Winston

function plot_table(table)
  (m,n) = size(table)
  x = Int[int(x) for x in table[2:end,1]]
  y1 = Float64[float64(x) for x in table[2:end,2]]
  y2 = Float64[float64(x) for x in table[2:end,3]]
  y3 = Float64[float64(x) for x in table[2:end,4]]
  y4 = Float64[float64(x) for x in table[2:end,5]]
  loglog(x, y1, "ro-", x, y2, "bo-", x, y3, "ko-", x, y4, "go-")
end
