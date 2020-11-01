require 'van'

describe Van do
  describe "#pick_up_broken_bikes" do
    let(:dock) { double :dock }
    let(:bike1) { double :bike }
    let(:bike2) { double :bike }

    it "takes all broken bikes from a docking station" do
      allow(bike1).to receive(:working?).and_return(false)
      allow(bike2).to receive(:working?).and_return(true)
      allow(dock).to receive(:bikes).and_return([bike1, bike2])
      test_van = Van.new
      test_van.pick_up_broken_bikes(dock)

      expect(test_van.bikes).not_to include(bike2)
      expect(test_van.bikes).to include(bike1)
    end

    it "removes the bike object from the docking station" do
      allow(bike1).to receive(:working?).and_return(false)
      allow(dock).to receive(:bikes).and_return([bike1])
      subject.pick_up_broken_bikes(dock)
      expect(dock.bikes).not_to include(bike1)
    end
  end
end