# frozen_string_literal: true

require 'json'
require 'stringio'
require 'pry'

# Complete the checkMagazine function below.
def checkMagazine(magazine, note)
  magazine_hash = Hash.new(0)
  magazine.each do |e|
    magazine_hash[e] += 1
  end

  note.each do |word|
    return no if magazine_hash[word].zero?

    if (magazine_hash[word]).positive?
      magazine_hash[word] -= 1
      return no if (magazine_hash[word]).negative?
    end
  end

  yes
end

def no
  puts 'No'
end

def yes
  puts 'Yes'
end

magazine = ''
note = ''
count = 0

File.foreach('check_magazine_input.txt') do |line|
  count += 1

  case count
  when 1
    magazine = line.rstrip.split(' ').map(&:to_s)
  else
    note = line.rstrip.split(' ').map(&:to_s)
  end
end

checkMagazine magazine, note
