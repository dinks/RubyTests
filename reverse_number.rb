def rev(n)
  reversed = 0
  while n != 0
    m = n%10
    reversed = (reversed*10) + m
    n = (n/10).to_i
  end
  reversed
end

p rev(1323.22)
