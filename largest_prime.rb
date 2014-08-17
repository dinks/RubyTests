# https://projecteuler.net/problem=3

require 'benchmark'

def largest_prime(n)
  return nil if n == 1
  lp = n
  (2..Math.sqrt(n).to_i).each { |i|
    break if lp <= i
    lp /= i while (lp > i && lp % i == 0)
  }
  lp
end

number = 1876191413
lp = 0

Benchmark.bm do |bm|
  bm.report do
    lp = largest_prime(number)
  end
end

# http://www.wolframalpha.com/input/?i=greatest+prime+factor+of+1876191413
puts "Largest prime factor of #{number} is #{lp}"
