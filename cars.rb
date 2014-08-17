def solution(a)
    # a looks like  [0, 1, 0, 1, 1]
    # s starts      [0, 0, 0, 0, 0]
    # got 0 -> s        [0, 0, 0, 0, 0], carnos = 1
    # got 1(diff) -> s  [0, 1, 0, 0, 0], if diff then carnos
    # got 0 ->       s  [0, 1, 0, 0, 0], carnos = 2
    # got 1 ->       s  [0, 1, 0, 2, 0], if diff then carnos
    # got 1 ->       s  [0, 1, 0, 2, 2], if diff then carnos
    # sum of s is 5
    s = Array.new(a.length, 0)
    diff = a[0]
    cars = 0
    a.each_with_index do |e, index|
        if e == diff
            cars += 1
            s[index+1] = 0
        else
            s[index+1] = cars
        end
    end
    s.inject{|sum, e| sum + e}
end

p solution([1, 0, 1, 0, 1, 0, 1, 0])
