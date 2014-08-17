class Tgen
  def initialize(&block)
    instance_eval &block if block
  end
  def s(ss)
    puts ss
  end
  def p(pp)
    puts pp
  end
end

def templator(&block)
  Tgen.new(&block)
end

h = templator do
  s "wooho"
  p "weehe"
end

p h
