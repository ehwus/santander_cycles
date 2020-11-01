class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end