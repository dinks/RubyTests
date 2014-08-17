class A
  class << self
    def g
      p "jdhadaj"
    end
  end
  def self.h
    p "dqqd"
  end
  def method_missing(meth, *arg, &block)
    p "No Method called #{meth} from #{self}"
  end
end

a = A.new
b = A.new

class << a
  def tt
    p 'hddahs'
  end
end

A.g
A.h

a.h
b.h

a.tt
b.tt
