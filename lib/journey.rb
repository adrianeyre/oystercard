class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1
attr_reader :start_station,:end_station


  def initialize start_station
    @start_station = start_station
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def start station
    @in_journey = false if @start_station
    @start_station ||= station
  end

  def end station
    @end_station = station
    @in_journey = false
  end

  def calculate_fare
    raise "still in journey" if @in_journey
    return PENALTY_FARE if start_station.nil? || end_station.nil?
    MINIMUM_FARE
  end
end
