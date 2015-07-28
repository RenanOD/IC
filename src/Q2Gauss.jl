export Q2Gauss

function Q2Gauss (f, a, b)

  x(t)=(a+b+t*(b-a))/2

  t=sqrt(3)/3

  approx= (f(x(t)) + f(x(-t)))*(b-a)/2

  return approx

end
