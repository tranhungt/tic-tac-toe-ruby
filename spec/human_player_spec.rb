require_relative 'spec_helper.rb'

describe HumanPlayer do
  subject(:player){HumanPlayer.new(:X)}
  describe '#new' do
    it 'is given a symbol' do
      player.get_move.should_not be_nil
    end
  end
end
