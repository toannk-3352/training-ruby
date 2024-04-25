# Nhập vào một mảng gồm n  số từ bàn phím (quá trình nhập
# sẽ dừng khi người sử dụng nhập vào giá trị là chữ) sau đó
# - hiển thị mảng vừa nhập
# - hiển thị giá trị nhỏ nhất của mảng ra màn hình.
# - tính giá trị trung bình của mảng
# - tính tổng của mảng. dùng inject
# - tìm các phần tử có giá trị > 10
# - tìm phần tử đầu tiên có giá trị > 10

print 'Array length: '
length = gets.chomp
attempts = 0
arrayNumber = []
while attempts < length.to_i
  print 'Enter a number: '
  number = gets.chomp
  break if ('a'..'z').to_a.include?(number.downcase)

  arrayNumber.append(number.to_i)
  attempts += 1
end
print arrayNumber
puts
puts(arrayNumber.min_by { |x| x })
puts arrayNumber.sum / arrayNumber.length.to_f
puts arrayNumber.inject(0) { |result, element| result + element }
print(arrayNumber.select { |x| x > 10 })
puts
puts(arrayNumber.find { |x| x > 10 })
