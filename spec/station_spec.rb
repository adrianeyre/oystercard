require 'station'

describe Station do

subject(:station){described_class.new}

	describe '#initialize' do
		it 'should return zone' do
		expect(station.zone).to eq 1
		end
	end

end

