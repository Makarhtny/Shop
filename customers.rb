# frozen_string_literal: true
require_relative 'order'

class Customers
  attr_accessor :name, :email, :phone, :adress

  def initialize(name:, email:, phone:, adress:)
    @name = name
    @email = email
    @phone = phone
    @adress = adress
  end

  def create_orders
    @order = Order.new
  end

  def pay_for_order
    puts "You should pay #{@order.calculate_total_sum}"
  end

  def recieve_a_bill
    puts "MR #{@name} paid for a #{@order}."
  end
end
