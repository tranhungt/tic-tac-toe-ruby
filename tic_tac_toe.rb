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

  def diagonals
    diag1 = [[0,0],[1,1],[2,2]]
    diag2 = [[2,0],[1,1],[0,2]]
    [diag1,diag2].map do |diags|
      diags.map do |diag|
        y,x = diag
        @rows[y,x]
      end
    end
    [diag1,diag2]
  end
end