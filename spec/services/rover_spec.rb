require 'rails_helper'

RSpec.describe 'Rover' do
  let(:plateau) { Plateau.new(5, 5) }
  let(:rover) { Rover.new(1, 2, 'N', plateau) }

  it 'should raise error when invalid direction' do
    expect { Rover.new(1, 2, 'X', plateau) }.to raise_error(InvalidDirectionException)
  end

  it 'should turn left' do
    rover.turn_left
    expect(rover.position).to eq('1 2 W')
  end

  it 'should turn right' do
    rover.turn_right
    expect(rover.position).to eq('1 2 E')
  end

  it 'should move' do
    rover.move
    expect(rover.position).to eq('1 3 N')
  end

  it 'should raise error when out of bounds' do
    rover = Rover.new(5, 5, 'N', plateau)
    expect { rover.move }.to raise_error(RoverOutPlateauBoundsException)
  end

  it 'should execute instructions' do
    rover.call('L')
    rover.call('M')
    rover.call('L')
    rover.call('M')
    rover.call('L')
    rover.call('M')
    rover.call('L')
    rover.call('M')
    rover.call('M')
    expect(rover.position).to eq('1 3 N')
  end
end