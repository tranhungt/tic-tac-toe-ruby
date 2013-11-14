class Board 
  attr_accessor :rows
  def initialize
    @rows = Array.new(3){|array| Array.new(3){'_'}}
  end

  def columns
    cols = [[],[],[]]
    rows.each_with_index do |row, i|
      row.each_with_index do |ele, k|
        cols[k] << ele
      end
    end
    cols
  end

  def put_token(pos, token)
    y,x = pos
    rows[y][x] = token
  end

  def token_at(pos)
    y,x = pos
    rows[y][x]
  end

  def diagonals
    diag1 = [[0,0],[1,1],[2,2]]
    diag2 = [[2,0],[1,1],[0,2]]
    [diag1,diag2].map do |diag|
      diag.map do |pos|
        token_at(pos)
      end
    end
  end

  def winner?
    rows.each do |row|
      return true if row.all? {|token| token == :X || token == :O}
    end
    diagonals.each do |diag|
      return true if diag.all?{|token| token == :X || token == :O}
    end
    columns.each do |col|
      return true if col.all?{|token| token == :X || token == :O}
    end
    false
  end
end