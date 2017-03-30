include("./io.jl")
include("./learn.jl")

hidden=[]
print("Enter file path for training data input: ")
input=trainio(1)
print("Enter file path for training data output: ")
output=trainio(2)
hideio(hidden)
println(hidden)
theta=[]
if length(hidden)>0
  push!(theta,rand(hidden[1],length(input[:,1])))
  println("tlen: $(length(theta))")
else
  push!(theta,rand(length(output[:,1]),length(input)))
  println("tlen: $(length(theta))")
end
for i in (1:length(hidden)-1)
  push!(theta,rand(hidden[i+1],hidden[i]))
  println("tlen: $(length(theta))")
end
if length(hidden)>0
  push!(theta,rand(length(output[:,1]),hidden[end]))
  println("tlen: $(length(theta))")
end
println("Output length: $(length(output[:,1]))")
println("Theta length: $((theta))")

print("How many iterations?: ")
n=parse(Int,readline(STDIN))
print("Rate?: ")
eta=parse(Float64,readline(STDIN))
for i in (1:n)
  Delta=[]
  for k in (1:length(hidden)+1)
    push!(Delta,[])
  end
  m=length(input[1,:])
  for j in (1:m)
    send=input[:,j]
    receive=output[:,j]
    println("Receive: $receive\nOutput:$output\nSend: $send")
    #m=length(send)
    #for k in send
    a=compute(send,theta)
    #a=a[2]
    delta=backprop(a,receive,theta)
    for l in (1:length(theta))
      here=(delta[l]*a[l+1]')
      println("delta $l: $(size(here'))")
      println("theta $l: $(size(theta[l]))")
      try
        Delta[l]+=here'
      catch
        Delta[l]=here'
      end
    end
  end

  println("Delta len: $(length(Delta))\ntheta: $((theta[1]))")
  for k in (1:length(theta))
    println(size(Delta[k]))
    println(size(theta[k]))
    #Delta[k]=reshape(Delta[k],size(theta[k]))
    theta[k]-=(eta/m)*Delta[k] #Add regularisation
  end
end
