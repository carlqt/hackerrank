# frozen_string_literal: true

class LCS
  attr_reader :store

  def initialize(s1, s2)
    @string1 = s1.chars.unshift(0)
    @string2 = s2.chars.unshift(0)
    @store = []
  end

  def run
    setup_store

    store.size.times do |i|
      next if i.zero?

      store[i].size.times do |i2|
        next if i2.zero?

        if @string1[i] == @string2[i2]
          store[i][i2] = 1 + store[i-1][i2-1]
        else
          store[i][i2] = [store[i-1][i2], store[i][i2-1]].max
        end
      end
    end

    store[-1][-1]
  end

  def setup_store
    @string1.size.times do |i|
      @store[i] ||= [0]

      @string2.size.times do |i2|
        @store[i][i2] = 0
      end
    end
  end
end

def common_child(s1, s2)
  lcs = LCS.new(s1, s2)
  lcs.run
end
