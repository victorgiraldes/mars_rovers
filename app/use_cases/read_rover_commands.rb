# frozen_string_literal: true

class ReadRoverCommands
  def initialize(path:, command_runner_class: RoverCommandRunner, plateau_class: Plateau)
    @path = path
    @rovers = []
    @command_runner_class = command_runner_class
    @plateau_class = plateau_class
  end

  def call
    file[1..-1].each_slice(2) do |rover_position, rover_instructions|
      x, y, direction = rover_position.split(' ')
      rover = Rover.new(x.to_i, y.to_i, direction, plateau)

      @command_runner_class.new(rover).call(rover_instructions)

      @rovers << rover
    end

    File.open('public/output.txt', 'w') do |file|
      file.write(@rovers.map(&:position).join("\n"))
    end
  end

  def file
    @file ||= File.read(@path).strip.split("\n")
  end

  def plateau
    @plateau ||= @plateau_class.new(*file.first.split(' ').map(&:to_i))
  end
end