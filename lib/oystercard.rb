require_relative 'journey'

class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

	def initialize
	@balance = 0
	@in_journey = false
	@entry_station = nil
	@exit_station = nil
	@journeys = []
	@start_journey =  nil
	@complete_journey = nil
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true
		@start_journey = Journey.new(entry_station)
	end

	def touch_out(exit_station)
	
		@journeys << {entry: @entry_station, exit: exit_station}
		@in_journey = false
		deduct(@start_journey.end_journey(exit_station))
		balance
	end

private

	def deduct(fare)
		@balance -= fare
	end

end
