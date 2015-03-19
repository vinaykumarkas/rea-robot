=begin
Spec class having test cases for verifying the tabletop specifications.
This class tests various position and placements on tabletop
=end

require_relative 'spec_helper'

describe 'Table' do

  before do
    @table = Table.new
  end

  describe '#place' do

    it 'should allow placement with valid coordinates' do
      expect(@table.place(0, 0)).not_to eq(nil)
      expect(@table.position).not_to eq(nil)
    end

    it 'should not allow placement when X co-ordinates < 0' do
      expect(@table.place(-10, 0)).to eq(nil)
      expect(@table.position).to eq(nil)
    end

    it 'should not allow placement when X co-ordinates > 4' do
      expect(@table.place(10, 0)).to eq(nil)
      expect(@table.position).to eq(nil)
    end

    it 'should not allow placement when Y co-ordinates < 0' do
      expect(@table.place(0, -10)).to eq(nil)
       expect(@table.position).to eq(nil)
    end

    it 'should not allow placement when Y co-ordinates > 4' do
      expect(@table.place(0, 10)).to eq(nil)
      expect(@table.position).to eq(nil)
    end
    
  end

  describe '#is_placed?' do

    it 'should be initially false' do
      expect(@table.is_placed?).to eq(false)
        expect(@table.position).to eq(nil)
    end

    describe 'after an un-successful PLACEment' do

      before do
        @table.place(-10, -10)
      end

      it 'should return false' do
        expect(@table.is_placed?).to eq(false)
        expect(@table.position).to eq(nil)
      end

    end

    describe 'after a successful PLACEment' do

      before do
        @table.place(0, 0)
      end

      it 'should return true' do
        expect(@table.is_placed?).to eq(true)
        expect(@table.position).not_to eq(nil)
      end

    end

  end

  describe '#position' do

    it 'should be initially nil' do
      expect(@table.position).to eq(nil)
    end

    describe 'after an un-successful PLACEment' do

      before do
        @table.place(-10, -10)
      end

      it 'should remain nil after an un-successful PLACEment' do
        expect(@table.position).to eq(nil)
        expect(@table.is_placed?).to eq(false)
      end

    end

    describe 'after a successful PLACEment' do

      before do
        @table.place(0, 0)
      end

      it 'should returns the X and Y co-ordinates of the PLACEment' do
        expect(@table.position).to eq({ x: 0, y: 0 })
        expect(@table.is_placed?).to eq(true)
      end

    end

  end
end