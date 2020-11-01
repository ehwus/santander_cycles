class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pick_up_broken_bikes(dock)
    dock.bikes.each do |bike|
      unless bike.working?
        @broken_bikes << bike
        dock.bikes.delete(bike)
      end
    end
  end
end