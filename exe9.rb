# Chuẩn hóa chuỗi
# input: nhập vào họ và tên
# - thực hiện xóa khoảng trắng ở đầu, ở cuối, ở giữa sao cho mỗi từ cách nhau 1 khoảng trắng
# - chữ cái đầu của tên viết hoa, còn lại chữ thường
# - những từ còn lại trong họ tên lấy ký tự đầu tiên, viết hoa ký tự đó
# VD:
# "    le thi   Tuan    Hiep   "
# -> HiepLTT
#
# " nguyen the   manh  "
# -> ManhNT
#
def convert_full_name (name)
  string = ''
  name = name.split
  name.map do |word|
    if word == name.last
      string = word + string
    else
      string << word.split('').first.capitalize
    end
  end
  puts string
end

print "Fullname: "
name = gets.chomp
convert_full_name (name)
