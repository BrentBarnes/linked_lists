
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      @head = Node.new(value, nil)
    else
      last_node = head
      while(!last_node.next_node.nil?)
        last_node = last_node.next_node
      end
      #We are at the end of the list
      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    return puts 'List is empty' if head.nil?

    if !head.nil?
      new_node = Node.new(value, head)
      @head = new_node
    end
  end

  def size
    return puts 'List is empty' if head.nil?
    size = 0

    current_node = head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def print_head
    return puts 'List is empty' if head.nil?

    puts head.value
  end

  def print_tail
    return puts 'List is empty' if head.nil?

    last_node = head
    while !last_node.next_node.nil?
      last_node = last_node.next_node
    end
    puts last_node.value
  end

  def print_list
    return puts 'List is empty' if head.nil?

    current_node = head
    until (current_node.nil?)
      puts current_node.value
      current_node = current_node.next_node
    end
  end

  def at(input)
    return puts 'List is empty' if head.nil?
    return puts 'Error' if input > size
    index = 0

    current_node = head
    until index == input
      return if current_node.nil?
      current_node = current_node.next_node
      index += 1
    end
    puts current_node.value
  end

  def pop
    return puts 'List is empty' if head.nil?

    current_node = head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end

  def contains?(value)
    return puts 'List is empty' if head.nil?
    contains = false

    current_node = head
    until current_node.nil?
      if current_node.value == value
        contains = true
      end
      current_node = current_node.next_node
    end
    contains
  end

  def find(value)
    return puts 'List is empty' if head.nil?
    index = 0

    current_node = head
    until current_node.nil?
      if current_node.value == value
        puts index
        return
      end
      current_node = current_node.next_node
      index += 1
    end
    index
  end

  def ll_to_s
    return puts 'List is empty' if head.nil?
    string = ""

      current_node = head
      until current_node.nil?
        string << "( #{current_node.value} ) -> "
        current_node = current_node.next_node
      end
    puts string << "nil"
  end

  def insert_at(value, index)
    return puts 'Error' if index > size
    return puts 'List is empty' if head.nil?
    current_index = 0

    current_node = head
    until current_node.nil?
      if current_index == (index - 1)
        current_node.next_node = Node.new(value, current_node.next_node)
        return
      else
        current_node = current_node.next_node
        current_index += 1
      end
    end
  end

  def remove_at(index)
    return puts 'Error' if index > size
    return puts 'List is empty' if head.nil?
    current_index = 0

    current_node = head
    until current_node.nil?
      if current_index == (index - 1)
        current_node.next_node = current_node.next_node.next_node
        return
      else
        current_node = current_node.next_node
        current_index += 1
      end
    end
  end

  private

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @next_node = next_node
      @value = value
    end
  end
end

ll = LinkedList.new

ll.append(10)
ll.append(20)
ll.append(30)
ll.prepend(5)
ll.prepend(1)

puts "List contains (print_list):"
ll.print_list
puts "Size of list is:"
puts ll.size
puts "Head of list is:"
ll.print_head
puts "Tail of list is:"
ll.print_tail
puts 'Node #at(index) 3 is:'
ll.at(3)
puts 'Popped last node from list. New list is:'
ll.pop
ll.print_list
puts 'Does the list contain 10?'
puts ll.contains?(10)
puts 'Find the index of the value 30'
puts ll.find(30)
puts 'Linked list to string is:'
ll.ll_to_s
puts 'Inserting node with value 15 at index 3. New list is:'
ll.insert_at(15, 3)
ll.print_list
puts 'Removing node at index 2. New list is:'
ll.remove_at(2)
ll.print_list