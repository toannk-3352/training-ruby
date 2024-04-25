print "Input String: "
string = gets.chomp
puts "Reverse string #{string.reverse}"
puts "Clear space in string #{string.gsub!(" ", "")}"
puts "Check string /|#{string}/| is email? #{string.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)}"