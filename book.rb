class Book < Item
  attr_accessor :author, :number_of_pages, :genre

  def initialize(options)
    super(options[:product_name], options[:discription], options[:price])
    @author = options[:author]
    @number_of_pages = options[:number_of_pages]
    @genre = options[:genre]
  end
end
