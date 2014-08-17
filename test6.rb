class FiboEnumerable
  include Enumerable

  def initialize(tree)
    @tree = tree
  end

  def each
    while @tree
      car,cdr = @tree.call # <--- @tree is a closure
      yield car
      @tree = cdr
    end
  end
end

def fibo(a,b)
  lambda { [a, fibo(b,a+b)] } # <---- this would go into infinite recursion if it weren't in a lambda
end

FiboEnumerable.new(fibo(1,1)).each do |x|
  puts x
  break if x > 100 # we don't actually want to print all of the Fibonaccis!
end
