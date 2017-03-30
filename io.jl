function trainio(inout::Int64)
  data_array=[]
  path=chomp(readline(STDIN))
  global f
  try
    cd(pwd())
    f=open(joinpath("./",path), "r")
  catch
    cd("/")
    f=open(path,"r")
  end
  i=1
  lines=readlines(f)
  close(f)
  for i in lines
    nos=split(i)
    nos=map(nos) do x
      x=parse(Int,x)
    end
    if inout==1
      push!(nos,1)  #bias
    end
    append!(data_array,nos)
  end
  data_array=reshape(data_array,div(length(data_array),length(lines)),length(lines))
  println(data_array)
  return data_array
  # access every data set with data_array[:,i]
end

function hideio(hidden)
  i=1
  while(true)
    print("How many elements in hidden layer $i? (enter zero to stop): ")
    push!(hidden,parse(Int,readline(STDIN))+1)
    if(hidden[end]<=1)
      #println(hidden)
      pop!(hidden)
      #println(hidden)
      break
    end
    i+=1
  end
end
