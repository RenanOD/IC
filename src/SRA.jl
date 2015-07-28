include("SR.jl")

export SRA

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