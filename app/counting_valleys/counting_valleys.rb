# frozen_string_literal: true

class CountingValleys
  STEPS = {
    'D' => -1,
    'U' => 1
  }.freeze

  def self.count(_steps, path)
    path_arr = path.chars
    tracking_steps = [0]

    path_arr.each do |s|
      pathway = STEPS[s] + (tracking_steps.last || 0)
      tracking_steps << pathway
    end

    valley_count(tracking_steps)
  end

  def self.valley_count(steps)
    count = 0

    steps.each.with_index do |s, i|
      next if i.zero?

      count += 1 if steps[i - 1].zero? && s == -1
    end

    count
  end
end
