=begin
This is main class for executing Robot Simulator.
This class accpets commands which are provided and executes them using helper classes
Execution: $ruby toy_robot (from the directory of this file)
=end

require_relative 'helpers/controller'

controller = Controller.new
puts "Please command the Robot: "
command = STDIN.gets

while command
  output = controller.execute(command.to_s.upcase)
  puts output if output
  command = STDIN.gets
end