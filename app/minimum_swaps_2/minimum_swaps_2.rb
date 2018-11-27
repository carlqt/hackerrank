require 'pry'

def minimum_swaps(q)
  unswap_ctr = 0
  while !sorted?(q)
    q.size.times do |i|
      next if q[i] == i + 1
      e = q[i]

      if (e != q[i+1])
        swap_index = q.find_index{|el| el == i+1 }
        q[i] = q[swap_index]
        q[swap_index] = e
        unswap_ctr = unswap_ctr + 1
      end
    end
  end

  unswap_ctr
end

def sorted?(q)
  q.map.with_index do |e, i|
    (i+1) == e
  end.all?
end

puts minimum_swaps([4,3,1, 2])
