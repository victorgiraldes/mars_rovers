# frozen_string_literal: true

class ReadRoverCommands
  def initialize(path:, command_runner_class: RoverCommandRunner, plateau_class: Plateau, file: File)
    @path = path
    @rovers = []
    @command_runner_class = command_runner_class
    @plateau_class = plateau_class
    @file = file
  end

  def call
    rover_commands_file[1..-1].each_slice(2) do |rover_position, rover_instructions|
      x, y, direction = rover_position.split(' ')
      rover = Rover.new(x.to_i, y.to_i, direction, plateau)

      @command_runner_class.new(rover).call(rover_instructions)

      @rovers << rover
    end

    @file.open('public/output.txt', 'w') do |file|
      file.write(@rovers.map(&:position).join("\n"))
    end
  end

  def rover_commands_file
    @rover_commands_file ||= @file.read(@path).strip.split("\n")
  end

  def plateau
    @plateau ||= @plateau_class.new(*rover_commands_file.first.split(' ').map(&:to_i))
  end
end