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

  # my_all? method
  def my_all?
    self.my_each do |a|
      return false unless yield(a)
    end
    true
  end

  #my_any? method
  def my_any?
    self.my_each do |a|
      return true unless yield(a)
    end
    false
  end

  #my_none? method
  def my_none?
    self.my_each do |n|
      return false unless !yield(n)
    end
    true
  end

  #my_count method
  def my_count
    counter = 0
    self.my_each do |c|
      if block_given?
        if yield(c)
          counter += 1 
        end
      else
        counter = self.length
      end
    end
    counter
  end

  #my_map method
  def my_map(proc = nil)
    result = Array.new
    if proc
      my_each do |p|
        result << proc.call(p)
      end
    else
      my_each do |a|
        result << yield(a)
      end
    end
    result
  end

  # my_inject method
  def my_inject(begin = self[0])
    result = begin
    self.my_each do |i|
      next if begin == i
      result = yield(result, i)
    end
    result
  end
  
end

# tests
arr = [1, 2, 3, 4, 5]

#arr.my_each { |x| puts x * 2 }

#arr.my_each_with_index {| i,j | puts i.to_s + " " + j.to_s }

#arr.my_select { |i| puts i % 2 == 0 }

#arr.my_all? { |i| puts i > 2 } # => false

#arr.my_any? { |i| puts i < 0 } # => false

#puts arr.my_none?{|a| a.nil? } # => true

#puts arr.my_count # => 5

#puts arr.my_map { |i| i * 2} # => [2, 4, 6, 8, 10]
