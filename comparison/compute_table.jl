function compute_table(f, a, b, exact)

  Nf = [2^4, 2^5, 2^6, 2^7, 2^8, 2^9, 2^10];
  u = size(Nf, 1); k = 1;
  functions = [trapezoidal_rule, simpsons_rule, mid_point, gaussian_quadrature, sinh_tanh];
  t = size(functions, 1);
  
  table = cell(u + 1, t + 1)
  table[1,:] = ["Nf"; "TR"; "SR"; "PM"; "QG"; "ST"]

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
  tabela = open("Tabela.txt", "w")
  (m,n) = size(table)
  for i = 1:m
    write(tabela, join(table[i,:], " & "))
    write(tabela, " \\\\ \\hline")
  end
  close(tabela)
end

using Winston

function plot_table(table)
  (m,n) = size(table)
  x = Int[int(x) for x in table[2:end,1]]

  colors = ["red", "green", "black", "magenta", "blue"]

  legs = Array(Curve, 5)
  plt = FramedPlot()

  for i = 1:5
    y = Float64[float64(x) for x in table[2:end,i+1]]
    c = Curve(x, y, "color", colors[i])
    setattr(c, "label", table[1,i+1])
    add(plt, c)
    p = Points(x, y, "color", colors[i], "symbolkind", "circle")
    add(plt, p)
    legs[i] = c
  end

  setattr(plt, "xlog", true)
  setattr(plt, "ylog", true)
  add(plt, Legend(0.8, 0.65, legs))
  setattr(plt, "xrange", (2^4, 1050))
  setattr(plt, "yrange", (1e-50, 1e-1))
  setattr(plt.x1, "label", "N")
  setattr(plt.y1, "label", "Erro")

  savefig(plt, "teste_plot.png", "width", 600, "height", 800)
end