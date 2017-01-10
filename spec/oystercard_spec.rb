require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {from: entry_station, to: exit_station} }

  describe "#initialize" do
    it "Checks that balance initializes value = 0" do
      expect(subject.balance).to eq 0
    end
    it "Checks card limit initializes to £90" do
      expect(subject.limit).to eq 90
    end
  end

  describe "#top_up" do
    it "Tops up the balance of an Oystercard" do
      expect(subject.top_up(50)).to eq 50
    end

    it "Refuse topup if limit will be exceeded" do
      error = "Deposit would exceed max limit of #{Oystercard::DEFAULT_LIMIT}"
      deposit = Oystercard::DEFAULT_LIMIT + 1
      expect{subject.top_up(deposit)}.to raise_error error
    end
  end



  describe "#in_journey?" do
    it "Check a new card is not in use" do
      expect(subject.entry_station).to eq nil
    end

    it "Check if a card is in use" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      subject.touch_in(entry_station)
      expect{subject.entry_station}.to raise_error "Card already in use"
    end
  end

  describe "#touch_in(entry_station)" do
    it "Changes in_journey status to true when touching in" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to_not eq nil
    end

    it "Raises an error if card is already in use" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      #subject.instance_variable_set(:@currentjourney, entry_station)
      subject.touch_in(entry_station)
      expect{subject.touch_in(entry_station)}.to raise_error "Card already in use"
    end

    it "Expects the card to remember the station departed from" do
      subject.instance_variable_set(:@balance, Journey::MINIMUM_CHARGE)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it "Doesn't allow access when there is not enough credit" do
      expect{subject.touch_in(entry_station)}.to raise_error "Not enough credit"

    end
  end

  describe "#touch_out(exit_station)" do
    it "Changes in_journey status to false when touching out" do
      subject.top_up(50)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to_not eq nil
    end

    it "Raises an error if card is not in use" do
      subject.top_up(50)
      expect{subject.touch_out(exit_station)}.to raise_error "Card not in use"
    end

    it "Deducts correct fare for the journey" do
      subject.top_up(50)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Journey::MINIMUM_CHARGE)
    end
  end

=begin
  describe "#journeys" do
    it "Stores past journeys" do
      #allow(journey).to receive(:journey).and_return(journey)
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end
=end

end