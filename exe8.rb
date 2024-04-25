# 1, Tạo một mảng số nguyên có 5 phần tử bằng cách cho nhập từng số, nếu k nhập gì tự động set giá trị là 0
# 2, In ra tổng các phần tử trong mảng
# 3, Sử dụng Proc dùng mảng trên in ra mảng có lũy thừa tương ứng với từng phần tử, nếu phần tử bằng 6 hoặc 7 sẽ in ra giữ nguyên giá trị k lũy thừa
# VD:
# [1, 2, 3, 4, 5] => output: [1, 4, 9, 16, 25]
# [2, 3, 3, 6, 7] => output: [4, 9, 9, 6, 7]
arrayNumber = []
5.times do
  print 'Input number: '
  number = gets.chomp
  number = number == '' ? 0 : number.to_i
  arrayNumber << number
end
proc = proc { |x| x != 6 && x != 7 ? x**2 : x }
print arrayNumber.map(&proc)
