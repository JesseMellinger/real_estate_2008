require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_a_price
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
  end

  def test_it_has_an_address
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_it_can_have_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_it_can_have_rooms_added
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    actual = house.rooms.all? {|room| room.instance_of?(Room)}

    assert_equal 2, house.rooms.length
    assert actual
  end

  def test_if_it_is_above_market_average
    house1 = House.new("$400000", "123 sugar lane")
    house2 = House.new("$600000", "221B Baker Street")

    refute house1.above_market_average?
    assert house2.above_market_average?
  end

end
