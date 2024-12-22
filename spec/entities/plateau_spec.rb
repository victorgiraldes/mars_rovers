# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Plateau' do
  it 'should be within bounds' do
    plateau = Plateau.new(5, 5)
    expect(plateau.within_bounds?(3, 3)).to be true
  end

  it 'should not be within bounds' do
    plateau = Plateau.new(5, 5)
    expect(plateau.within_bounds?(6, 6)).to be false
  end
end