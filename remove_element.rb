# frozen_string_literal: true

require 'pp'

def remove_element(nums, val)
  return 0 if nums.empty?
  return 0 if nums.length == 1 && nums[0] == val
  return 1 if nums.length == 1 && nums[0] != val

  k = 0

  nums.each do |num|
    if num != val
      nums[k] = num
      k += 1
    end
  end
  k
end
nums2 = [1, 5, 3, 3]
val2 = 5
# answer1 = remove_element(nums1, val1)
# pp answer1
answer = remove_element(nums2, val2)
pp answer
