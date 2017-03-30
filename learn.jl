function sigmoid(result)
  for i in (1:length(result))
    result[i]=(1/(1+(e^result[i])))
  end
end

function compute(input,hidden,theta)
  a=[]
  resulthere=input * theta[1]
  sigmoid(resulthere)
  push!(a,resulthere)
  for j in (2:length(theta))
    println(j)
    resulthere*=theta[j]
    sigmoid(resulthere)
    push!(a,resulthere)
  end
  return a
end

function backprop(a, output,theta)
  delta=[]; j=length(theta)
  println("A: $(a[end,:])")
  push!(delta,a[end]-output)
  for i in (length(a[:,end])-1:-1:2)
    println("i $i")
    deltahere=(theta[j])*delta[1] .* (a[i] .* (1-a[i]))
    unshift!(delta,deltahere)
    j-=1
  end
  return delta
end
