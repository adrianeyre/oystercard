require 'journey'

describe Journey do
subject(:journey){described_class.new}

	it "sets the journey start station" do
		journey.start_journey("Bank")
		expect(journey).to have_attributes(:entry => "Bank")
	 end

	it 'records the completed journey on touch out' do
		journey.start_journey("Bank")
		journey.end_journey("Kennington")
		expect(journey).to have_attributes(:exit => "Kennington")
	end

end
