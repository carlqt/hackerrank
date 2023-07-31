
def isValid(str)
  str_array = str.chars

  # { key => count }
  parse_list = Hash.new(0)

  str_array.each do |s|
    parse_list[s] += 1
  end

  meta = uniq_count(parse_list.values)

  valid?(meta)
end

# meta = { k(frequency value), value(count of chars) }
def valid?(meta)
  values = meta.values
  keys = meta.keys

  return 'YES' if keys.size == 1
  return 'NO' if keys.size > 2

  max_value = keys.max
  min_value = keys.min

  return 'YES' if meta[min_value] == 1 && (min_value - 1).zero?
  return 'NO' if meta[max_value] > 1

  if max_value - 1 == min_value
    'YES'
  else
    'NO'
  end
end

def uniq_count(arr)
  result = Hash.new(0)

  arr.each do |a|
    result[a] += 1
  end

  result
end
