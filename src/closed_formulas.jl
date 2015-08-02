export SR
export TR
export SRA
export Q2Gauss

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

function TR (f, a, b, n)
  h = (b-a)/n
  approx = (f(a) + f(b))/2
  for i=[1:n-1]
    x = a + i*h
    approx += f(x)
  end
  return approx*h
end

function SRA (f,a,b,tol,N)
Va=fill(1.0,2N); Vb=fill(1.0,2N);
i=1; approx=0; Va[i]=a; Vb[i]=b; m=0;

while i>0

  atemp= Va[i]; btemp= Vb[i]; htemp=(btemp-atemp)/2;
  S1=SR(f,atemp,btemp,2); S2=SR(f,atemp,btemp,4);

  toltemp=15tol/((b-a)/(btemp-atemp))
  i-=1
  if abs(S1-S2)<toltemp
    approx+=S2
  else
    if ((b-a)/(btemp-atemp)>N)
      approx+=S2
      m=1;
    else
      i+=1
      Va[i]=btemp-htemp; Vb[i]=btemp;
      i+=1
      Va[i]=atemp; Vb[i]=btemp-htemp;
    end
  end
end
if m==1
  println ("The ammount of subintervals was exceeded")
end
return approx
end

function Q2Gauss (f, a, b)
  x(t)=(a+b+t*(b-a))/2
  t=sqrt(3)/3

  approx= (f(x(t)) + f(x(-t)))*(b-a)/2

  return approx
end