# The key to solving this solution is to look past the whole idea of if 'I' comes before 'V' or 'X' then the result is 9, and instead notice the pattern of the entire
# string to begin with.
# All the edge cases where IV is 4 or CD is 400 have one thing is common. Do you notice what they all have in common?
# when you read the number MCMXCIV, read it out to yourself. M - 1000, C - 100, M - 1000, X - 10, L - 50, C - 100, I - 1, V - 5. Notice that the numbers either increase
# or decrease from right to left. M - C is a decrease, but thereafter C - M is an increase. You can use that to solve this problem.
# After just three leetcode questions, I start to realise being good at this stuff has a lot to do with looking at things in a different way, thinking out of the box,
# and noticing patterns.
def roman_to_int(s)
  answer = 0
  hash = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  }
  for i in 0...s.length - 1
    if hash[s[i].to_sym] < hash[s[i + 1].to_sym]
      answer -= hash[s[i].to_sym]
    else
      answer += hash[s[i].to_sym]
    end
  end
  answer += hash[s[-1].to_sym]
end

answer = roman_to_int('MCMXCIV')
puts answer

# Below is the initial solution that I came up with on my own. Most likely this solution misses the key of solving this problem, however, it does indeed work.
# Funny enough, this solution is only 2 ms slower than the above.
def roman_to_int(s)
  answer = 0
  hash = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

  edge = {
    IV: 4,
    IX: 9,
    XL: 40,
    XC: 90,
    CD: 400,
    CM: 900
  }

  skip = false

  s.each_char.with_index do |char, index|
    if skip
      skip = false
      next
    end

    if !edge["#{char}#{s[index + 1]}".to_sym].nil?
      answer += edge["#{char.to_sym}#{s[index + 1]}".to_sym]
      skip = true
      next
    else
      answer += hash[char.to_sym]
    end
  end
  answer
end
