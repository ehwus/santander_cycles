class Van
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end

  def pick_up_broken_bikes(dock)
    dock.bikes.each {|bike| @bikes << bike if !bike.working? }
  end
end