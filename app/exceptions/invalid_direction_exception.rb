# frozen_string_literal: true

# Represents an exception that is raised when an invalid direction is given to a rover.
class InvalidDirectionException < StandardError
  def initialize(msg="Invalid direction, Permitted directions are N, E, S, W")
    super
  end
end