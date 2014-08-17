def diamond(height)
  (1...height*2).step(2).each do |e|
    no_of_asterisks = (e > height) ? (height*2 - e) : e
    split_no_of_spaces = (height - no_of_asterisks) / 2
    (1..split_no_of_spaces).each{ print ' ' }
    (1..no_of_asterisks).each{ print '*'}
    (1..split_no_of_spaces).each{ print ' ' }
    p ''
  end
end

diamond(13)
