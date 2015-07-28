export TR

function TR (f, a, b, n)

  h = (b-a)/n
  approx = (f(a) + f(b))/2
  for i=[1:n-1]
    x = a + i*h
    approx += f(x)
  end
  return approx*h

end
