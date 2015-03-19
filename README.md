#Toy Robot Simulator


##Description


- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

##Valid commands

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT
    EXIT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.
- EXIT will exit the program

##Installing

extract the zip file,


    cd Robot
    bundle install


####Note
Ensure you have [Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/) or [RVM](https://rvm.io/rvm/install/) installed on your computer.


##Testing
Once installation is completed using above steps, you can test the application using the Spec tests that are included as part of application testing framework.

* You can execute all the tests by using rake:
	    
    	CD to Robot folder (project root folder)
    	$
    	$ rake

* You can execute each Spec class using below command:
	    
    	CD to spec folder (project root folder)
    	$
    	$ rspec robot_spec.rb
    	...............
    
    	Finished in 0.014 seconds (files took 0.40104 seconds to load)
    	15 examples, 0 failures

##Running

Below are the steps that specify how to execute the Robot program.

###Commanding Robot interactively
	
	$ ruby lib/robot_replica.rb
	Please command the Robot:
	PLACE 0,0,NORTH
	MOVE
	REPORT
	0,1,NORTH
	MOVE
	MOVE
	MOVE
	REPORT
	0,4,NORTH
	MOVE
	MOVE command ignored because robot may fall off the tabletop
	EXIT
	Exiting the Robot program .... Good Bye !!

###Commanding Robot with list of commands from file
Commands can also be executed from a file. List all the commands that has to be executed in a TXT file (one command for a line) and input this file to the robot replica class as given below
	
	example:
	If commands are listed in commands.txt
	$
	$ cat commands.txt | lib/robot_replica.rb
	

###Commands

Listed below are the details of commands that can be used to move/command Robot Replica.

####PLACE
Place the robot on the table with co-ordinates X &Y and facing

	example:
    PLACE 1,2,EAST

valid facings:

	NORTH
    SOUTH
    EAST
    WEST

####LEFT
Robot turns left from the existing position

	command:
    LEFT

####RIGHT
Robot turns right from the existing position

	command:
    RIGHT

####REPORT
Displays the position of the Robot and Orientation

	example:
    REPORT (issue this command)
    0.4.NORTH (will display this)

####EXIT
Aborts the execution of the program

	command:
    EXIT (issue this command)
    	Exiting the Robot program .... Good Bye !! (will return this message and exit execution)

##Assumptions
Here table is assumed to be fixed for 5 X 5 units. 
Command line is choosed for the inputs
    
##Future enhancements
Table dimensions can be made dynamic by using arguments from the user
Cross movements can be implemented to enhance the application
Application can be enhanced to choose input from file


    