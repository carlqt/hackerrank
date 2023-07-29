# frozen_string_literal: true

# Address - Keeps the address of the values
# Record -> Record keeps the count
class DataStorage
  attr_accessor :output_store, :frequency_store

  def initialize
    @frequency_store = Hash.new { |h, k| h[k] = [] }
    @output_store = []
    @storage = Hash.new(0)
  end

  def insert(val)
    result = @storage[val] + 1

    @storage[val] = result

    @frequency_store[result - 1].delete_if { |x| x == val }
    @frequency_store[result].push(val)
  end

  def delete(val)
    return if @storage[val].zero?

    @frequency_store[@storage[val]].delete_if { |x| x == val }
    @storage[val] -= 1
    @frequency_store[@storage[val]].push(val)
  end

  def print(val)
    result = @frequency_store[val].empty? ? 0 : 1
    @output_store.push(result)
  end
end

class FrequencyQueries
  def self.run(queries)
    data_storage = DataStorage.new

    queries.each do |q|
      case q[0]
      when 1
        data_storage.insert(q[1])
      when 2
        data_storage.delete(q[1])
      else
        data_storage.print(q[1])
      end
    end

    data_storage.output_store
  end
end