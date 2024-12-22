# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReadRoverCommands do
  let(:subject) { described_class.new(path: path) }

  let(:path) { 'spec/fixtures/rover_commands.txt' }
  let(:plateau) { build(:plateau) }

  describe '#call' do
    it 'should create rovers' do
      expect(Rover).to receive(:new).with(1, 2, 'N', plateau).and_call_original
      expect(Rover).to receive(:new).with(3, 3, 'E', plateau).and_call_original

      subject.call
    end

    it 'should write the output to a file' do
      expect(File).to receive(:open).with('public/output.txt', 'w').and_call_original

      subject.call
    end

    it 'should raise an exception if the plateau bounds are invalid' do
      allow(File).to receive(:read).and_return("5 B\n1 2 N\nLMLMLMLMM")
      expect { subject.call }.to raise_error(InvalidPlateauBoundsException)
    end
  end
end