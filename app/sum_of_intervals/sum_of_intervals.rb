# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

class Interval
  extend Forwardable

  def_delegators :@interval, :first, :last, :cover?

  def initialize(interval)
    @interval = (interval[0]..interval[1])
  end

  def size
    @interval.count - 1
  end

  def overlaps?(other_interval)
    cover?(other_interval.first) || other_interval.cover?(first)
  end

  def combine(other_interval)
    self.class.new([[other_interval.first, first].min, [other_interval.last, last].max])
  end

  def combinable?(other_interval)
    return false if other_interval.nil?

    overlaps?(other_interval)
  end
end

class SumOfIntervals
  def initialize(intervals)
    @intervals = intervals.sort.map { |i| Interval.new(i) }
  end

  def sum
    combined_intervals = combine_intervals(@intervals)
    combined_intervals.map(&:size).reduce(:+)
  end

  private

  def combine_intervals(intervals)
    new_interval = []
    combined_indices = []

    intervals.each.with_index do |_interval, index|
      inner_index = index

      unless combined_indices.include?(index)
        new_interval << intervals[index..].reduce do |mem, inner_interval|
          inner_index += 1

          if mem.combinable?(inner_interval)
            combined_indices << inner_index
            mem = mem.combine(inner_interval)
          end

          mem
        end
      end
    end

    new_interval
  end
end
