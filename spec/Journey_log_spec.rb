require "JourneyLog"
describe JourneyLog do
  subject(:journeylog) {described_class.new(station)}
  let(:station)     {double :start_station, name: "Kings",zone: 1}
  let(:end_station) {double :end_station  , name: "Pimlico",zone: 1}

  describe "#start" do
    it "should start a new journey with an entry station" do
      expect (subject.current_journey.start_station).to eq station
    end
  end
  describe "#current_journey" do
    it "should return a incomplete journey or create a new journey"
  end
  describe "#finish" do
    it "should add an exit station to the current_journey"
  end
  describe "#journeys" do
    it "returns history of all journeys"
  end
end
