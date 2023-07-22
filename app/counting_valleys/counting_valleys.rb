class CountingValleys
  STEPS = {
    'D' => -1,
    'U' => 1
  }

  def self.count(steps, path)
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

      if steps[i-1].zero? && s == -1
        count += 1
      end
    end

    count
  end
end
