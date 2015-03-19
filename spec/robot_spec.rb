=begin
  This is Spec class for Robot. This class contains the 
  test cases for testing the Orient, Orientation, left 
  and right that are specified in Robot class.
=end

require_relative 'spec_helper'

describe 'Robot' do

  before do
    @robot = Robot.new
  end

# Performing robor Orient cchecks
  describe '#orient' do

    it 'allows to orient :east' do
      expect(@robot.orient(:east)).not_to eq(nil)
    end
       it 'allows to orient :west' do
      expect(@robot.orient(:west)).not_to eq(nil)
    end
       it 'allows to orient :north' do
      expect(@robot.orient(:north)).not_to eq(nil)
    end
       it 'allows to orient :south' do
      expect(@robot.orient(:south)).not_to eq(nil)
    end
 it 'dosent allow to orient invalid' do
      expect(@robot.orient(:invalid)).to eq(nil)
    end

  end

# Performing Orientation checks
  describe '#orientation' do

    it 'it is nil initially' do
      expect(@robot.orientation).to eq(nil)
    end

    describe 'after having valid orientation' do

      before do
        @robot.orient(:north)
      end

      it 'will return the robot orientation' do
        expect(@robot.orientation).to eq(:north)
      end

    end
      
       describe 'after having invalid orientation' do

      before do
        @robot.orient(:invalid)
      end

      it 'will return nil as robot orientation' do
        expect(@robot.orientation).to eq(nil)
      end

    end
end

end