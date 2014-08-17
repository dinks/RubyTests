# A string is a palindrome if it has exactly the same sequence of characters when read left-to-right as it has when read right-to-left. For example, the following strings are palindromes:

# "kayak",
# "codilitytilidoc",
# "neveroddoreven".

# A string A is an anagram of a string B if A can be obtained from B by rearranging the characters. For example, in each of the following pairs one string is an anagram of the other:
#

def anagram(s)
  temp = 0
  s.each_byte do |letter|
    temp ^= 1 << (letter - 97)
  end

  return true if temp == 0 || (temp & (temp-1)) == 0
  false
end

p anagram('abaccb')
