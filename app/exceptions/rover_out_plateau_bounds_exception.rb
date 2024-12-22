# frozen_string_literal: true

class RoverOutPlateauBoundsException < StandardError
	def initialize(msg="Rover is out of plateau bounds")
		super
	end
end