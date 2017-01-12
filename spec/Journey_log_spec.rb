require "JourneyLog"

describe JourneyLog do
  subject(:journeylog) {described_class.new}
  let(:station)     {double :start_station, name: "Kings",zone: 1}
  let(:journey) {double :journey, start_station: station}
  let(:end_station) {double :end_station  , name: "Pimlico",zone: 1}

  describe "#start" do
    it "should start a new journey with an entry station" do
      subject.start(station)
      expect(subject.current_journey.class).to eq Journey
    end
  end
  describe "#current_journey" do
    it "should return a incomplete journey or create a new journey"
  end
  describe "#finish" do
    it "should add an exit station to the current_journey" do
      allow(station).to receive(:end).and_return station
      subject.finish(station)
      expect(subject.current_journey.end_station).to eq station
    end
  end
  describe "#journeys" do
    it "returns history of all journeys"
  end
end
