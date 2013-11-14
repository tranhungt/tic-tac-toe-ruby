require_relative 'spec_helper'

describe HumanPlayer do
  subject(:player){HumanPlayer.new(:X)}
  describe '#new' do
    it 'is given a symbol' do
      player.symbol.should == :X
    end
  end
  describe '#get_move' do

  end

  describe '#invalid_move?' do

  end
end