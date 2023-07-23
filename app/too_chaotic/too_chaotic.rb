# frozen_string_literal: true

require 'pry'

def minimum_bribes(q)
  unswap_ctr = 0
  Hash.new(0)

  unless too_chaotic?(q)
    until sorted?(q)
      q.size.times do |i|
        next if q[i] == i + 1

        e = q[i]

        next unless (e > i + 1) && (e > q[i + 1])

        q[i] = q[i + 1]
        q[i + 1] = e
        unswap_ctr += 1
      end
    end

    return puts(unswap_ctr)
  end

  puts 'Too chaotic'
end

def too_chaotic?(q)
  !q.select.with_index do |e, i|
    (e - (i + 1)) > 2
  end.empty?
end

def sorted?(q)
  q.map.with_index do |e, i|
    (i + 1) == e
  end.all?
end

puts minimum_bribes [1, 2, 5, 3, 7, 8, 6, 4]
# puts minimum_bribes [2,5,1,3,4]
