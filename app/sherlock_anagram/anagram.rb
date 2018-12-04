def anagram?(str1, str2)
  # str1_hash = Hash.new(0)

  # str1.chars.each do |str|
  #   str1_hash[str] += 1
  # end

  # str2.chars.each do |str|
  #   str1_hash[str] -= 1

  #   return false if str1_hash[str].negative?
  # end

  # str1_hash.keys.all?{ |k| str1_hash[k].zero? }
  str_hash = {}
  str1_key = str1.chars.sort.join
  str2_key = str2.chars.sort.join

  str_hash[str1_key] = 1

  str_hash.key?(str2_key)
end

def sherlock_anagram(str)
  container_size = 1
  str_array = str.chars
  total = 0

  # exit condition if container_size >= str.size
  while container_size < str.size
    str_hash = Hash.new(0)
    index = 0

    # loop through each sub array/string
    loop do
      # sort then store the value, as a key, in str_hash
      end_index = index + (container_size - 1)
      value = str_array[index..end_index].sort
      str_hash[value] += 1

      # str_hash[value] is >= 2, it is an anagram, add to total
      if str_hash[value] >= 2
        total += 1
      end

      index += 1
      break if end_index >= str_array.size
    end
    # str_array.each_cons(container_size)
    container_size += 1
  end

  total
end

# puts anagram?("abcda", "aacbd")

puts sherlock_anagram("cdcd")
