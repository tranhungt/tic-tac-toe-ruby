class Board 
  attr_accessor :rows
  def initialize
    @rows = Array.new(3){|array| Array.new(3){'_'}}
  end

  def columns
    cols = [[],[],[]]
    @rows.each_with_index do |row, i|
      row.each_with_index do |ele, k|
        cols[k] << ele
      end
    end
    cols
  end

  def put_token(pos, token)
    y,x = pos
    @rows[y][x] = token
  end
end