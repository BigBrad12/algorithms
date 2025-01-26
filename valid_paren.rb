# frozen_string_literal: true

# Alas, I continue to find it truly difficult to notice the patterns that are the key to solving these problems.
# The key is to separate a closing bracket from an open one.
# Iterate over the string, and if it's an open bracket, add it to an array.
# The moment you come accross a closing bracket, check the last value of the array that you have been adding opening brackets to, and
# check to see if it is the opening bracket for the closing bracket that you are currently on.
#
# e.g. '(([{}]))'
# First char is open, add to array ['(']
# Second is the same, ['(', '(']
# Third is the same, ['(', '(', '[']
# Fourth is the same, ['(', '(', '[', '{']
#
# Fifth is a closing bracket, so pop the value from the array and see if it is the matching open for the close.
# '{' opens '}' and if that's not the case, return false and end, since it's true here and popped from array, array is now ['(', '(' '[']
#
# Next is ']' which is a closing bracket
# Pop the latest value from array and see if it's the opening bracket for this closing bracket that you found
# '[' is the open for ']' and so it's true, therefor continue, now your array is ['(', '(']
# # Continue to do this until the array you created with open brackets is empty.

def is_valid(s)
  return false if s.length.odd?

  hash = {
    ')': '(',
    ']': '[',
    '}': '{'
  }

  stack = []

  s.each_char do |char|
    # check to see what kind of bracket it is, open or closing?
    if hash[char.to_sym].nil?
      # if it's an opening bracket, add it to the array
      stack.push(char)
      # if the stack is empty, but we found a closing bracket, that means there is a mismatch, and hence the value is false
      # if the most recent matches, we don't return false and continue
    elsif stack.empty? || stack.pop != hash[char.to_sym]
      return false
    end
  end

  # the above continues until the stack is empty, if the stack is empty, all were matched, and result is true
  stack.empty?
end

answ = is_valid('()[[{}')
puts answ
