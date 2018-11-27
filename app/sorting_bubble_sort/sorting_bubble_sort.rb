require 'pry'

def countSwaps(q)
  swap_ctr = 0

  q.size.times do |i|
    q.drop(i+1).each.with_index do |_, inner_i|
      inner_index_val = inner_i + i + 1
      if q[i] > q[inner_index_val]
        temp = q[i]
        q[i] = q[inner_index_val]
        q[inner_index_val] = temp
        swap_ctr += 1
      end
    end
  end

  puts("Array is sorted in #{swap_ctr} swaps.")
  puts("First Element: #{q[0]}")
  puts("Last Element: #{q[-1]}")
end

puts countSwaps([1,2,3])
