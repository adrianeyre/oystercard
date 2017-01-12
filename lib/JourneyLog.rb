class JourneyLog
  attr_reader :journeys, :start_station, :current_journey

  def initialize()
    @journeys = []
    @current_journey = Journey.new
    # @current_journey = nil
  end

  def start(station)
    @current_journey.start(station) # = Journey.new(station)
  end

  def finish(station)
    @current_journey.end(station)
  end

end
