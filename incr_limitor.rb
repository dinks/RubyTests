a = [ 6, 1, 1,  4, 6, 6, 5, 6, 6, 2, 6, 6,4, 6, 6, 3, 6, 1, 6, 6, 6, 6, 6 ]

def resultant(ary, n)

  result = Array.new(n, 0)
  maximum = 0
  reset = 0

  ary.each do |element|
    raise RuntimeError if element < 1 || element > n + 1
    if element <= n
      result_index = element - 1
      if result[result_index] < reset
        result[result_index] = reset + 1
      else
        result[result_index] = result[result_index] + 1
      end
      maximum = result[result_index] if result[result_index] > maximum
    else
      reset = maximum
    end
  end

  result.map do |element|
    element < reset ? reset : element
  end
end

p resultant(a, 5)
