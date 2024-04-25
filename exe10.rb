=begin
input:  - Nhập số nguyên N là số lượng phần tử mảng
- nhập lần lượt N phần tử mảng
output: in ra 1 hash với key là giá trị vừa nhập, value là số lần xuất hiện, sắp xếp hash theo số lần xuất hiện
VD
10 1 2 4 5 2 4 1 6 4 3
-> {5=>1, 6=>1, 3=>1, 1=>2, 2=>2, 4=>3}
=end
def convert_hash (arrayNumber) 
  hash = {}
  arrayNumber.each do |number|
    if hash.key?(number)
      hash[number] += 1
    else
      hash[number] = 1
    end
  end
  return hash
end
print "Enter array length: "
length = gets.chomp
arrayNumber = []
length.to_i.times do
  print "Enter a number: "
  number = gets.chomp
  arrayNumber << number.to_i
end
print convert_hash(arrayNumber)
puts
