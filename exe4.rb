=begin 
Có 1 mảng các hash như sau:

[{"Hanoi": ["CauGiay", "vung xanh"] },  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]

Biến đổi về các dạng:
{"vung xanh": ["Cau Giay - Hanoi", "Metri - Hanoi"], "vung do": ["LongBien - Hanoi"] }
=end

hash_array = [{ "Hanoi": ['CauGiay', 'vung xanh'] }, { 'Hanoi' => ['LongBien', 'vung do'] },
              { 'Hanoi' => ['Metri', 'vung xanh'] }]

def convert_hash(data)
  result_hash = {}
  data.each do |item|
    item.each do |city, places|
      result_hash[places[1].to_sym] ||= []
      result_hash[places[1].to_sym] << "#{places[0]} - #{city}"
    end
  end
  puts result_hash.inspect
end

convert_hash(hash_array)
