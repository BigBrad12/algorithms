# Initialize an empty hash map for student grades
# grades = {}
#
# 1. Insert (add) student grades
# grades['Alice'] = 95   # Add Alice's grade
# grades['Bob'] = 88     # Add Bob's grade
# grades['Charlie'] = 72 # Add Charlie's grade
# puts "Grades after insertion: #{grades}"
#
# 2. Lookup a grade (quick access by key)
# Alice_grade = grades['Alice']
# puts "Alice's grade: #{alice_grade}"
#
# 3. Update a grade (overwrite the value for a key)
# grades['Bob'] = 92
# puts "Grades after updating Bob's grade: #{grades}"
#
# 4. Delete a student's grade
# grades.delete('Charlie')
# puts "Grades after deleting Charlie: #{grades}"
#
# 5. Check if a student exists
# if grades.key?('Alice')
#   puts "Alice's grade exists in the system!"
# else
#   puts "Alice's grade does not exist."
# end

# 6. Iterating over the hash
# grades.each do |name, grade|
#   puts "#{name} has a grade of #{grade}."
# end

def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, index|
    return [hash[target - num], index] unless hash[target - num].nil?

    hash[num] = index
  end
end

two_sum([3, 2, 4], 6)
