function sigmoid(result)
  for i in (1:length(result))
    result[i]=(1/(1+(e**result[i])))
  end
  return result
end

function compute(input,hidden,theta)
  a=[]
  resulthere=input * theta[1]
  resulthere=sigmoid(resulthere)
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
  for i in (length(a)-1:-1:2)
    deltahere=(theta[j])'*delta[1] .* (a[i] .* (1-a[i]))
    unshift!(delta,deltahere)
    j-=1
  end
  return delta
end
