require_relative 'journey'
require_relative 'journey_log'


class Oystercard

DEFAULT_LIMIT = 90
MIN_FARE = 1
attr_reader :balance, :in_journey, :journeys

	def initialize(current_journey = Journey.new, journeys = JourneyLog.new)
	@balance = 0
	@in_journey = nil
	@journeys = journeys
	@current_journey = current_journey
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		deduct(@current_journey.fare) if @in_journey == true
		@in_journey = true
		@current_journey.start_journey(entry_station)
	end

	def touch_out(exit_station)
		@in_journey = false
		deduct(@current_journey.fare)
	end

private

	def deduct(fare)
		@balance -= fare
	end

end
