hash_data = {
  1 => "John",
  2 => "Jane",
  3 => "Jack",
  4 => "Jill",
  5 => "Jake",
}

def find_name_or_id (key, hash_data) 
  hash_data.select do |k, v|
    if hash_data.key?(key.to_i)
      return "The value of #{key} is #{hash_data[key.to_i]}"
    elsif hash_data.value?(key)
      return "The key of #{key} is #{hash_data.key(key)}"
    else
      return "Not Found name or key"
    end
  end
end
puts "Enter name or key: "
string = gets.chomp
puts find_name_or_id(string,hash_data)