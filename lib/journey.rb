class Journey
MIN_FARE = 1
MAX_FARE = 6
INCOMPLETE_JOURNEY = 1
  attr_accessor :entry, :exit, :current_journey

  def initialize
    #@current_journey = {}
    @entry = nil
    @exit = nil
  end

  def start_journey(station)
    @entry = station
  end

  def end_journey(station)    
    @exit = station
  end


def fare
       return MAX_FARE if @entry != nil && @exit == nil 
      (@exit.zone - @entry.zone).abs + MIN_FARE
end

end
