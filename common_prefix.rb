# The longest common prefix may have you scratching your head a lot, doing some crazy string manipulation and looping things
# like you're on a roller coaster, struggling for an hour scratching your head just like I was. Maybe you're a chad and found it so
# easy. Either way, it is stupid easy one you realize that all you have to do is sort the array of strings alphabetically. Once done, simply
# compare the first and last strings to find the longest common prefix, or not as there may not be one.

require 'pp' # A massive one. I don't remember why I required this, but it's useful for printing out hash maps nicely in your terminal.

def longest_common_prefix(strs)
  strings = strs.sort_by(&:downcase) # If you had Apple and banana then banana would come before Apple due to ruby using ASCII
  answer = ''
  strings[0].each_char.with_index do |char, index|
    return answer unless char == strings[strings.length - 1][index]

    answer += char
    answer
  end
end

answer = longest_common_prefix(%w[flower flow flight])
puts answer
