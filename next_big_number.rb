def solution(n)
  digits = n.to_s.each_byte.collect{|d| d - 48}
  pivot = digits.length - 1
  while pivot >= 0
    pivot -= 1
    if digits[pivot+1] > digits[pivot]
      break
    end
  end

  return n if pivot == -1

  before_pivot  = digits[0..pivot]
  after_pivot   = digits[pivot+1..-1]

  last_digit    = before_pivot[-1]
  current_replaceable_index = -1
  current_lowest = 10
  after_pivot.each_with_index do |ap, index|
    if ap > last_digit && ap < current_lowest
      current_lowest = ap
      current_replaceable_index = index
    end
  end

  after_pivot[current_replaceable_index] = before_pivot[-1]
  before_pivot[-1] = current_lowest

  after_pivot.sort!
  (before_pivot + after_pivot).join.to_i
end

p solution(34722641)
