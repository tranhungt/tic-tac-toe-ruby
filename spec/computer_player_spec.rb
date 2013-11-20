require_relative 'spec_helper.rb'

describe ComputerPlayer do
  subject(:computer){ComputerPlayer.new(:X, Board.new)}
  describe '#new' do
    it 'is given a symbol' do
      computer.get_move.should_not be_nil
    end
    it 'has human symbol as the opposite' do
      computer.symbol.should_not == computer.human_symbol
    end
    it 'has a board' do
      computer.board.should_not == nil
    end
  end
end
