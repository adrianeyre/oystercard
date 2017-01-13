require_relative 'journey'

class JourneyLog
attr_reader :journeys
  
  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(entry_station)
   #@journey_class::MAX_FARE  if @journey_class.entry != nil
   @journeys << @journey_class.start_journey(entry_station)
   entry_station
  end

  def end_journey(exit_station)
  @journeys << @journey_class.end_journey(exit_station)
  exit_station
  end

  def journeys
    @journeys.dup
  end

  def fare
    @journey_class.fare
  end

  def complete_journey
  @journey_class = Journey.new
  end

end
