initArray = [5,3,6,7,8,3,4,7,0,1,3,2,8]
# expect [3,6,7,8] , [3,4,7], [0,1,3], [2,8]
sub_arrays = []
current_sub_array = []

initArray.each_with_index do |element, index|
  if index == 0 || element > initArray[index - 1]
    current_sub_array << element
  else
    sub_arrays << current_sub_array unless current_sub_array.empty?
    current_sub_array = [element]
  end
end
sub_arrays << current_sub_array unless current_sub_array.empty?

sub_arrays.each {|x| puts x.inspect if x.length > 1}