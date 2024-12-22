# frozen_string_literal: true

# Represents an exception that is raised when the plateau bounds are invalid.
class InvalidPlateauBoundsException < StandardError
  def initialize(msg="Plateau bounds are invalid")
    super
  end
end