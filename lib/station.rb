class Station

attr_reader :name, :zone

	def initialize(name="test_name", zone= "test zone")
	@name = name
	@zone = zone
	end

	def ask_zone(station)
	@zone
	end
	
end
