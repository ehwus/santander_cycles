class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes" if @bikes.empty?

    Bike.new
  end

  def dock(bike)
    @bikes << bike
  end
end