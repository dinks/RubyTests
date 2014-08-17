def seprtr
  puts "-"*30
end

class Abc
  attr_accessor :name, :address
  def initialize
    p "Abc Init"
  end
  def var_args(*a)
    p a
  end
  class << self
    def tt
      p "TTS"
    end
  end
end

class Abcd < Abc
  def initialize
    p "Abcd Init"
  end
  def b_to_p(&t)
    t.call(10)
  end
  def self.my_priv
  end
  private_class_method :my_priv
end

# a = Abcd.new
# a.name = "Dinks"
# p a.name
# Abcd.tt
# a.var_args(1,4,2,1)
# a.b_to_p {|h| p h}
# seprtr

# g = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# p g.inject {|s,n| s += n}
# seprtr

# o = Proc.new { p 'test'}
# (1..5).each(&o)

# def fib(upto)
#   a = []
#   i1, i2 = 0, 1
#   g = Proc.new {|i1, i2|
#     a << i2
#     i1, i2 = i2, i1+i2
#   }
#   g.call(i1, i2) while i2 <= upto
#   a
# end

module Lola
  def lol
    p 'lol'
  end
end

module Test
  extend Lola
  def self.included(base)
    base.send(:extend, ClassMethods)
    base.send(:include, InstanceMethods)
  end
  module ClassMethods
    def at
      puts 'class method'
    end
  end
  module InstanceMethods
    def gg
      10 if !nil
    end
  end
end

Test.lol

class Test2
  attr_accessor :w
  attr :o
  include Comparable
  include Test
  def <=>(other)
    self.w <=> other.w
  end
end

Test2.at
l = Test2.new
p l.gg


p (:asString).to_i
p (:asString).inspect
p (:asString).id2name
id = :asString
p ":__#{id.to_i}__"
p "#{id.inspect}"

module Cmplctd
  module InstanceMethods
    def instancetest_with_crap(*args)
      # Do Something more
      instancetest_without_crap(*args)
    end
  end
  module ClassMethods
    def test_with_crap(*args)
      # Do something more
      test_without_crap(*args)
    end
  end
  def self.included(base)
    base.class_eval do
      extend ClassMethods
      class << self
        alias_method_chain :test, :crap
      end
      include InstanceMethods
      alias_method_chain :instancetest, :crap
    end
  end
end

