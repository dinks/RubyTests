# encoding: utf-8

class Person

  code = proc { puts self }

  code2 = proc { |greet| puts "#{greet} #{self}" }

  define_method :name do
    self.class.instance_eval &code
  end

  define_method :name2 do
    self.class.instance_exec "Hello", &code2
  end

  @@code = proc { puts self }

  def n
    self.class.instance_eval &@@code
  end
end

class Developer < Person;end

Person.new.n
Developer.new.n

Person.new.name
Developer.new.name

Person.new.name2
Developer.new.name2
