def partition(arr, left, right, pivot)
  si = left
  (left..right).each do |index|
    if arr[index] < pivot
      arr[index], arr[si] = arr[si], arr[index]
      si += 1
    end
  end
  si-1
end

def kth_largest(arr, left, right, k)
  p "Arr #{arr.inspect} Left #{left} Right #{right} k #{k}"
  length = right-left+1
  return unless 1<=k && k<=length
  return arr[left..right+1].sort[k-1] if length <= 5
  num_medians = length/5
  medians = []
  (0...num_medians).each do |m|
    medians << kth_largest(arr, left+(m*5), left+((m+1)*5)-1, 3)
  end
  pivot = kth_largest(medians, 0, medians.length-1, medians.length/2+1)
  p "Pivot #{pivot}"
  pi = partition(arr, left, right, pivot)
  rank = pi - left + 1
  p "Rank #{rank}"
  if k <= rank
    kth_largest(arr, left, pi, k)
  else
    kth_largest(arr, pi+1, right, k-rank)
  end
end

def solution(arr, k)
  p kth_largest(arr, 0, arr.length-1, k)
end

solution([7, 6, 5, 5, 3, 2, 1], 1)
