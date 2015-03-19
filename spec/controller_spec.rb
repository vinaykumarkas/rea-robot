=begin
This class contains Spec test cases for testing robot controller class
This class tests various commands before and after placing robot on the table top
=end

require_relative 'spec_helper'

describe 'Controller' do

  before do
    @table = double('table')
    @table.stub(:place)
    Table.stub(:new).and_return(@table)

    @robot = double('robot')
    @robot.stub(:orient)
    Robot.stub(:new).and_return(@robot)

    @controller = Controller.new
  end

  describe '#execute' do

    describe 'blank string' do

      it 'ignores COMMANDS without any warning' do
        expect(@controller.execute('')).to eq(nil)
      end

    end

    describe 'spaces' do

      it 'ignores COMMANDS without any warning' do
        expect(@controller.execute('    ')).to eq(nil)
      end

    end

    describe 'before the robot PLACEment' do

      before do
        @table.stub(:is_placed?).and_return(false)
      end

      describe 'PLACE' do

        describe 'robot at valid co-ordinates and in a valid facing' do

          it 'places the robot on the tabletop at the specified location and sets the orientation' do
            @robot.should_receive(:orient).with(:north).and_return(:north)
            @table.should_receive(:place).with(0, 0)
            @controller.execute('PLACE 0,0,NORTH')
          end

        end

        describe 'robot at valid co-ordinates and in an invalid facing' do

          before do
            @robot.should_receive(:orient).with(:wombles).and_return(nil)
          end

          it 'does not place the robot on the tabletop' do
            @table.should_not_receive(:place)
            expect(@controller.execute('PLACE 0,0,WOMBLES')).to eq('PLACE command will be ignored till valid arguments are provided')
          end

        end

        describe 'REPORT' do

          it 'displays the warning message to the user, but does nothing' do
            @table.should_not_receive(:position)
            @robot.should_not_receive(:orientation)
            expect(@controller.execute('REPORT')).to eq('REPORT command will be ignored till robot PLACEment is performed')
          end

        end

        describe 'LEFT' do

          it 'displays warning message but does nothing' do
            @robot.should_not_receive(:left)
            expect(@controller.execute('LEFT')).to eq('LEFT command will be ignored till robot PLACEment is performed')
          end

        end

        describe 'RIGHT' do

          it 'displays warning message but does nothing' do
            @robot.should_not_receive(:right)
            expect(@controller.execute('RIGHT')).to eq('RIGHT command will be ignored till robot PLACEment is performed')
          end

        end
        describe 'MOVE' do

          it 'displays warning message but does nothing' do
            @robot.should_not_receive(:vector)
            @table.should_not_receive(:position)
            @table.should_not_receive(:place)
            expect(@controller.execute('MOVE')).to eq('MOVE command will be ignored till robot PLACEment is performed')
          end

        end

      end

    end

    describe 'after the robot PLACEment' do

      before do
        @table.stub(:is_placed?).and_return(true)
      end

      describe 'PLACE' do

        describe 'robot at valid co-ordinates and in a valid facing' do

          it 'places the robot on the tabletop and at the specified location and sets the orientation' do
            @robot.should_receive(:orient).with(:north).and_return(:north)
            @table.should_receive(:place).with(0, 0)
            @controller.execute('PLACE 0,0,NORTH')
          end

        end

        describe 'with invalid inputs' do

          it 'provides a warning message to the user and does not place the robot on the tabletop' do
            @table.should_not_receive(:place)
            expect(@controller.execute('PLACE SOME WOMBLES')).to eq('PLACE command will be ignored till valid arguments are provided')
          end
        end

        describe 'REPORT' do

          it 'returns the location and orientation' do
            @table.should_receive(:position).and_return({ x: 1, y: 2 })
            @robot.should_receive(:orientation).and_return(:south)
            expect(@controller.execute('REPORT')).to eq('1,2,SOUTH')
          end

        end

        describe 'LEFT' do

          it 'commands robot to turn left' do
            @robot.should_receive(:left)

            @controller.execute('LEFT')
          end

        end

        describe 'RIGHT' do

          it 'commands robot to turn right' do
            @robot.should_receive(:right)

            @controller.execute('RIGHT')
          end

        end

        describe 'MOVE' do

          describe 'to a valid location on tabletop' do

            it 'receives a vector for movement from the robot and applies it to the table' do
              @robot.should_receive(:vector).and_return({ x: 1, y: 1 })
              @table.should_receive(:position).and_return({ x: 1, y: 1 })
              @table.should_receive(:place).with(2, 2)

              @controller.execute('MOVE')
            end

          end

          describe 'getting off the table' do

            it 'displays warning message and does not move the robot off the table' do
              @robot.should_receive(:vector).and_return({ x: 1, y: 1 })
              @table.should_receive(:position).and_return({ x: 4, y: 4 })
              @table.should_receive(:place).with(5, 5).and_return(nil)

              expect(@controller.execute('MOVE')).to eq('MOVE command ignored because robot may fall off the tabletop')
            end

          end

        end
      end

    end
  end
end