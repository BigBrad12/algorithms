# Hash maps are the way to go here, especially since they are likely well used and useful in the real world.
# Initially I tried using a nested loop, this is bad for performance. Even if you optimize a nested loop and gather the data you need in
# the map, it's still going to be a pain to extract the answer.
# There is one key to this, and that is realizing the solution doesn't necessarily lie in code itself, but in algebra.
# For each number you're looping on in the array, calculate target - number = the number you are looking for. Having the number that will
# satisfy the solution for each number you're looping on greatly simplifies the problem.
# Then check your map to see if that number is present, and if it is grab it's index and use the current numbers index and return those two
# indices.

def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, index|
    complement = target - num
    return [hash[complement], index] if hash[complement]

    hash[num] = index
  end
end

two_sum([3, 2, 4], 6)
