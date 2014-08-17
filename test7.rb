class LispyEnumerable
  include Enumerable

  def initialize(tree)
    @tree = tree
  end

  def each
    while @tree
      car,cdr = @tree
      yield car
      @tree = cdr
    end
  end
end


class Lazy
  def initialize(&generator)
  @generator = generator
  end

  def method_missing(method, *args, &block)
  evaluate.send(method, *args, &block)
  end

  def respond_to?(method)
    evaluate.respond_to?(method)
  end

  def evaluate
    @value = @generator.call unless @value
    @value
  end
end

def lazy(&b)
  Lazy.new &b
end

def fibo(a,b)
  lazy { [a, fibo(b,a+b)] }
end

LispyEnumerable.new(fibo(1,1)).each do |x|
  puts x
  break if x > 200
end

