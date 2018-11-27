require 'pry'

test_input = [[2,6,8],[3,5,7],[1,8,1],[5,9,15]]

def array_manipulation(n, queries)
  input = Hash.new(0)

  queries.each do |row|
    a,b,k = row
    input[a] += k
    input[b+1] -= k
  end

  greatest_value = 0
  sorted_keys = input.keys.sort
  tmp = 0

  sorted_keys.each_with_index do |e, i|
    tmp += input[e]

    greatest_value = tmp if tmp > greatest_value
  end

  greatest_value
end
