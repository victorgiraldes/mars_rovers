# frozen_string_literal: true

# Reads and executes rover commands from a file.
class ReadRoverCommands

  # Initializes a new ReadRoverCommands.
  #
  # @param path [String] the path to the file containing the rover commands
  # @param command_runner_class [Class] the class used to run commands on the rover
  # @param plateau_class [Class] the class used to create the plateau
  # @param file [Class] the file class used to read and write files
  def initialize(path:, command_runner_class: RoverCommandRunner, plateau_class: Plateau, file: File)
    @path = path
    @rovers = []
    @command_runner_class = command_runner_class
    @plateau_class = plateau_class
    @file = file
  end

  # Reads the rover commands from the file and executes them.
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

  private

  # Reads the rover commands from the file.
  #
  # @return [Array<String>] the lines of the file
  def rover_commands_file
    @rover_commands_file ||= @file.read(@path).strip.split("\n")
  end

  # Creates the plateau from the first line of the file.
  #
  # @return [Plateau] the plateau
  # @raise [InvalidPlateauBoundsException] if the plateau bounds are invalid
  def plateau
    plateau_location = rover_commands_file.first.split(' ')

    raise InvalidPlateauBoundsException.new unless plateau_location.all? { |loc| loc =~ /^\d+$/ }
    @plateau ||= @plateau_class.new(*plateau_location.map(&:to_i))
  end
end