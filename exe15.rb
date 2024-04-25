# Thực hiện viết chương trình tính số giờ làm thêm (OT) và trợ cấp ăn tối (trường hợp OT trong cùng một ngày)
# Input:
# + Thời gian check-in (Giờ đến) hh:mm
# + Thời gian check-out (Giờ về) hh:mm
# Output: "OT: x, Lunch: Y/N, Dinner: Y/N" (Y: có hoặc N: không, x kiểu float)
# Logic nghiệp vụ:
# + Số giờ OT > 4 giờ và có bao gồm giờ ăn trưa (12:00 ~ 13:00) => trừ bớt 1 tiếng ăn trưa, có trợ cấp ăn trưa
# + Số giờ OT > 3 giờ và OT qua 21:00 => Có trợ cấp ăn tối
# + Các trường hợp còn lại không trừ giờ ăn trưa, không có trợ cấp ăn trưa, không có trợ cấp ăn tối
# + Các trường hợp dữ liệu không hợp lệ => In ra thông báo lỗi
# Ví dụ:
# + Check-in = '08:00', Check-out = '12:30'
# => OT = 4.5, Lunch: N, Dinner: N
# + Check-in = '12:00', Check-out = '16:30'
# => OT = 3.5, Lunch: Y, Dinner: N
# + Check-in = '12:30', Check-out = '21:45'
# => OT = 9.25, Lunch: N, Dinner: Y
# + Check-in = '19:30', Check-out = '21:30'
# => OT = 2.0, Lunch: N, Dinner: N
require 'time'

def calculate_overtime_and_allowance(check_in, check_out)
  check_in_time = Time.parse(check_in)
  check_out_time = Time.parse(check_out)

  raise 'Invalid input: Check-out time must be later than check-in time' if check_out_time <= check_in_time

  overtime_hours = (check_out_time - check_in_time) / 3600.to_f
  lunch_break = check_in_time <= Time.parse("12:00") && check_out_time >= Time.parse("13:00")
  dinner_break = overtime_hours > 3 && check_out_time >= Time.parse("21:00")
  
  if overtime_hours > 4 && lunch_break
    overtime_hours -= 1
    lunch  = "Y"
  else 
    lunch  = "N"
  end

  dinner = dinner_break ? "Y" : "N"
  puts "OT: #{overtime_hours}, Lunch: #{lunch}, Dinner: #{dinner}"

rescue StandardError => e
  puts e
end
calculate_overtime_and_allowance('19:30', '21:30')
