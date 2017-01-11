class Journey

  attr_accessor :entry, :exit

  def initialize(entry_station=nil)
    @entry = entry_station
    @exit = nil
  end

  def end_journey(station=nil)
    @exit = station
  end


end
