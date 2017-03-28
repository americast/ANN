function compute(input,hidden,theta)
  a=[]
  resulthere=input' * theta[1]
  push!(a,resulthere)
  for j in (2:length(theta))
    resulthere*=theta[i]
    push!(a,resulthere)
  end
  return a
end

function backprop(a, output,theta)
  delta=[]; j=length(theta)
  push!(delta,a[end]-output)
  for i in (length(a)-1:-1:1)
    deltahere=(theta[j])'*delta[1] .* a[i] (.* (1-a[i]))
    unshift!(delta,deltahere)
    j-=1
  end
  return delta
end
