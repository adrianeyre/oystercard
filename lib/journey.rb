class Journey
MIN_FARE = 1
MAX_FARE = 6
  attr_accessor :entry, :exit

  def initialize(entry_station=nil)
    @entry = entry_station
    @exit = nil
  end

  def end_journey(station=nil) 
    @exit = station
    fare 
  end

def fare
	@entry || @exit == nil ? MAX_FARE : MIN_FARE
end

end
