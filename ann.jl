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
print("Rate?: ")
eta=parse(Int,readline(STDIN))
for i in (1:n)
  for j in (1:length(input[1,:]))
    Delta=[]
    for i in (1:length(hidden)+1)
      push!(Delta,0)
    end
    send=input[:j]
    m=length(send)
    for k in send
      a=compute(k,hidden,theta)
      delta=backprop(a,output[j],theta)
      for l in (1:length(delta))
        Delta[l]+=delta[l]
      end
    end
    for l in (1:length(Delta))
      theta[l]-=(eta/m)*Delta #Add regularisation
  end
end
