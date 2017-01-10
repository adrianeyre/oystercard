require 'journey'

describe Journey do
  #let(:full_journey) {teststation}

  let(:teststation) {double :station, name: "entry_station", zone: 1}
  let(:full_journey) {double :journey, entry_station: teststation}

  describe "#initialize" do
    it "New journey initialises with empty array" do
      expect(subject.journeys).to eq nil
    end
  end

  # it "Check for existing journeys" do
  #   expect(full_journey.journeys).to eq nil #[{from: "entry_station", to: "exit_station"}]
  # end

  context "It calculates the fare" do
    it "charges the minimum fare" do
     expect(subject.fare).to eq Journey::MINIMUM_CHARGE
    end
  end

  describe "#entry_station" do
    it "Check to see if you can add an entry station" do
      journey = Journey.new(teststation)
      expect(journey.entry_station).to eq teststation
    end
  end
end