# frozen_string_literal: true

# The key to understanding how to merge two sorted linked lists is first understanding what a linked list even is.
# It is not your typical array. It's a bunch of 'nodes' or 'items' if you will, and each node has two things.
# - A 'value' or 'val' property / attribute / whatever. This is the value of the node, like 1 or 'hippo'.
# - A 'next' attribute / property / whatever. This holds the next node in the chain.
# Important to remember is that each node is an instance of a class. The class I am talking about is below.
# So when you use node.next, that returns another instance of list node, which has a value, and another 'next' property which returns then the next value in the chain.
class ListNode
  # This is shorthand, and allows you to instantiate this class, and then use '.Val' to return the value of val, or '.Val' = to set the value.
  # You can then also use '.Next' to return the value of 'next' or '.Next' = to set the value of next.
  attr_accessor :val, :next

  # If you just use instance = ListNode.new without any parameters, then the 'val' of instance will be 0 and the value of 'next' will be nil.
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.arr_to_linked_list(arr)
    return nil if arr.empty?

    # Instantiate the class with the first value from the array, at this point head.next is nil and head.val is the value of arr[0].
    head = ListNode.new(arr[0])
    # You can keep 'head' as it is since we want to return the first node of the chain
    # # You can keep 'head' as it is since we want to return the first node of the chain.
    current = head

    # Iterate through the rest of the array
    arr[1..].each do |val|
      # Since, at this point, current.next is still nil, and current.val is arr[0] and we are on arr[1] now, we will chain in arr[1] on current.next.
      # Notice that current.next is being set to another instance of List Node, and we are initializing it with the val from arr[1] and next will be nil.
      current.next = ListNode.new(val)
      # current.val is arr[0] and current.next is another instance of List Node with arr[1] as the value, and nil as the next node, so we want to get into this
      # node now so we can chain on another node to it's 'next' value
      current = current.next
    end

    # Return head, all the other nodes are linked to it.
    head
  end
end

arr = [1, 2, 3, 4, 5, 8]
arr2 = [4, 10]
l1 = ListNode.arr_to_linked_list(arr)
l2 = ListNode.arr_to_linked_list(arr2)

def merge_lists(l1, l2)
  # Create a dummy head, will have val = 0 and next = nil.
  new_head = ListNode.new
  # Get our moving pointer set up.
  new_current = new_head

  # If we keep using '.Next' on l1 and l2 eventually the value of l1 or l2 will become nil since at the end of the list, '.Next' will return nil.
  while l1 && l2
    # Pop
    if l1.val <= l2.val
      # You may have noticed that we're setting new_current.next = l1 instead of new_current = l1 and then moving along the new_current pointer.
      # Doing it that way means we have to move along both the new_current pointer and the l1 pointer. So having head be a dummy value of zero which is a bit weird is worth it.
      new_current.next = l1 # Literally set it to the l1 list itself, at this point it will contain all the other linked nodes of l1 as well, but that's fine.
      # Move along the node for l1
      l1 = l1.next
    else
      new_current.next = l2
      l2 = l2.next
    end
    # At this point, new_current is val = 0 and it's next value is either l1 or l2, so we want to move into that l1 or l2 value to chain on another next.
    new_current = new_current.next
  end
  # At this point, either add the remaining linked nodes of either l1 or l2 if there are any.
  new_current.next = l1 || l2
  # Return head.next, because remember, new_head is val = 0 and it's next value is actually the first node of either l1 or l2, since we used a dummy value to simplify how we
  # move the pointers along.
  new_head.next
end

test = merge_lists(l1, l2)
puts test.inspect
