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
    case @direction
    when 'N' then @direction = 'W'
    when 'W' then @direction = 'S'
    when 'S' then @direction = 'E'
    when 'E' then @direction = 'N'
    end
  end

  def turn_right
    case @direction
    when 'N' then @direction = 'E'
    when 'E' then @direction = 'S'
    when 'S' then @direction = 'W'
    when 'W' then @direction = 'N'
    end
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

  def call(instruction)
    case instruction
    when 'L' then turn_left
    when 'R' then turn_right
    when 'M' then move_forward
    end
  end
end