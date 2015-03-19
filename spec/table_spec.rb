require_relative 'spec_helper'

describe 'Table' do

  before do
    @table = Table.new
  end

  describe '#place' do

    it 'should allow placement' do
      expect(@table.place(0, 0)).not_to eq(nil)
    end

  end

end