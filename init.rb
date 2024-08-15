# frozen_string_literal: true

require_relative 'item'
require_relative 'game'
require_relative 'book'
require_relative 'boardgame'
require_relative 'comp_game'
require_relative 'customers'
require_relative 'order'
require_relative 'order_rephosit'
require_relative 'order_viewer'

first_item = ComputerGame.new(platform: 'PC', type: 'fighting', age_limit: 16, amount_of_pepople: 28,
                              product_name: 'Mortal comat', discription: 'Good game', price: 1000)
second_item = Book.new(author: 'Pero', number_of_pages: 100, genre: 'fiction', product_name: 'zalupa',
                       discription: 'bad book', price: 50)
third_item = BoardGame.new(product_name: 'tut', age_limit: 3, amount_of_people: 8, length: 4, heroes: 'lord',
                           discription: 'dfsdf', price: 10)

new_order_viewer = OrderViewer.new
new_order_viewer.add_item(first_item)
new_order_viewer.add_item(second_item)
new_order_viewer.add_item(third_item)
new_order_viewer.show_order
new_order_viewer.export_order
new_order_reph = OrderRephository.new
new_order_reph.load_from_csv
