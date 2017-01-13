require 'journey_log'

describe JourneyLog do
subject(:journey_log){described_class.new}
let(:station){ double :station }
let(:journey_class){double :journey_class, new: journey}
let(:journey){ double :journey }

	describe '#start_journey' do

	    it 'records the start station' do
	      allow(journey_class).to receive(:new).and_return journey
	      subject.start_journey(station)
	      expect(subject.journeys).to include station
	    end
	 end

	describe '#end_journey' do

	    it 'records the exit station' do
	      allow(journey_class).to receive(:new).and_return journey
	      subject.end_journey(station)
	      expect(subject.journeys).to include station
	    end
	 end
end
