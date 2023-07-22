class RepeatedString
  def self.run(substring, n)
    current_a_count = substring.chars.count { |s| s == 'a' }
    multiplyer = n / substring.size
    string_extend = n % substring.size

    return (current_a_count * multiplyer) if string_extend.zero?

    substring_of_extend = substring[0, string_extend] || ''
    
    current_a_count * multiplyer + substring_of_extend.chars.count { |s| s == 'a' }
  end
end
