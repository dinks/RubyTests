# Kadane's algorithm to find subarray with the largest sum
def subarr_large(*arr)
  spacer = "\t\t\t"
  max_so_far = -9999999999
  cur_sum = 0
  a = b = s = i = 0
  arr.each_with_index{|element, i|
    printf("Element:%2s#{spacer}Sum:%2s#{spacer}Max So Far:%12s#{spacer}a:%2s#{spacer}b:%2s#{spacer}s:%2s#{spacer}i:%2s\n", element, cur_sum, max_so_far, a, b, s, i)
    cur_sum += element
    if(cur_sum > max_so_far)
      max_so_far = cur_sum
      a, b = s, i
    end
    if(cur_sum < 0)
      cur_sum = 0
      s = i + 1
    end
  }
  p "The Sub array #{arr[a..b].inspect} is the best"
end

subarr_large(-1, 3, 4, 5, -13, -4, 8)

