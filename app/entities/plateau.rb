# frozen_string_literal: true

# Represents a plateau on Mars.
Plateau = Struct.new(:x, :y) do
  def within_bounds?(x, y)
    x.between?(0, self.x) && y.between?(0, self.y)
  end
end