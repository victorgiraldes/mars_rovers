# frozen_string_literal: true

class InvalidInstructionException < StandardError
  def initialize(msg="Invalid instruction, Permitted instructions are L, R, M")
    super
  end
end