import io.jl
import learn.jl

input=[]; output=[]; hidden=[]
trainio(input,output)
hideio(hidden)
theta=[]
if length(hidden)>0
  push!(theta,rand(length(input[:1]),hidden[1]))
else
  push!(theta,rand(length(input),length(output)))
end
for i in (1:length(hidden)-2)
  push!(theta,rand(hidden[i],hidden[i+1]))
end
if length(hidden)>0
  push!(theta,rand(hidden[end],1))  #change this to length of each output
end

print("How many iterations? ")
n=parse(Int,readline(STDIN))
Delta
for i in (1:n)
  for j in (1:length(input[1,:]))
    a=compute(input[:,j],hidden,theta)
    delta=backprop(a,output[j],theta)
end
