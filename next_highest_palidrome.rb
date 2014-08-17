def round_up(n)
  n%10 == 0 ? n : n + 10 - (n%10)
end

def solution(n)
  darr = n.to_s.split('').collect{|d| d.to_i}
  length_is_odd = (darr.length%2 != 0)
  m = (darr.length/2).to_i
  left_half = darr[0...m]
  middle = darr[m]

  if length_is_odd
    increment = 10 ** (darr.length/2)
    new_num = (left_half + [middle] + left_half.reverse).join.to_i
  else
    increment = (1.1 * (10 ** (darr.length/2))).to_i
    new_num = (left_half + left_half.reverse).join.to_i
  end

  if new_num > n
    return new_num
  end

  if middle == 9
    return solution(round_up(n))
  else
    return new_num+increment
  end

end

p solution(124456)
