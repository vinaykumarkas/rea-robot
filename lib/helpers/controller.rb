=begin
Class having execute methods which processes the commands passed and calls the appropriate methods.
This class ignores the invalid operations
=end

require_relative 'table'
require_relative 'robot'
require_relative 'commands'
class Controller
  def initialize
    @table = Table.new
    @robot = Robot.new
    @commands =Commands.new(@table,@robot)
  end

  def execute(command)
    return if command.strip.empty?

    tokens = command.split(/\s+/)
    operation = tokens.first
    arguments = tokens.last

    case operation
    when 'PLACE'
      @commands.place(arguments)
    when 'REPORT'
      @commands.report
    when 'MOVE'
      @commands.move
    when 'LEFT'
      @commands.left
    when 'RIGHT'
      @commands.right
    when 'EXIT'
      puts "Exiting the Robot program .... Good Bye !!"
      abort
    else
    "Ignoring invalid command #{operation}."
    end
  end

end