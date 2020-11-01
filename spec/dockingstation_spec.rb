require 'dockingstation'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "has a customisable default capacity" do
    high_capacity = DockingStation.new(30)
    expect { high_capacity.dock(Bike.new) }.not_to raise_error
  end

  describe "#release_bike" do
    it "releases a working bike" do
      station = DockingStation.new
      station.dock(Bike.new)
      bike = station.release_bike
      expect(bike).to be_a_kind_of(Bike)
      expect(bike.working?).to eq(true)
    end

    it "raises an error if trying to release broken bike" do
      empty_station = DockingStation.new
      broken_bike = Bike.new
      broken_bike.report_broken
      empty_station.dock(broken_bike)
      expect { empty_station.release_bike }.to raise_error "No working bikes available"
    end

    it "returns a working bike from station with both working and broken bikes" do
      station = DockingStation.new
      working_bike = Bike.new
      station.dock(working_bike)
      broken_bike = Bike.new
      broken_bike.report_broken
      station.dock(broken_bike)
      expect(station.release_bike).to eq(working_bike)
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

    it "throws an error if station is at capacity" do
      station = DockingStation.new
      20.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error "Station is full!"
    end
  end
end