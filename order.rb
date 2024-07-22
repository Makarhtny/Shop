class Order
  attr_accessor :items

  def initialize(items=[])
    @items = items
  end

  def add_item(item)
    @items << item
  end

  def delete_item(item)
    @items.delete(item)
  end

  def take_items_count
    @items.count
  end

  def calculate_total_sum
    sum = 0
    @items.each { |item| sum += item.price }
    sum
  end
end
