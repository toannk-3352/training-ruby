# Xây dựng module Price có method min_ticket_need_sell trả về số lượng vé cần bán cho mỗi chuyến bay là 100.
# (OUTPUT: "You need         sell at least 100 ticket to fly")
#
# Xây dựng class Plane thỏa mãn những điều kiện sau:
# - Có instance method là flight_attendant in ra số lượng tiếp viên hàng không trên máy bay (số lượng tiếp viên hàng không  là tham số truyền vào) của mỗi chiếc máy bay
# (OUTPUT: "In flight have xxx attendant" - với xxx là tham số truyền vào
# - Có class method là max_fly_speed in ra tốc độ bay tối đa của tất cả các máy bay
# (OUTPUT: "913 km/h")
# - Thừa kế module Price
# - Tạo ra đối tượng vietnam_airline của lớp Plane và in ra màn hình thông báo số lượng tiếp viên hàng không (biết vietnam_airline có 10 tiếp viên hàng không).
# - Tạo ra đối tượng vietjet của lớp Plane và in ra màn hình thông báo số lượng tiếp viên hàng không.(biết vietjet có 20 tiếp viên hàng không).
# - In ra màn hình tốc độ bay tối đa của Plane.
# - In ra màn hình số lượng vé cần bán cho vietname_airline và vietjet.

module Price
  def min_ticket_need_sell
    puts "You need sell at least 100 ticket to fly"
  end
end
class Plane
  include Price
  def initialize (attendant)
    @attendant = attendant
  end
  def flight_attendant
    puts "In flight have #{@attendant} attendant"
  end
  def max_fly_speed
    puts "913 km/h"
  end
end
vietnam_airline = Plane.new(10)
vietjet = Plane.new(20)

vietnam_airline.flight_attendant
vietnam_airline.min_ticket_need_sell

vietjet.flight_attendant
vietjet.max_fly_speed