class RoverOutPlateauBoundsException < StandardError
	def initialize(msg="Rover is out of plateau bounds")
		super
	end
end