# frozen_string_literal: true

class RoverCommandRunner
  VALID_INSTRUCTIONS = %w(L R M).freeze

  def initialize(rover)
    @rover = rover
  end

  def call(instructions)
    instructions.each_char do |instruction|
      raise InvalidInstructionException.new unless VALID_INSTRUCTIONS.include?(instruction)

      case instruction.upcase
      when 'L'
        @rover.turn_left
      when 'R'
        @rover.turn_right
      when 'M'
        @rover.move_forward
      end
    end
  end
end