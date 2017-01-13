class Journey
MIN_FARE = 1
MAX_FARE = 6
INCOMPLETE_JOURNEY = 1
  attr_accessor :entry, :exit, :current_journey

  def initialize
    @current_journey = {}
  end

  def start_journey(station)
    fare
    @current_journey[:entry_station] = station
  end

  def end_journey(station) 
    fare
    @current_journey[:exit_station] = station
  end


def fare
	@current_journey.size != INCOMPLETE_JOURNEY ? MIN_FARE : MAX_FARE
end

end
