class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.arr_to_linked_list(arr)
    return nil if arr.empty?

    head = ListNode.new(arr[0])
    current = head

    arr[1..].each do |val|
      current.next = ListNode.new(val)
      current = current.next
    end

    head
  end
end

arr = [1, 2, 3, 4, 5, 8]
arr2 = [4, 10]
l1 = ListNode.arr_to_linked_list(arr)
l2 = ListNode.arr_to_linked_list(arr2)

def merge_lists(l1, l2)
  new_head = ListNode.new
  puts new_head.val
  puts new_head.next.nil?
  new_current = new_head

  while l1 && l2
    if l1.val <= l2.val
      new_current.next = l1
      l1 = l1.next
    else
      new_current.next = l2
      l2 = l2.next
    end
    new_current = new_current.next
  end
  new_current.next = l1 || l2
  new_head.next
end

test = merge_lists(l1, l2)
puts test.inspect
