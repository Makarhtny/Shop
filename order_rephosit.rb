require 'csv'
require 'sqlite3'

class OrderRephository < Order
  def load_from_csv
    table = CSV.read('new.csv')
    table.shift
    db = SQLite3::Database.open('notepad.sqlite')
    table.each do |i|
      db.execute('INSERT INTO info (item, price) VALUES (?, ?)', [i[0], i[1]])
    end
    db.close
  end

  def load_from_sql
    db = SQLite3::Database.open('notepad.sqlite')
    result = db.execute('SELECT * FROM info')
    CSV.open('new.csv', 'w') do |csv|
      csv << %w[item price]
      result.each do |i|
        csv << [i[0], i[1]]
      end
    end
  end
end
