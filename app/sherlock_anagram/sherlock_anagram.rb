# frozen_string_literal: true

class SherlockAnagram
  def self.run(s)
    new.sherlock_anagram(s)
  end

  def substrings(string)
    string_array = string.chars
    container = Hash.new(0)

    # abba -> [a, b, b, a]
    string_array.each.with_index do |_s, i|
      substring = string_array[i..] || []

      substring.size.times do |i2|
        end_index = i2 + i
        key = string_array[i..end_index]&.sort&.join

        container[key] += 1
      end
    end

    container
  end

  def sherlock_anagram(str)
    # get all substrings
    substrings_list = substrings(str)

    # Formula to get number of copmarisons in a set
    # n * (n - 1) / 2
    substrings_list.values.reduce(0) do |memo, val|
      memo + (val * (val - 1) / 2)
    end
  end
end
