# frozen_string_literal: true

# Represents a rover that can move around on a plateau.
class Rover
  VALID_DIRECTIONS = %w(N E S W).freeze

  # Initializes a new Rover.
  #
  # @param x [Integer] the x-coordinate of the rover
  # @param y [Integer] the y-coordinate of the rover
  # @param direction [String] the initial direction of the rover
  # @param plateau [Plateau] the plateau on which the rover is located
  # @raise [InvalidDirectionException] if the direction is not valid
  def initialize(x, y, direction, plateau)
    @x = x
    @y = y
    @direction = direction
    @plateau = plateau

    raise InvalidDirectionException.new unless VALID_DIRECTIONS.include?(@direction)
    check_within_bounds
  end

  # Turns the rover to the left.
  def turn_left
    @direction = VALID_DIRECTIONS[(VALID_DIRECTIONS.index(@direction) - 1) % VALID_DIRECTIONS.size]
  end

  # Turns the rover to the right.
  def turn_right
    @direction = VALID_DIRECTIONS[(VALID_DIRECTIONS.index(@direction) + 1) % VALID_DIRECTIONS.size]
  end

  # Moves the rover forward in the current direction.
  #
  # @raise [RoverOutPlateauBoundsException] if the rover moves out of the plateau bounds
  def move_forward
    case @direction
    when 'N' then @y += 1
    when 'E' then @x += 1
    when 'S' then @y -= 1
    when 'W' then @x -= 1
    end

    check_within_bounds
  end

  # Returns the current position of the rover.
  #
  # @return [String] the current position of the rover in the format "x y direction"
  def position
    "#{@x} #{@y} #{@direction}"
  end

  private

  # Checks if the rover is within the bounds of the plateau.
  #
  # @raise [RoverOutPlateauBoundsException] if the rover is out of the plateau bounds
  def check_within_bounds
    raise RoverOutPlateauBoundsException.new unless @plateau.within_bounds?(@x, @y)
  end
end