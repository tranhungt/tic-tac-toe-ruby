require_relative 'spec_helper.rb'

describe ComputerPlayer do
  subject(:computer){ComputerPlayer.new(:X)}
  describe '#new' do
    it 'is given a symbol' do
      computer.get_move.should_not be_nil
    end
  end
end
