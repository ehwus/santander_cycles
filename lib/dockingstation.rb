class DockingStation
  @@CAPACITY = 20
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes" if empty?

    Bike.new
  end

  def dock(bike)
    raise "Station is full!" if full?

    @bikes << bike
  end

  private
  def full?
    @bikes.count >= @@CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end