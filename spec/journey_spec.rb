require 'journey'

describe Journey do
subject(:journey){described_class.new}
let(:station){double :station, name: "Bank", zone: 1}

	it "#start_journey return entry station" do
		journey.start_journey(station)
		expect(journey.entry).to eq (station)
	 end

	it '#end to return records the completed journey on touch out' do
		journey.start_journey(station)
		journey.end_journey(station)
		expect(journey.exit).to eq station
	end


end
