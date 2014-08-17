module Picky
  module Extensions
    def woohoo
      "woohoo"
    end
  end
  def self.extend_object(o)
    if String === o
      puts "Can't add Picky to a String"
    else
      puts "Picky added to #{o.class}"
      o.extend Extensions
      super
    end
  end
end

s = Array.new
s.extend Picky
# (s = "quick brown fox").extend Picky
p s.woohoo

