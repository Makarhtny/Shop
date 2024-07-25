class OrderViewer < Order

  def export_order
    CSV.open('new.csv', 'wb') do |csv|
      csv << %w[item price]
      items.each { |item| csv << [item, item.price] }
    end
  end

  def show_order
    puts @items
  end
end
