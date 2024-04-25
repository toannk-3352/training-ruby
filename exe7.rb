a =  [2,20,1,"/a","/c"]
b = [1,"/c/a/","/b","/a",50]
c = "a/"
puts "Array b inclue c #{b.include?(c)}"

def get_same_item (arrayA, arrayB) 
  results = arrayA.select { |item| arrayB.include?(item) }
  print results
  puts
end

def get_not_same_item (arrayA, arrayB) 
  results = arrayA.reject { |item| arrayB.include?(item) }
  print results
  puts
end
get_same_item a, b
get_not_same_item a, b