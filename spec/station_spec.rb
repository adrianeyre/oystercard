require 'station'

describe Station do

subject(:station){described_class.new}

	describe '#ask_zone' do
		it 'should return zone' do
		expect(station.ask_zone(station)).to eq "test zone"
		end
	end

end

