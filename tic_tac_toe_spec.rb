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


end
