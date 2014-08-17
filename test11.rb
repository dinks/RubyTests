module Test3
  def a
    p "A"
  end
end
module Test
  # include Test3
  extend Test3
  def b
    p "B"
  end
end

class Test2
  # include Test
  extend Test
end

Test.a
Test2.b
# Test2.new.b
