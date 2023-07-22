class SalesByMerchant
  def self.sock_merchant(n, arr)
    list = Hash.new(0)
    lists = []

    arr.each do |num|
      list[num] += 1
    end

    list.reduce(0) do |memo, (sock_color_id, total)|
      memo + total / 2
    end
  end
end