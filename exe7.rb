=begin 
Cho 2 mảng sau: 
a =  [2,20,1,"/a","/c"], 
b = [1,"/c/a/","/b","/a",50], 
c = 1
a, Viết câu lệnh kiểm tra mảng b có chứa c không?
OUTPUT: 
true

b, Viết hàm lấy ra những phần tử có trong cả 2 mảng.
OUTPUT: 
[1, "/a"]

c, Viết hàm lấy ra những phần tử chỉ có trong mảng a mà không có trong mảng b.
OUTPUT: 
[2, 20, "/c"]

=end


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