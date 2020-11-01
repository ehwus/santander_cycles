class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes" if empty?

    bike_to_release = first_working_bike
    remove_from_dock(bike_to_release)
    bike_to_release
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

  def first_working_bike
    @bikes.each { |bike| return bike if bike.working? }

    raise "No working bikes available"
  end

  def remove_from_dock(bike)
    @bikes.delete(bike)
  end
end