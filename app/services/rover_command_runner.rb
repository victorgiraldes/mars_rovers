# frozen_string_literal: true

# Runs commands on a rover.
class RoverCommandRunner
  VALID_INSTRUCTIONS = %w(L R M).freeze

  # Initializes a new RoverCommandRunner.
  #
  # @param rover [Rover] the rover to run commands on
  def initialize(rover)
    @rover = rover
  end

  # Runs the given instructions on the rover.
  #
  # @param instructions [String] the instructions to run
  # @raise [InvalidInstructionException] if the instruction is not valid
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
      when 'B'
        @rover.move_backward
      end
    end
  end
end
