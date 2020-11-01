require 'dockingstation'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe "#release_bike" do
    it "releases a working bike" do
      station = DockingStation.new
      station.dock(Bike.new)
      bike = station.release_bike
      expect(bike).to be_a_kind_of(Bike)
      expect(bike.working?).to eq(true)
    end

    it "raises an error if docking station is empty" do
      expect { DockingStation.new.release_bike }.to raise_error "There are no bikes"
    end
  end

  describe "#dock" do
    it "adds a bike to the docking station" do
      bike = Bike.new
      station = DockingStation.new
      station.dock(bike)
      expect(station.bikes).to include(bike) 
    end
  end
end