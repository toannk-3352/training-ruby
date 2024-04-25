# Thực hiện viết chương trình tính số ngày nghỉ phép theo thâm niên làm việc
# Input: Ngày vào làm có định dạng mm/dd/yyyy
# Output: Số ngày nghỉ phép (Float)
# Logic nghiệp vụ:
# - Trường hợp ngày vào làm < năm hiện tại:
# + Thâm niên từ 5 năm trở lên: 14 ngày
# + Thâm niên từ 4 năm trở lên: 13 ngày
# + Các trường hợp còn lại: 12 ngày
# - Trường hợp ngày vào làm trong năm hiện tại:
# Tính theo số tháng làm việc đến cuối năm, trong đó:
# + Ngày vào làm từ ngày 10 trở đi => Tháng đó được tính 0.5 ngày
# + Ngày vào làm nhỏ hơn ngày 10 => Tháng đó được tính 1 ngày
# Ví dụ: Ngày hiện tại là 4/4/2020
# + Ngày vào làm: 10/03/2020 => Số ngày nghỉ phép: 9.5
# + Ngày vào làm: 07/03/2020 => Số ngày nghỉ phép: 10
# + Ngày vào làm: 04/12/2019 => Số ngày nghỉ phép: 12
# + Ngày vào làm: 10/10/2015 => Số ngày nghỉ phép: 13
# + Ngày vào làm: 25/03/2015 => Số ngày nghỉ phép: 14
require 'date'

def calculate_holidays(start_date)
  current_date = Date.today
  start_date = Date.strptime(start_date, '%d/%m/%Y')
  year = current_date.year - start_date.year

  if year != 0
    case year
    when 5..Float::INFINITY
      return 14
    when 4
      return 13
    else
      return 12
    end
  end

  remain_month = 12 - start_date.month
  remain_month += start_date.day < 10 ? 1 : 0.5
end

puts "Ngày vào làm: 19/05/2022 => Số ngày nghỉ phép: #{calculate_holidays('19/05/2022')}"
puts "Ngày vào làm: 10/03/2024 => Số ngày nghỉ phép: #{calculate_holidays('10/03/2024')}"
puts "Ngày vào làm: 07/03/2024 => Số ngày nghỉ phép: #{calculate_holidays('07/03/2024')}"
puts "Ngày vào làm: 04/12/2020 => Số ngày nghỉ phép: #{calculate_holidays('04/12/2020')}"
puts "Ngày vào làm: 25/03/2015 => Số ngày nghỉ phép: #{calculate_holidays('25/03/2015')}"


