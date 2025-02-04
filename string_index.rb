# frozen_string_literal: true

# O.k. so I'm thinking of a dual pointer approach most likely.
# Iterate over each character in haystack.
# If the current char is equal to the char at pointer k in needle, then we want to increment k, and add record the index in haystack.
# Somehow we need to figure out that yes, the whole needle was matched in haystack, and the first whole match started at this index.
# If we match the first char of needle, but then the second char of needle wasn't matched, k should revert to zero again.
# So somehow we need a way to know the whole needle was matched.
# Wait, it's easy to return the start index of the first match, because if we can find a way to say, yea, the whole thing was matched,
# then boom, return the start index at which that happened.
# If the matching began, but then didn't match the whole thing, then reset k, and go again.
# O.k. so we got finding the answer if needle does exists in haystack, however returning -1 as the answer is the entire needle is not present
# in haystack. Why is it wanting me to return -1 if that's the case?
# What if we initialize k as -1 instead of 0. If I do that, then it's difficult or strange to use as a pointer since we'll need to add 1
# to it to work initially, but let's give it a go.
# Almost there, another trouble is, what if the last character in haystack matches to the first character of needle and needle has not yet
# been matched.
# This approach is not working.
# I think another approach is to iterate through the string, until we find the first character of needle in haystack.
# Once we find it, then set a pointer to the index of haystack, and then pick out the next x characters of needle's length.
# If the returned value is equal to needle, then return the index at which we started. If not, then increment the pointer, and try again.
# This can be a while answer == -1 loop, and when we find the needle, then change answer to the index that we start at.
require 'pp'
def str_str(haystack, needle)
  return -1 if needle.length > haystack.length

  answer = -1
  k = 0

  while answer == -1 && k < haystack.length
    if haystack[k] == needle[0]
      substring = haystack[k, needle.length]
      return answer = k if needle == substring
    end
    k += 1
  end
  answer
  # clop
  # clip

  # return -1 if needle.length > haystack.length
  #
  # k = 0
  # answer = -1
  # haystack_pointer = 0
  # haystack.each_char.with_index do |char, index|
  #   if char == needle[k]
  #     puts "char is #{char}"
  #     puts "index is #{index}"
  #     answer = index if k == 0 && haystack.length - index + 1 >= needle.length
  #     k += 1
  #     haystack_pointer += 1
  #     puts "answer is #{answer}"
  #     puts "k length #{k}"
  #     puts "needle length #{needle.length}"
  #     return answer if needle.length == k
  #
  #     puts 'no return'
  #
  #     next
  #   end
  #   puts 'hi'
  #   k = 0
  #   answer = -1
  # end
  # answer
end

haystack1 = 'aall'
needle1 = 'll'

answer = str_str(haystack1, needle1)
pp answer
