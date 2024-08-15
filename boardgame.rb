# frozen_string_literal: true

class BoardGame < Game
  attr_accessor :heroes, :length

  def initialize(options = {})
    super(options[:age_limit], options[:amount_of_people], options[:product_name], options[:discription],
          options[:price])
    @length = options[:length]
    @heroes = options[:heroes]
  end
end
