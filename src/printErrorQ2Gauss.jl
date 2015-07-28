export printErrorQ2Gauss

function printErrorQ2Gauss (f, a, b, integral)

  exact=integral(b)-integral(a);
  approx=Q2Gauss(f,a,b);
  error=exact-approx;

  println ("in the interval between $a e $b: $error")

end
