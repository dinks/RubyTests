class A
  def self.build
    n = self.new
    yield n
    n
  end
end

class B < A
  attr_accessor :t
end

class C < A
  attr_accessor :t
end

b1 =  B.build do |b|
        b.t =10
      end
c1 =  C.build do |c|
        c.t = 30
      end

p b1.t
p c1.t
