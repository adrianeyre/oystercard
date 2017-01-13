require_relative 'journey_log'
require_relative 'station'

MIN_FARE = 1
class Oystercard

DEFAULT_LIMIT = 90
attr_reader :balance, :in_journey, :journeys

	def initialize(journeys = JourneyLog.new) #previous current_journey = Journey.new
	@balance = 0
	@in_journey = nil
	@journeys = journeys
	#@current_journey = current_journey
	end

	def top_up(amount)
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if @balance + amount > DEFAULT_LIMIT
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if @balance < MIN_FARE
		deduct(@journeys.fare) if @in_journey == true
		@in_journey = true
		@journeys.start_journey(entry_station)
	end

	def touch_out(exit_station)
		@in_journey = false
		@journeys.end_journey(exit_station)
		deduct(@journeys.fare)
		@journeys.complete_journey
	end

private

	def deduct(fare)
		@balance -= fare
	end

end
