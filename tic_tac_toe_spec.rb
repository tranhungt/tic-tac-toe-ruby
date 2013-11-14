require 'rspec'
require './tic_tac_toe.rb'

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

  describe '#put_token' do
    it 'takes params of [y,x] pos and token symbol' do

    end

    it 'puts token at the specified [y,x] position' do
      board.put_token([0,0], :X)
      board.rows[0][0].should == :X
    end
  end


end
