class DockingStation
  @@CAPACITY = 20
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes" if @bikes.empty?

    Bike.new
  end

  def dock(bike)
    raise "Station is full!" if @bikes.length >= @@CAPACITY
    @bikes << bike
  end
end