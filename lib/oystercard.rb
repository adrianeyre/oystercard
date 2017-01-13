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
		@amount = amount
		raise ("Limit is #{DEFAULT_LIMIT}, declined") if reached_limits?
		@balance += amount
	end

	def touch_in(entry_station)
		raise 'insufficient funds' if insufficient_funds?
		@in_journey == true ? deduct_max_fare : allow_touch_in(entry_station)
	end

	def touch_out(exit_station)
		@in_journey = false
		@journeys.end_journey(exit_station)
		deduct(@journeys.fare)
		@journeys.complete_journey
	end

private

attr_reader :amount
 	
 	def reached_limits?
 		@balance + amount > DEFAULT_LIMIT
	end
	

	def deduct(fare)
		@balance -= fare
	end

	def deduct_max_fare
		deduct(@journeys.fare) 
		@in_journey = false
	end

	def allow_touch_in(entry_station)
		@in_journey = true
		@journeys.start_journey(entry_station)
	end

	def insufficient_funds?
		@balance < MIN_FARE
	end



end
