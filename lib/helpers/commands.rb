=begin
Class containing all commands required for manupulating robot.
place - This method places robot on the tabletop if valid arguments are provided
move - This method moved a step ahead if it is with in the limits of the tabletop
left - This method turns robot to left if the robot is placed on the table
right - This method turns robot to right if the robot is placed on the table
report - This method returns the position and orientation in speified format
=end
class Commands
  def initialize(table,robot)
    @table = table
    @robot = robot
  end

  def place(position)
    message = nil

    begin
      tokens = position.split(/,/)
      x = tokens[0].to_i
      y = tokens[1].to_i
      orientation = tokens[2].downcase.to_sym

      unless @robot.orient(orientation) && @table.place(x, y)
        message = "PLACE command will be ignored till valid arguments are provided"
      end
    rescue
      message = "PLACE command will be ignored till valid arguments are provided"
    end

    message
  end

  def move
    return 'MOVE command will be ignored till robot PLACEment is performed' unless @table.is_placed?
    vector = @robot.vector
    position = @table.position
    if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
      nil
    else
      'MOVE command ignored because robot may fall off the tabletop'
    end
  end

  def left
    return 'LEFT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
    @robot.left
    nil
  end

  def right
    return 'RIGHT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
    @robot.right
    nil
  end

  def report
    return 'REPORT command will be ignored till robot PLACEment is performed' unless @table.is_placed?
    position = @table.position
    orientation = @robot.orientation
    "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
  end

end