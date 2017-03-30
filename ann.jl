include("./io.jl")
include("./learn.jl")

hidden=[]
print("Enter file path for training data input: ")
input=trainio()
print("Enter file path for training data output: ")
output=trainio()
hideio(hidden)
println(hidden)
theta=[]
if length(hidden)>0
  push!(theta,rand(length(input[:,1]),hidden[1]))
else
  push!(theta,rand(length(input),length(output[:,1])))
end
for i in (1:length(hidden)-2)
  push!(theta,rand(hidden[i],hidden[i+1]))
end
if length(hidden)>0
  push!(theta,rand(hidden[end],length(output[:,1])))
end


print("How many iterations?: ")
n=parse(Int,readline(STDIN))
print("Rate?: ")
eta=parse(Float64,readline(STDIN))
for i in (1:n)
  Delta=[]
  for k in (1:length(hidden)+1)
    push!(Delta,[])
  end
  for j in (1:length(input[1,:]))
    send=input[:,j]
    receive=output[:,j]
    println("Receive: $receive\nOutput:$output\nSend: $send")
    m=length(send)
    for k in send
      a=compute(k,hidden,theta)
      a=a[2]
      delta=backprop(a,receive,theta)
      for l in (1:length(delta))
        append!(Delta[l],delta[l])
      end
    end

    println("Delta size: $(size(Delta))\ntheta: $((theta[1]))")
    for k in (1:length(theta))
      println(size(Delta[k]))
      println(size(theta[k]))
      Delta[k]=reshape(Delta[k],size(theta[k]))
      theta[k]-=(eta/m)*Delta[k] #Add regularisation
    end
  end
end
