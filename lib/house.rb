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

end
