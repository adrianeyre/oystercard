require './lib/Oystercard'
  describe Oystercard do

  let(:station)   {double :kings_cross}
  let(:station_2) {double :victoria}
  let(:new_journey) {double :journey, in_journey?: false, start: nil,end: nil,fare: 1}
  before(:each){subject.instance_variable_set(:@current_journey, new_journey)}

  it '#creation' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "should update" do
      random_number = rand (1..Oystercard::BALANCE_MAX)
      expect{subject.top_up random_number}.to change{subject.balance}.by random_number
    end
    it "should object if told to go above max balance" do
      message = "balance threshold exceeded :£#{Oystercard::BALANCE_MAX}"
      expect{subject.top_up Oystercard::BALANCE_MAX + 1}.to raise_error message
    end
  end

  describe "#touch_in" do
    it "should raise errors if below balance_min" do
      expect{subject.touch_in station}.to raise_error "balance too low for journey"
    end
    it "should store first journey if touching in twice" do
      subject.top_up 40
      subject.touch_in station
      subject.touch_in station_2
      expect(subject.journey_history).to include new_journey
    end
  end

  context "has started journey" do
    before(:each){subject.top_up Oystercard::BALANCE_MAX;subject.touch_in station}
    describe "#touch_out" do
      it "should deduct money after a journey" do
        expect{subject.touch_out station_2}.to change{ subject.balance }.by -Oystercard::BALANCE_MIN
      end
      it "should forget entry station on touch" do
        subject.touch_out station_2
        expect(subject.start_station).to eq nil
      end
      it "should receive an argument" do
        expect(subject).to respond_to(:touch_out).with(1).argument
      end
      it "should store a journey on completion" do
        subject.touch_out station_2
        expect(subject.journey_history).to include new_journey
      end
    end
  end

  describe "#journey_history" do
    it{expect(subject.journey_history).to be_empty}
  end

end
