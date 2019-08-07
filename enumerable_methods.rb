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
end

# tests

#[1, 2, 3].my_each { |x| puts x * 2 }

#[1, 2, 3].my_each_with_index {| i,j| puts i.to_s + " " + j.to_s }

