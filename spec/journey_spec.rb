require 'journey'

describe Journey do
subject(:journey){described_class.new}

	it "#start_journey sets the journey start station" do
		journey.start_journey("Bank")
		expect(journey.current_journey).to include(:entry_station =>"Bank")
	 end

	it '#end to return records the completed journey on touch out' do
		journey.start_journey("Bank")
		journey.end_journey("Kennington")
		expect(journey.current_journey).to include(:exit_station =>"Kennington")
	end


end
