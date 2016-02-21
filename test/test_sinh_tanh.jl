function test_precision_simple(g, a, b, exact)
  approx=sinh_tanh(g, a, b, n = 6)
  @test_approx_eq_eps(exact, approx, 5.0e-8)
end

function test_precision_big(g, a, b, exact)
  approx=sinh_tanh(g, a, b, n = 12)
  @test_approx_eq_eps(exact, approx, 1.0e-60)
end

function test_precision_lim(g, a, b, exact, lim)
  approx=sinh_tanh(g, a, b, lim, n = 12)
  @test_approx_eq_eps(exact, approx, lim)
end

function test_sinh_tanh_simple()
  g1(t) = t*log(1 + t)
  (a, b) = (0, 1.0)
  exact = 1/4
  test_precision_simple(g1, a, b, exact)

  g2(t) = t^2*atan(t)
  (a, b) = (0, 1.0)
  exact = (pi - 2 + log(4))/12
  test_precision_simple(g2, a, b, exact)

  g3(t) = e^t*cos(t)
  (a, b) = (0, pi/2)
  exact = (exp(pi/2) - 1)/2
  test_precision_simple(g3, a, b, exact)

  g4(t) = atan(sqrt(2 + t^2))/((1 + t^2)*sqrt(2 + t^2))
  (a, b) = (0, 1.0)
  exact = 5pi^2/96
  test_precision_simple(g4, a, b, exact)

  g5(t) = sqrt(t/(1-t^2))
  (a, b) = (0, 1.0)
  exact = 2sqrt(pi)gamma(3/4)/gamma(1/4)
  test_precision_simple(g5, a, b, exact)
end

function test_sinh_tanh_big()
  g1(t) = t*log(one(BigFloat) + t)
  (a, b) = (zero(BigFloat), one(BigFloat))
  exact = one(BigFloat)/4
  test_precision_big(g1, a, b, exact)

  g2(t) = t^2*atan(t)
  (a, b) = (zero(BigFloat), one(BigFloat))
  exact = (BigFloat(pi) - BigFloat(2) + log(BigFloat(4)))/12
  test_precision_big(g2, a, b, exact)

  g3(t) = exp(t)*cos(t)
  (a, b) = (zero(BigFloat), BigFloat(pi)/2)
  exact = (exp(BigFloat(pi)/2) - one(BigFloat))/2
  test_precision_big(g3, a, b, exact)

  g4(t) = atan(sqrt(BigFloat(2) + t^2))/((one(BigFloat) + t^2)*sqrt(BigFloat(2) + t^2))
  (a, b) = (zero(BigFloat), one(BigFloat))
  exact = BigFloat(5)*BigFloat(pi)^2/96
  test_precision_big(g4, a, b, exact)
end

function test_sinh_tanh_lim()
  lim = parse(BigFloat, "1e-45")

  g1(t) = t*log(one(BigFloat) + t)
  (a, b) = (zero(BigFloat), one(BigFloat))
  exact = one(BigFloat)/4
  test_precision_lim(g1, a, b, exact, lim)

  g2(t) = t^2*atan(t)
  (a, b) = (zero(BigFloat), one(BigFloat))
  exact = (BigFloat(pi) - BigFloat(2) + log(BigFloat(4)))/12
  test_precision_lim(g2, a, b, exact, lim)
end

test_sinh_tanh_simple()
test_sinh_tanh_big()
test_sinh_tanh_lim()