=begin 
Nhập vào chuỗi 
- Đảo ngược chuỗi
- Bỏ dấu space
- kiểm tra chuỗi có phải định dạng email không 
=end

print "Input String: "
string = gets.chomp
puts "Reverse string #{string.reverse}"
puts "Clear space in string #{string.gsub!(" ", "")}"
puts "Check string /|#{string}/| is email? #{string.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)}"