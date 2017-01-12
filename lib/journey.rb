class Journey
MIN_FARE = 1
MAX_FARE = 6
  attr_accessor :entry, :exit

  def initialize
    @entry = ""
    @exit = ""
  end

  def start_journey(station)
  	@entry = station
  end

  def end_journey(station) 
    @exit = station
    fare 
  end

def fare
	@entry || @exit == "" ? MAX_FARE : MIN_FARE
end

end
