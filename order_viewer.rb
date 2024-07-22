class OrderViewer < Order
  def export_order
    CSV.open('new.csv', 'wb') do |csv|
      csv << %w[item price]
      csv << [@items[0], @items[0].price]
      csv << [@items[1], @items[1].price]
      csv << [@items[2], @items[2].price]
    end
  end

  def show_order
    puts @items
  end
end
