# frozen_string_literal: true

require 'pry'

def array_manipulation(_n, queries)
  input = Hash.new(0)

  queries.each do |row|
    a, b, k = row
    input[a] += k
    input[b + 1] -= k
  end

  greatest_value = 0
  sorted_keys = input.keys.sort
  tmp = 0

  sorted_keys.each_with_index do |e, _i|
    tmp += input[e]

    greatest_value = tmp if tmp > greatest_value
  end

  greatest_value
end
