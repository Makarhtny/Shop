# frozen_string_literal: true

class Game < Item
  attr_accessor :age_limit, :amount_of_people

  def initialize(age_limit, product_name, discription, price, amount_of_people)
    super(product_name, discription, price)
    @age_limit = age_limit
    @amount_of_people = amount_of_people
  end
end
