def is_valid(s)
  return false if s.length.odd?

  hash = {
    ')': '(',
    ']': '[',
    '}': '{'
  }

  stack = []

  s.each_char do |char|
    if hash[char.to_sym].nil?
      stack.push(char)
    elsif stack.empty? || stack.pop != hash[char.to_sym]
      return false
    end
  end
  stack.empty?
end

answ = is_valid('()[[{}')
puts answ
