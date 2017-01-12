class Oystercard
  attr_reader :balance, :start_station, :journey_history, :current_journey
  BALANCE_MAX = 90
  BALANCE_MIN = 1

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey ||= Journey.new
  end

  def top_up money
    message = "balance threshold exceeded :£#{BALANCE_MAX}"
    raise message if (@balance + money) > BALANCE_MAX
    @balance += money
  end

  def deduct money
    @balance -= money
  end

  def touch_in station
    raise "balance too low for journey" if @balance < BALANCE_MIN
    @current_journey.start station
    @current_journey.start station if check_complete
  end

  def touch_out station
    @current_journey.end station
    check_complete
  end

  def handle_complete
    @journey_history << current_journey
    deduct current_journey.fare
    current_journey = Journey.new
  end

  def check_complete
      (handle_complete ; return true) if !in_journey?
  end

  def in_journey?
    current_journey.in_journey?
  end
end
