# Viết chương trình quản lý nhân viên như sau:
# Đây là 1 công ty về công nghệ thông tin.
# Trong 1 công ty, Mỗi nhân viên sẽ có tên và mã nhân viên và bộ phận làm việc của nhân viên
# Công ty sẽ có các bộ phận như: dev, qa, BO, infra
#
# Do tính chất công việc ở mỗi bộ phận khác nhau, nên sẽ có cách tính lương riêng:
# + Dev: Lương cơ bản * số giờ  và được hỗ trợ thêm 15% lương
# + Tester: Lương cơ bản * số giờ  và được hỗ trợ thêm 10% lương
# + Các nhân viên khác: Lương cơ bản * số giờ
# * giả sử lương cơ bản ở đây là 3000
#
# Ngoài ra, chỉ có nhân viên thuộc bộ phận QA và Dev mới được phép request OT
# Công thức tính request OT là: Số giờ OT * 150% của lương cơ bản
#
# Bạn hãy đề xuất thiết kế các lớp đối tượng cần thiết để quản lý danh sách các nhân viên của công ty và hỗ trợ tính lương cho nhân viên theo tiêu chí đặt ra như trên.
# Hãy viết chương trình thực hiện các yêu cầu sau:
#
# 1. Khởi tạo danh sách nhân viên (lưu trữ trong một mảng duy nhất).
# 2. Hiển thị toàn bộ thông tin nhân viên
# 3. Lấy ra mã nhân viên có số lương > 5000
# 4. Thêm mới 1 nhân viên vào danh sách nhân viên hiện có
def init_data
  employee1 = Employee.new('John', '001', 'dev', 160, 20)
  $company.add_employee(employee1)
  employee2 = Employee.new('Jane', '002', 'dev', 150)
  $company.add_employee(employee2)
  employee3 = Employee.new('Jack', '003', 'qa', 160)
  $company.add_employee(employee3)
  employee4 = Employee.new('Jill', '004', 'qa', 160, 10)
  $company.add_employee(employee4)
  employee5 = Employee.new('Jake', '005', 'dev', 160, 2)
  $company.add_employee(employee5)
  employee6 = Employee.new('Queen', '006', 'infa', 160, 1)
  $company.add_employee(employee6)
  employee7 = Employee.new('Atom', '007', 'dev', 160, 20)
  $company.add_employee(employee7)
  employee8 = Employee.new('Tom', '008', 'bo', 160, 20)
  $company.add_employee(employee8)
end

def add_new_employee
  print 'Enter name: '
  name = gets.chomp
  print "Enter code: "
  code = gets.chomp
  print "Enter department: "
  department = gets.chomp
  print "Enter worked hours: "
  workedHours = gets.chomp.to_f
  print "Enter ot hours: "
  otHours = gets.chomp.to_f
  employee = Employee.new(name, code, department, workedHours, otHours)
  $company.add_employee(employee)
end

class Employee
  attr_accessor :name, :code, :department, :basic_salary, :ot_hours, :worked_hours

  def initialize(name, code, department, worked_hours, ot_hours = 0)
    @name = name
    @code = code
    @department = department
    @basic_salary = basic_salary
    @ot_hours = %w[qa dev].include?(department) ? ot_hours.to_f : 0
    @worked_hours = worked_hours.to_f
    @basic_salary = 3000
  end

  def cal_salary
    if @department == 'dev'
      @basic_salary * @worked_hours * 1.15 + @basic_salary * @ot_hours * 1.5
    elsif @department == 'qa'
      @basic_salary * @worked_hours * 1.1 + @basic_salary * @ot_hours * 1.5
    else
      @basic_salary * @worked_hours
    end
  end

  def to_s
    puts "Name: #{@name}, Code: #{@code}, Department: #{@department}, Salary: #{cal_salary}"
  end
end

class Company
  attr_accessor :employees

  def initialize
    @employees = []
  end

  def add_employee(employee)
    @employees.append(employee)
  end

  def print_all_employee
    @employees.each do |employee|
      puts "Name: #{employee.name}, Code: #{employee.code}, Department: #{employee.department} Salary: #{employee.cal_salary}"
    end
  end

  def get_employee_by_salary
    results = @employees.select { |e| e.cal_salary > 500_000 }
    results.each do |r|
      r.to_s
    end
  end
end

$company = Company.new

loop do
  puts '1. Khởi tạo danh sách nhân viên'
  puts '2. Hiển thị toàn bộ thông tin nhân viên'
  puts '3. Lấy ra mã nhân viên có số lương > 5000'
  puts '4. Thêm mới một nhân viên vào danh sách nhân viên hiện có'
  print 'Enter your choice: '
  choice = gets.chomp.to_i
  case choice
  when 1
    init_data
  when 2
    $company.print_all_employee
  when 3
    $company.get_employee_by_salary
  when 4
    add_new_employee
  else
    puts 'Invalid choice'
  end
end
