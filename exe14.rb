# Viết một chương trình quản lý điểm của học sinh. Mỗi học sinh sẽ có 3 điểm toán, văn, anh
# Bạn hãy đề xuất thiết kế các lớp đối tượng cần thiết để quản lý danh sách các học sinh trong 1 lớp
# Hãy viết chương trình thực hiện các yêu cầu sau:
# 1. Cho phép nhập thông tin điểm từng học sinh và sau đó In ra điểm trung bình cao nhất của lớp
# 2. Khởi tạo danh sách học sinh (lưu trữ trong một hash có key là tên học sinh, value chứa các điểm học sinh đó và điểm trung bình cộng).
# VD:
# {"ngoc"=>{:toan=>3, :van=>4, :anh=>5, :avg=>4.0}, "thao"=>{:toan=>6, :van=>7, :anh=>8, :avg=>7.0}}
# 3. Dựa vào hash vừa khởi tạo ở bước 2 lấy ra tên học sinh có điểm trung bình 3 môn cao nhất
#

class Student
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = { toan: 0, van: 0, anh: 0 }
  end

  def add_score(subject, score)
    @score[subject.to_sym] = score
  end

  def calculate_average
    @score.values.inject(0) { |result, element| result + element } / @score.values.length
  end
end

class Classroom
  attr_reader :students

  def initialize
    @students = {}
  end

  def add_student(student)
    student.score[:avg] = student.calculate_average
    @students[student.name] = student.score
  end

  def print_class_score
    @students.each do |key, _value|
      puts "Name: #{key}"
    end
  end

  def print_class_highest_score
    highest_score = @students.values.map { |x| x[:avg] }.max
    @students.select { |_, v| v[:avg] == highest_score }
  end
end

classroom = Classroom.new

student1 = Student.new('ngoc')
student1.add_score(:toan, 3)
student1.add_score(:van, 4)
student1.add_score(:anh, 5)
classroom.add_student(student1)

student2 = Student.new('thao')
student2.add_score(:toan, 6)
student2.add_score(:van, 7)
student2.add_score(:anh, 8)
classroom.add_student(student2)

puts classroom.print_class_highest_score
