class Station

attr_reader :name, :zone

	def initialize(name="test name", zone="test zone")
	@name = name
	@zone = zone 
	end

	def ask_zone
	@zone
	end
	
end

