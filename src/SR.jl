export SR

function SR (f, a, b, n)

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
