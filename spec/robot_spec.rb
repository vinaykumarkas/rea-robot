=begin
  This is Spec class for Robot. This class contains the 
  test cases for testing the Orient, Orientation, left 
  and right that are specified in Robot class.
  This class contains both Positive and Negative tests
  included in it.
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

# Performing left checks 

describe '#left' do

    describe 'when facing invalid and turn left' do

      before do
        @robot.orient(:invalid)
        @robot.left
      end

      it 'should be facing nil' do
        expect(@robot.orientation).to eq(nil)
      end
    end
    
    describe 'when facing south and turn left' do

      before do
        @robot.orient(:south)
        @robot.left
      end

      it 'should be facing east' do
        expect(@robot.orientation).to eq(:east)
      end

    end

    describe 'when facing north and turn left' do

      before do
        @robot.orient(:north)
        @robot.left
      end

      it 'should be facing west' do
        expect(@robot.orientation).to eq(:west)
      end

    end

    describe 'when facing east' do

      before do
        @robot.orient(:east)
        @robot.left
      end

      it 'should face north' do
        expect(@robot.orientation).to eq(:north)
      end
    end

    describe 'when facing west and turn left' do

      before do
        @robot.orient(:west)
        @robot.left
      end

      it 'should be facing south' do
        expect(@robot.orientation).to eq(:south)
      end
    end

  end

# Performing right turn checks

  describe '#right' do

    describe 'when facing invalid and turn right' do

      before do
        @robot.orient(:invalid)
        @robot.right
      end

      it 'should be facing nil' do
        expect(@robot.orientation).to eq(nil)
      end
    end

    describe 'when facing south' do

      before do
        @robot.orient(:south)
        @robot.right
      end

      it 'should face west' do
        expect(@robot.orientation).to eq(:west)
      end

    end

    describe 'when facing north and turn right' do

      before do
        @robot.orient(:north)
        @robot.right
      end

      it 'should be facing east' do
        expect(@robot.orientation).to eq(:east)
      end

    end

    describe 'when facing east and turn right' do

      before do
        @robot.orient(:east)
        @robot.right
      end

      it 'should be facing south' do
        expect(@robot.orientation).to eq(:south)
      end
    end

    describe 'when facing west and turn right' do

      before do
        @robot.orient(:west)
        @robot.right
      end

      it 'should be facing north' do
        expect(@robot.orientation).to eq(:north)
      end
    end
  end
  end

end