function test_precision(g, a, b, exact)
  approx=adaptive_simpson(g, a, b, tol = 1e-14, N = 512)
  @test_approx_eq_eps(exact, approx, 1e-14)
end

function test_adaptive_simpson()

  g1(t) = t*log(1 + t)
  (a, b) = (0, 1)
  exact = 1/4
  test_precision(g1, a, b, exact)

  g2(t) = t^2*atan(t)
  (a, b) = (0, 1)
  exact = (pi - 2 + 2log(2))/12
  test_precision(g2, a, b, exact)

  g3(t) = e^t
  (a, b) = (0, pi/2)
  exact = e^(pi/2) - 1
  test_precision(g3, a, b, exact)

  g4(t) = 1/(1 + 25t^2)
  (a, b) = (-1, 1)
  exact = atan(5)/5 - atan(-5)/5
  test_precision(g4, a, b, exact)

end

test_adaptive_simpson()