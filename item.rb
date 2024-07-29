# frozen_string_literal: true

class Item
  attr_accessor :product_name, :discription, :price

  def initialize(product_name, discription, price)
    @product_name = product_name
    @discription = discription
    @price = price
  end
end
