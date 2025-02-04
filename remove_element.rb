# frozen_string_literal: true

# This problem is quite similar to the remove duplicates problem. Both need an in-place solution and they are very similar.
# I struggled most here with:
# - using nums.each to iterate through the entire array while using a separate pointer, and that double pointer
# also being the answer to the solution.
# - Overwriting the second pointer (which is k) with the current first pointer's value, and not actually swapping the values around.
# - It is not required to move the 'val' elements in the array to the back of the array. It does not matter what value/s are at the back
# of the array, as long as the array elements which are not equal to 'val' are at the front of the array and the number of elements
# in the array that are not equal to val are returned as the answer 'k'.
require 'pp'

def remove_element(nums, val)
  return 0 if nums.empty?
  return 0 if nums.length == 1 && nums[0] == val
  return 1 if nums.length == 1 && nums[0] != val

  # This pointer will either increment alongside each iteration through the array or not.
  k = 0

  # Iterate through each element in the array.
  nums.each do |num|
    # If the current element in the array being iterated on is not equal to 'val', then copy that number to the
    # array[k] position.
    # Hence, if the current element being iterated on IS equal to val, then we do not increment k, and we continue on to the
    # next element.
    # Then, if the next num being iterated on is not equal to val, copy that num (which is not equal to val) to position k (position k IS equal to val).
    next unless num != val

    nums[k] = num
    # Everytime we hit this line, it means that the current number being iterated over is not equal to val, and hence k will also become
    # the number of elements in the array which are not equal to k, which is the answer we are looking for.
    k += 1
  end
  k
end
nums2 = [1, 5, 3, 3]
val2 = 5
# answer1 = remove_element(nums1, val1)
# pp answer1
answer = remove_element(nums2, val2)
pp nums2
pp answer
