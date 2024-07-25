class ComputerGame < Game
  attr_accessor :platform, :type

  def initialize(options)
    super(options[:age_limit], options[:amount_of_people], options[:product_name], options[:discription],
          options[:price])
    @platform = options[:platform]
    @type = options[:type]
  end
end
