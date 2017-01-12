require "JourneyLog"

describe JourneyLog do
  subject(:journeylog) {described_class.new}
  let(:station)     {double :start_station, name: "Kings",zone: 1}
  let(:end_station) {double :end_station  , name: "Pimlico",zone: 1}

  describe "#start" do
    it "should start a new journey with an entry station" do
      subject.start(station)
      expect(subject.current_journey.class).to eq Journey
    end
  end
  describe "#current_journey" do
    it "should return a incomplete journey" do
      expect(subject.current_journey).to be_in_journey
    end
    it "should create a new journey if journey is complete" do
      subject.start  station
      subject.finish end_station
      expect(subject.current_journey).to be_in_journey
    end
  end
  describe "#finish" do
    it "should add an exit station to the current_journey" do
      journey = subject.current_journey
      subject.finish(station)
      expect(journey.end_station).to eq station
    end
  end
  describe "#journeys" do
    it "returns history of all journeys"
  end
end
