require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "has a customisable default capacity" do
    high_capacity = DockingStation.new(30)
    expect { high_capacity.dock(double(:bike)) }.not_to raise_error
  end

  describe "#release_bike" do
    let(:bike) { double :bike }
    let(:second_bike) { double :bike }

    it "releases a working bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike.working?).to eq(true)
    end

    it "raises an error if trying to release broken bike" do
      allow(bike).to receive(:working?).and_return(false)
      empty_station = DockingStation.new
      empty_station.dock(bike)
      expect { empty_station.release_bike }.to raise_error "No working bikes available"
    end

    it "returns a working bike from station with both working and broken bikes" do
      allow(bike).to receive(:working?).and_return(true)
      allow(second_bike).to receive(:working?).and_return(false)
      station = DockingStation.new
      station.dock(bike)
      station.dock(second_bike)
      expect(station.release_bike).to eq(bike)
    end

    it "raises an error if docking station is empty" do
      expect { DockingStation.new.release_bike }.to raise_error "There are no bikes"
    end

    it "removes the released bike from the dock" do
      allow(bike).to receive(:working?).and_return(true)
      station = DockingStation.new
      station.dock(bike)
      station.release_bike
      expect(station.bikes).not_to include(bike)
    end
  end

  describe "#dock" do
    it "adds a bike to the docking station" do
      bike = double(:bike)
      station = DockingStation.new
      station.dock(bike)
      expect(station.bikes).to include(bike) 
    end

    it "throws an error if station is at capacity" do
      station = DockingStation.new
      20.times { station.dock(double(:bike)) }
      expect { station.dock(double(:bike)) }.to raise_error "Station is full!"
    end
  end
end