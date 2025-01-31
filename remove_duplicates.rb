# frozen_string_literal: true

# This is an 'in place' algorithm. What that means, a really basic explanation from my noob self, is that we need to modify the
# existing array, and not create a new one. This question asks to return the number of unique values in the array, that's easy.
# What is more complicated is to also modify the nums array to have all the unique values in the start of the array as well.
# So if you have an array input of [0, 0, 1, 1, 2, 2], the end result should have nums as [0, 1, 2, 1, 2, 2]
# The answer is 3, meaning there are 3 unique values in the array, and you can find those 3 values now in array[0] array[1] and array[2]
def remove_duplicates(nums)
  return 0 if nums.empty?

  k = 0

  # This is basically do this many iterations, from 1, 2, 3, 4, since we have the pointer 'k' as zero, we don't need to iterate 5 times, only 4 times.
  (1...nums.length).each do |i|
    next if nums[k] == nums[i]

    k += 1
    nums[k] = nums[i]
  end
  # Since they want the number of unique values, and since 'k' started at zero, we need to increment k by one before
  # returning it as the answer.
  k + 1
end

nums = [0, 0, 2, 3, 4]
answer = remove_duplicates(nums)
puts answer
