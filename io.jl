function trainio(input,output)
  print("Enter file path for training data input: ")
  path=chomp(readline(STDIN))
  global f
  try
    cd(pwd())
    f=open(joinpath("./",path), "r")
  catch
    cd("/")
    f=open(path,"r")
  endi=1
  lines=readlines(f)
  close(f)
  for i in lines
    nos=split(i)
    nos=map(nos) do x
      parse(Int,x)
    end
    append!(input,nos)
  end
  input=reshape(input,div(length(input),length(lines)),length(lines))
  print(input)

  # access every input with input[:,i]
  print("Enter file path for training data output: ")
  try
    cd(pwd())
    f=open(joinpath("./",path), "r")
  catch
    cd("/")
    f=open(path,"r")
  end
  output=readlines(f)
  close(f)
  output=map(output) do x
    parse(Int,x)
  end
  print(output)
end

function hideio(hidden)
  i=1
  while(true)
    print("How many elements in hidden layer $i? (enter zero to stop): ")
    push!(hidden,parse(Int,readline(STDIN)))
    if(hidden[end]<=0)
      hidden=hidden[1:end-1]
      break
    end
    i+=1
  end
end
