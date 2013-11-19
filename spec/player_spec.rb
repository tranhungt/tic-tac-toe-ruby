require_relative 'spec_helper.rb'
describe Player do
  subject(:player){Player.new(:X)}
  describe '#new' do
    it 'is given a symbol' do
      player.symbol.should == :X
    end
  end
end