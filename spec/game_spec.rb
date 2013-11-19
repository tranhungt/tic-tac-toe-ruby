require_relative 'spec_helper'
  
describe Game do
  subject(:game) {Game.new}

  describe '#new' do
    it 'has two players' do
      game.players.length.should == 2
    end
    it 'has a board' do
      game.board.should_not be_nil
    end
  end

end