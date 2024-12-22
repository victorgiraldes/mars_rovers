# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoverCommandRunner do
  let(:rover) { instance_double(Rover) }
  subject { described_class.new(rover) }

  it 'should raise error when invalid instruction' do
    expect { subject.call('X') }.to raise_error(InvalidInstructionException)
  end

  it 'should turn left' do
    expect(rover).to receive(:turn_left)
    subject.call('L')
  end

  it 'should turn right' do
    expect(rover).to receive(:turn_right)
    subject.call('R')
  end

  it 'should move forward' do
    expect(rover).to receive(:move_forward)
    subject.call('M')
  end
end