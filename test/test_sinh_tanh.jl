using IC

  n=12

f(t)=t*log(1+t)
(a,b)=(0,1)
integral=1/4
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.1 f(t)=t*log(1+t) from $a to $b: $error \n")

f(t)=t^2*atan(t)
(a,b)=(0,1)
integral=(pi-2+2log(2))/12
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.2 f(t)=t^2*arctan(t) from $a to $b: $error \n")

f(t)=e^t*cos(t)
(a,b)=(0,pi/2)
integral=(e^(pi/2)-1)/2
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.3 f(t)=e^t*cos(t) from $a to $b: $error \n")

f(t)=atan(sqrt(2+t^2))/((1+t^2)*sqrt(2+t^2))
(a,b)=(0,1)
integral=5*pi^2/96
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.4 f(t)=atan(sqrt(2+t^2))/((1+t^2)*sqrt(2+t^2)) from $a to $b: $error \n")

f(t)=sqrt(t)*log(t)
(a,b)=(0,1)
integral=-4/9
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.5 f(t)=sqrt(t)*log(t) from $a to $b: $error \n")

f(t)=(1-t^2)^(1/2)
(a,b)=(0,1)
integral=pi/4
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.6 f(t)=(1-t^2)^(1/2) from $a to $b: $error \n")

f(t)=sqrt(t)/sqrt(1-t^2)
(a,b)=(0,1)
integral=2*sqrt(pi)*gamma(3/4)/gamma(1/4)
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.7 f(t)=sqrt(t)/sqrt(1-t^2) from $a to $b: $error \n")

f(t)=log(t)^2
(a,b)=(0,1)
integral=2.0
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.8 f(t)=log(t)^2 from $a to $b: $error \n")

f(t)=log(cos(t))
(a,b)=(0,pi/2)
integral=-pi*log(2)/2
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.9 f(t)=log(cos(t)) from $a to $b: $error \n")

f(t)=tan(t)^(1/2)
(a,b)=(0,pi/2)
integral=pi*2^(1/2)/2
error=integral-sinh_tanh(f,a,b,n)
println ("Error for eq.10 f(t)=tan(t)^(1/2) from $a to $b: $error \n")
