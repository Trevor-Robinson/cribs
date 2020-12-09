require 'pry'
require './lib/room'
class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    rooms << room
  end

  def above_market_value?
    if @price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_from_cat = []
    @rooms.each do |room|
      if room.category == category
        rooms_from_cat << room
      end
    end
    return rooms_from_cat
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    return house_area
  end

  def details
    house_details = Hash.new
    house_details["price"] = @price
    house_details["address"] = @address
    return house_details
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sorted = []
    sorted << rooms.sort_by do |room|
      room.area
    end
    sorted.flatten!.reverse
  end

  def rooms_by_category
    room_types = []
    rooms.each do |check|
      room_types << check.category
    end
    room_types.uniq.flatten!
    rooms_by_type = Hash.new
    rooms_by_type[room_types.map { |key, value| }] = rooms
    # rooms_by_type[room_types.collect { |roomtype| [roomtype, ''] } ]
    return rooms_by_type
  end
end
