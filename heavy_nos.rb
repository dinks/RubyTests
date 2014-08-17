def is_heavy?(n)
  sum = n.to_s.each_byte.inject{|sum, i| sum + i - 48}
  sum -= 48
  (sum/n.to_s.length) > 7
end

def solution(a, b)
  heavy_nos = []
  (a..b).each do |n|
    heavy_nos << n if is_heavy?(n)
  end
  heavy_nos
end

ranges = (0..900000).step(1000).to_a

ranges[1..-1].each_with_index do |r, index|
  # puts "--  --  --  --  --  --  --  --"
  ns = solution(ranges[index], r)
  puts "From #{ranges[index]} to #{r} there are \t\t\t #{ns.length}" if ns.length > 0
  # p ns
end
