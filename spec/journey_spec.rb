require 'journey'

describe Journey do
  subject(:journey){described_class.new}
  let(:completejourney){double :journey, :entry => {"Bank" => 1}, :exit => {"Kennington" => 2}}
  let(:start_station){double :station, :name => "Bank", :zone => 1}
  let(:exit_station){double :station, :name => "Kennington", :zone => 2}

 it "sets the journey start station" do
   expect(completejourney).to have_attributes(:entry => {"Bank" => 1})
 end
 it "sets the journey end station" do
   new_journey = Journey.new({"Bank" => 1})
   expect(new_journey.end_journey({"Leicester Sq" =>1})).to eq ({"Leicester Sq" => 1})
 end
end
