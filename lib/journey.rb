class Journey
MIN_FARE = 1
MAX_FARE = 6

  attr_accessor :entry, :exit

  def initialize
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
       return MAX_FARE if journey_incomplete?
      (@exit.zone - @entry.zone).abs + MIN_FARE
end

private
  def journey_incomplete?
    (@entry != nil && @exit == nil ) || (@entry == nil && @exit != nil )
  end

end
