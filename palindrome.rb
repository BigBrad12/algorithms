def palindrome?(x)
  hold = x
  return false if x.negative?
  return true if Math.log10(x).to_i + 1 == 1 || x.zero?
  return false if (x % 10).zero?

  reverse = 0
  num_digits = Math.log10(x).to_i + 1
  (1..num_digits).each do |i|
    reverse += (x % 10) * 10**(num_digits - i)
    x = (x / 10).floor
  end
  return true if reverse == hold

  false
end

# While the above works, if can be better as below
def palindrome_2?(x)
  return false if x.negative?
  return true if x.zero?

  # return false if the last digit is zero
  return false if (x % 10).zero?

  # only reverse half the original number
  reversed_half = 0

  # while the original number is greater than the reversed half, continue executing the loop
  # note that within the loop, we overwrite x using x /= 10, which means x = x / 10
  # if the original number is, for example, 1245, then:
  # the reverse becomes 5, the original becomes 124
  # reverse 54, original 12
  # at this point we stop the loop and compare the results, which will be false
  # if it were 1221 then
  # reverse 1, original 122
  # reverse 12 original 12 which is equal and exit the loop to compare
  while x > reversed_half
    reversed_half = reversed_half * 10 + x % 10
    x /= 10
  end
  return true if x == reversed_half || x == reversed_half / 10

  false
end

result1 = palindrome?(121)
result2 = palindrome_2?(12_121)
puts result1
puts result2
