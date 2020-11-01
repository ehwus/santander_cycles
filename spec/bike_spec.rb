require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe "#report_broken" do
    it "changes working? status from true to false" do
      bike = Bike.new
      expect(bike.working?).to be(true)
      bike.report_broken
      expect(bike.working?).to be(false)
    end
  end
end