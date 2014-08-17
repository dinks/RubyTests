def gcd(b,m)
  while true do
    if m==0
      return b
    end
    r=b%m
    b=m
    m=r
  end
end

def f(x,n)
  ((x**2) + 1) % n
end

def factor(n)
  y = (rand*100).to_i * n / 100
  m = (rand*100).to_i * n / 100
  r = q = 1
  begin
    x = y
    1.upto(r) do |i|
      y = f(y,n)
    end
    k = 0
    begin
      ys = y
      1.upto([r-k, m].min) do |j|
        y = f(y, n)
        q = (q * (x-y).abs) % n
      end
      g = gcd(q,n)
      k += m
    end while k < r and g <= 1
    r *= 2
  end while g <= 1

  if g == n
    begin
      ys = f(ys, n)
      g = gcd((x-ys).abs, n)
    end while g <= 1
  end
  g
end
