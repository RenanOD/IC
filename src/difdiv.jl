function difdiv(X,Y)


  j=length(X)
  X=X*1.0
  Y=Y*1.0
  C=copy(Y)
  order=copy(Y)

  for i=[1:j-1]

    for p=[1:j-i]
      order[p]=(order[p+1]-order[p])/(X[p+i]-X[p])
    end
    
    C[i+1]=order[1]
  end
  return C
end
    
    
    
  
  