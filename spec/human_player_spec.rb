require_relative 'spec_helper'

describe HumanPlayer do
  subject(:player){HumanPlayer.new(:X)}
  describe '#new' do
    it 'is given a symbol' do
      player.symbol.should == :X
    end
  end
end