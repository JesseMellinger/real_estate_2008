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

  def test_get_rooms_from_one_category
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    actual_bedrooms = house.rooms_from_category(:bedroom).all? {|room| room.category == :bedroom}
    actual_basements = house.rooms_from_category(:basement).all? {|room| room.category == :basement}

    assert_equal 2, house.rooms_from_category(:bedroom).count
    assert_equal 1, house.rooms_from_category(:basement).count
    assert actual_bedrooms
    assert actual_basements
  end

  def test_get_total_area
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_get_details
    house1 = House.new("$400000", "123 sugar lane")
    house2 = House.new("$600000", "221B Baker Street")

    expected_house1 = {"price" => 400000, "address" => "123 sugar lane"}
    expected_house2 = {"price" => 600000, "address" => "221B Baker Street"}

    assert_equal expected_house1, house1.details
    assert_equal expected_house2, house2.details
  end

end
