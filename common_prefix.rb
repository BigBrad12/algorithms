require 'pp'

def longest_common_prefix(strs)
  strings = strs.sort
  answer = ''
  strings[0].each_char.with_index do |char, index|
    return answer unless char == strings[strings.length - 1][index]

    answer += char
    answer
  end
end

answer = longest_common_prefix(%w[flower flow flight])
puts answer
