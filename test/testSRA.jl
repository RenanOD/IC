using IC

N=25
tol=1e-6

println ("Error tolerance: $tol \n")

f(t)=t*log(1+t)
(a,b)=(0,1)
integral=1/4
error=integral-SRA(f,a,b,tol,N)
println ("Error for f(x)=t*log(1+t) from $a to $b: $error \n")

f(t)=t^2*atan(t)
(a,b)=(0,1)
integral=(pi-2+2log(2))/12
error=integral-SRA(f,a,b,tol,N)
println ("Error for f(x)=t^2*arctan(t) from $a to $b: $error \n")

f(t)=e^t*cos(t)
(a,b)=(0,pi/2)
integral=(e^(pi/2)-1)/2
error=integral-SRA(f,a,b,tol,N)
println ("Error for f(x)=e^t*cos(t) from $a to $b: $error \n")

f(t)=atan((2+t^2)^(1/2))/((1+t^2)*(2+t^2)^(1/2))
(a,b)=(0,1)
integral=5*pi^2/96
error=integral-SRA(f,a,b,tol,N)
println ("Error for f(x)=arctan((2+t^2)^(1/2))/((1+t^2)*(2+t^2)^(1/2)) from $a to $b: $error \n")

f(t)=1/(1+25t^2)
(a,b)=(-1,1)
integral=atan(5)/5-atan(-5)/5
error=integral-SRA(f,a,b,tol,N)
println ("Error for f(x)=arctan((2+t^2)^(1/2))/((1+t^2)*(2+t^2)^(1/2)) from $a to $b: $error \n")