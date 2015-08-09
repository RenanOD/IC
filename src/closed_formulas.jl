export simpsons_rule
export trapezoidal_rule

function simpsons_rule(f, a, b, n)
  if n%2!=0
    n += 1
  end
  h = (b-a)/n
  approx = (f(a) + f(b) + 4f(a+h))
  for i=2:2:n-1
    x = a + i*h
    approx += 2f(x) + 4f(x+h)
  end
  return approx*(h/3)
end

function trapezoidal_rule(f, a, b, n)
  h = (b-a)/n
  approx = (f(a) + f(b))/2
  for i=1:n-1
    x = a + i*h
    approx += f(x)
  end
  return approx*h
end