require_relative 'journey'

class JourneyLog
attr_reader :journeys
  
  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(entry_station)
   @journeys << @journey_class.start_journey(entry_station)
  end

  def end_journey(exit_station)
  @journeys << @journey_class.end_journey(exit_station)
  complete_journey
  end

  private

  def complete_journey
  @journey_class.current_journey = {}
  end

end
