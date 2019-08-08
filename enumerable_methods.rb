# frozen_string_literal: true

# Enumerable module

module Enumerable
  # my_each method

  def my_each
    i = 0
    while i < self.length
       yield(self[i])
       i += 1
    end
    self
  end

  # my_each_with_index method
  
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  # my_select method
  def my_select
    array = Array.new
    self.my_each do |s|
      if yield(s)
        array.push(s)
      end
    end
    array
  end

end

# tests
arr = [1, 2, 3, 4, 5]

#arr.my_each { |x| puts x * 2 }

#arr.my_each_with_index {| i,j | puts i.to_s + " " + j.to_s }

arr.my_select { |i| puts i % 2 == 0 }