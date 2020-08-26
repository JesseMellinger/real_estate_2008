class Room
  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

end
