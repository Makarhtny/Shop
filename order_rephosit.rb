# frozen_string_literal: true

require 'csv'
require 'sqlite3'

class OrderRephository < Order

  def load_from_csv
    table = CSV.read('new.csv').shift
    feel_in_db(table)
  end

  def load_from_sql
    CSV.open('new.csv', 'w') do |csv|
      csv << %w[item price]
      take_form_db.each { |i| csv << [i[0], i[1]] }
    end
  end

  private

  def feel_in_db(table)
    db = SQLite3::Database.open('notepad.sqlite')
    table.each { |i| db.execute('INSERT INTO info (item, price) VALUES (?, ?)', [i[0], i[1]]) }
    db.close
  end

  def take_form_db
    db = SQLite3::Database.open('notepad.sqlite')
    db.execute('SELECT * FROM info')
  end
end
