require 'csv'
require 'sqlite3'
class Item
  attr_accessor :product_name,:discription,:price
  def initialize(product_name,discription,price)
    @product_name = product_name
    @discription = discription
    @price = price
  end
end
class Book<Item
  attr_accessor :author, :number_of_pages,:genre
  def initialize(author,number_of_pages,genre,product_name,discription,price)
    super(product_name,discription,price)
    @author = author
    @number_of_pages = number_of_pages
    @genre = genre
  end
end

class Game<Item
  attr_accessor :age_limit,:amount_of_people
  def initialize(age_limit,amount_of_people,product_name,discription,price)
    super(product_name,discription,price)
    @age_limit = age_limit
    @amount_of_people=amount_of_people

  end

end

class BoardGame<Game
  attr_accessor :heroes,:length
  def initialize(heroes,length,age_limit,amount_of_people,product_name,discription,price)
    super(age_limit,amount_of_people,product_name,discription,price)
    @length = length
    @heroes = heroes
  end
end

class ComputerGame<Game
  attr_accessor :platform, :type
  def initialize(platform,type,age_limit,amount_of_people,product_name,discription,price)
    super(age_limit,amount_of_people,product_name,discription,price)
    @platform = platform
    @type = type
  end
end


class Order
  attr_accessor :items
  def initialize
    @items=[]
  end
  def add_item(item)
    @items << item
  end
  def delete_item(item)
    @items.delete(item)
  end
  def get_items_count
    @items.count
  end
  def calculate_total_sum
    sum=0
    @items.each { |item| sum+=item.price}
    sum
  end
end


class OrderRephository<Order
  @@Sqlite='notepad.sqlite'
  def load_from_CSV
    table=CSV.read("new.csv")
    headers=table.shift

    db=SQLite3::Database.open(@@Sqlite)
    for i in table do
      db.execute("INSERT INTO info (item, price) VALUES (?, ?)", [i[0], i[1]])
    end
    db.close
  end
  def load_from_sQL
    db=SQLite3::Database.open(@@Sqlite)
    result=db.execute("SELECT * FROM info")
    CSV.open("new.csv","w") do |csv|
      csv<<['item','price']
      for i in result do
        csv<<[i[0],i[1]]
      end


    end
  end
end

class OrderViewer<Order
  def export_order
      CSV.open("new.csv","wb") do |csv|
        csv<<["item",'price']
        csv<<[@items[0],@items[0].price]
        csv<<[@items[1],@items[1].price]
        csv<<[@items[2],@items[2].price]
      end
  end
  def show_order
    puts @items
  end
end

class Customers
  attr_accessor :name,:email,:phone,:adress
  def initialize(name,email,phone,adress)
    @name = name
    @email = email
    @phone = phone
    @adress= adress
  end
  def create_orders
    @order=Order.new
  end

  def pay_for_order
    puts "You should pay #{@order.calculate_total_sum}"
  end

  def recieve_a_bill
    puts "your payment is #{@order.calculate_total_sum}"
  end

end

