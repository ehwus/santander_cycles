class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pick_up_broken_bikes(dock)
    dock.bikes.each do |bike|
      unless bike.working?
        @bikes << bike
        dock.bikes.delete(bike)
      end
    end
  end
end