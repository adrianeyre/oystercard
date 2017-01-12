require_relative 'journey'

class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :journeys

	def initialize(current_journey = Journey.new)
	@balance = 0
	@in_journey = false
	@journeys = []
	@current_journey = current_journey
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		@in_journey = true
		@current_journey.start_journey(entry_station)
	end

	def touch_out(exit_station)
		@journeys << {entry: @entry_station, exit: exit_station}
		@in_journey = false
		deduct(@current_journey.end_journey(exit_station))
	end

private

	def deduct(fare)
		@balance -= fare
	end

end
