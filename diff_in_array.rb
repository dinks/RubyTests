
a = [10, 3, 6, 8, 9, 4, 3]

def difference_in_array(ary)
  max = result = 0

  ary.reverse.each do |element|
    max = element if max < element
    tmp = max - element
    result = tmp if tmp > result
  end
  result
end

puts difference_in_array(a)
