require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe "#release_bike" do
    it "releases a working bike" do
      bike = DockingStation.new.release_bike
      expect(bike).to be_a_kind_of(Bike)
      expect(bike.working?).to eq(true)
    end
  end
end