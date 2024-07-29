# frozen_string_literal: true

class Order
  attr_accessor :items

  def initialize(items = [])
    @items = items
  end

  def add_item(item_to_add)
    @items << item_to_add
  end

  def delete_item(item_to_delete)
    @items.delete(item_to_delete)
  end

  def take_items_count
    @items.count
  end

  def calculate_total_sum
    @items.map(&:price).sum
  end
end
