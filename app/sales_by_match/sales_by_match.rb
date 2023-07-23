# frozen_string_literal: true

class SalesByMerchant
  def self.sock_merchant(_n, arr)
    list = Hash.new(0)

    arr.each do |num|
      list[num] += 1
    end

    list.reduce(0) do |memo, (_sock_color_id, total)|
      memo + total / 2
    end
  end
end
