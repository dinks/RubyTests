def equi ( a )
    pivot = -1
    sum = current_sum = 0
    sum = a.inject{|sum, element| sum +=element}
    a.each_with_index{|element, index|
        pivot = index if(current_sum == sum-current_sum-element)
        current_sum += element
        p "#{index} #{current_sum} -- #{sum-current_sum}"
    }
    pivot
end

p equi([-3, 0, 3])
