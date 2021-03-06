require_relative 'spec_helper.rb'

describe ComputerPlayer do
  subject(:computer){ComputerPlayer.new(:X, Board.new)}
  
  describe '#new' do
    it 'is given a symbol' do
      computer.symbol.should_not be_nil
    end
    it 'has human symbol as the opposite' do
      computer.symbol.should_not == computer.human_symbol
    end
    it 'has a board' do
      computer.board.should_not == nil
    end
  end

  describe '#three_in_a_row?' do
    it 'checks for three points on the points array' do
      computer.three_in_a_row?([3,0,0]).should == true
    end
  end

  describe '#two_in_a_row?' do
    it 'checks for two points on the points array' do
      computer.two_in_a_row?([2,0,0]).should == true
    end
  end

  describe '#negative_two_in_a_row?' do
    it 'checks for negative two points on the points array' do
      computer.negative_two_in_a_row?([-2,0,0]).should == true
    end
  end

  describe '#combine_points' do 
    it 'adds points from two arrays' do
      arr1 = [1, 2]
      arr2 = [1, 1]
      computer.combine_points(arr1, arr2).should == [2, 3]
    end
  end
end
