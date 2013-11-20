require_relative 'spec_helper'

describe Board do
  subject(:board) {Board.new}


  describe '#new' do
    it 'returns board object' do
      board.should be_an_instance_of Board
    end
    it 'should have 3 rows' do
      board.rows.length.should == 3
    end
    it 'should have 3 columns per row' do
      board.rows[0].length.should == 3
    end
    it 'should have \'_\' in every position' do
      all_empty = true
      board.rows.each do |row|
        row.each do |pos|
          unless pos == '_'
            all_empty = false
          end
        end
      end

      all_empty.should == true
    end
  end

  describe '#columns' do
    it 'should have length of 3' do
      board.columns.length == 3
    end
  end

  describe '#diagonals' do
    it 'should have length of 2' do
      board.diagonals.length.should == 2
    end
    it 'should have 3 positions per diagonal' do
      board.diagonals[0].length.should == 3
    end
  end

  describe '#put_token' do
    it 'puts token at the specified [y,x] position' do
      board.put_token([0,0], :X)
      board.rows[0][0].should == :X
    end
  end

  describe '#token_at' do
    it 'gets token symbol at specifi [y,x] coord' do
      board.put_token([0,0], :X)
      board.token_at([0,0]).should == :X
    end
  end

  describe '#winner?' do
    it 'checks rows' do
      [[0,0],[0,1],[0,2]].each do |pos|
        board.put_token(pos, :X)
      end
      board.winner?.should == true

    end

    it 'checks columns' do
      [[0,0],[1,0],[2,0]].each do |pos|
        board.put_token(pos, :X)
      end
      board.winner?.should == true
    end

    it 'checks diagonals' do
      [[0,0],[1,1],[2,2]].each do |pos|
        board.put_token(pos, :X)
      end
      board.winner?.should == true
    end
    it 'checks same consecutive symbols' do
      board.put_token([0,0], :X)
      board.put_token([0,1], :X)
      board.put_token([0,2], :O)
      board.winner?.should == false
    end
  end

  describe '#draw?' do 
    it 'checks if all positions are played' do
      board.rows.map! do |row|
        row.map! {|el| :X}
      end
      board.draw?.should == true
    end
  end

  describe '#finished?' do
    it 'checks for draw' do
      board.rows.map! do |row|
        row.map! {|el| :X}
      end
      board.finished? == true
    end

    it 'checks for winner' do
      [[0,0],[0,1],[0,2]].each do |pos|
        board.put_token(pos, :X)
      end
      board.finished? == true
    end
  end

  describe '#invalid_move?' do
    it 'checks for array input' do
      board.invalid_move?('asdf').should == true
    end

    it 'checks for length of 2' do
      board.invalid_move?([1]).should == true
    end

    it 'checks for 2 integers within the array' do
      board.invalid_move?(['a','b']).should == true
    end

    it 'checks for out of bounds' do
      board.invalid_move?([1,5]).should == true
    end

    it 'should return false for [1,2]' do
      board.invalid_move?([1,2]).should == false
    end
    it 'checks for occupied spot' do
      board.put_token([0,0], :X)
      board.invalid_move?([0,0]).should == true
    end
  end

  describe '#open_position' do
    it 'returns array of open positions' do
      [[0,0],[0,1],[0,2]].each do |pos|
        board.put_token(pos, :X)
      end
      board.open_positions.should == [[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
    end
  end
end
