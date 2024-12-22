# frozen_string_literal: true

# Represents an exception that is raised when a rover moves out of the plateau bounds.
class RoverOutPlateauBoundsException < StandardError
  def initialize(msg="Rover is out of plateau bounds")
    super
  end
end