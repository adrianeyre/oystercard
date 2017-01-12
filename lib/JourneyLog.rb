class JourneyLog
  attr_reader :journeys, :start_station, :current_journey

  def initialize()
    @journeys = []
    @current_journey = Journey.new
    # @current_journey = nil
  end

  def start(station)
    @current_journey = Journey.new(station)
  end

  def finish(station)
    @current_journey.end(station)
    @journeys << @current_journey
  end

  def current_journey
    return @current_journey = Journey.new if !@current_journey.in_journey?
    @current_journey
  end

end
