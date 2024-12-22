# frozen_string_literal: true

class Rover
  VALID_DIRECTIONS = %w(N E S W).freeze

  def initialize(x, y, direction, plateau)
    @x = x
    @y = y
    @direction = direction
    @plateau = plateau

    raise InvalidDirectionException.new unless VALID_DIRECTIONS.include?(@direction)
  end

  def turn_left
    @direction = VALID_DIRECTIONS[(VALID_DIRECTIONS.index(@direction) - 1) % VALID_DIRECTIONS.size]
  end

  def turn_right
    @direction = VALID_DIRECTIONS[(VALID_DIRECTIONS.index(@direction) + 1) % VALID_DIRECTIONS.size]
  end

  def move_forward
    case @direction
    when 'N' then @y += 1
    when 'E' then @x += 1
    when 'S' then @y -= 1
    when 'W' then @x -= 1
    end

    raise RoverOutPlateauBoundsException.new unless @plateau.within_bounds?(@x, @y)
  end

  def position
    "#{@x} #{@y} #{@direction}"
  end
end