require "journey"

describe Journey do
  let(:station)     {double :start_station, name: "Kings",zone: 1}
  let(:end_station) {double :end_station  , name: "Pimlico",zone: 1}

  subject {described_class.new}
  describe "#new" do
    it{is_expected.to be_in_journey} ##
    # it'has a start station set' do
    #   expect(subject.start_station).to eq station
    # end
  end

  describe "#end" do
    it'has an end station set' do
      subject.end end_station
      expect(subject.end_station).to eq end_station
    end
    it "completes a journey" do
      subject.start station
      subject.end end_station
      is_expected.not_to  be_in_journey
    end
    it "completes when touching out without touching in" do
      subject.end end_station
      is_expected.not_to be_in_journey
    end
  end

  describe "#calculate_fare" do
    it "returns a fare when given a completed journey" do
      subject.start station
      subject.end end_station
      expect(subject.fare ).to eq Journey::MINIMUM_FARE
    end
    it "returns the penalty fare if touch in twice" do
      subject.start station
      subject.start station
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it "returns the penalty fare if touch out without touch in" do
      subject.end end_station
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe "#start" do
    it "is expected to complete journey if another new start station is added" do
      subject.start station
      subject.start station
      is_expected.not_to be_in_journey
    end
  end
end
