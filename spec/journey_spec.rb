require 'journey'

describe Journey do
  subject(:journey){described_class.new}
  let(:completejourney){double :journey, :entry => {"Bank" => 1}, :exit => {"Kennington" => 2}}
  let(:start_station){double :station, :name => "Bank", :zone => 1}
  let(:exit_station){double :station, :name => "Kennington", :zone => 2}


 it "sets the journey start station" do
   expect(completejourney).to have_attributes(:entry => {"Bank" => 1})
 end

it 'records the completed journey on touch out' do
	expect(journey.end_journey({"Leicester Sq" => 2})).to eq 1
end

end
