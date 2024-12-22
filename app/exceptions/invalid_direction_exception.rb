# frozen_string_literal: true

class InvalidDirectionException < StandardError
  def initialize(msg="Invalid direction, Permitted directions are N, E, S, W")
    super
  end
end