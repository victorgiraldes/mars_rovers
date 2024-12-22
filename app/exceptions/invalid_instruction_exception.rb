# frozen_string_literal: true

# Represents an exception that is raised when an invalid instruction is given to a rover.
class InvalidInstructionException < StandardError
  def initialize(msg="Invalid instruction, Permitted instructions are L, R, M")
    super
  end
end