require './lib/room'

class House
  attr_reader :price

  def initialize(price, address)
    @price = price.delete_prefix('$').to_i
    @address = address
    @rooms = []
  end

end
