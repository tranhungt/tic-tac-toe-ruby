class Board 
  attr_accessor :rows, :taken_positions
  def initialize
    @rows = Array.new(3){|array| Array.new(3){'_'}}
    @taken_positions = []
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
    taken_positions << pos
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
    is_a_winner(:X) || is_a_winner(:O)
  end

  def is_a_winner(symbol)
    rows.each do |row|
      return true if row.all? {|token| token == symbol}
    end
    diagonals.each do |diag|
      return true if diag.all?{|token| token == symbol}
    end
    columns.each do |col|
      return true if col.all?{|token| token == symbol}
    end
    false
  end

  def draw?
    rows.each do |row|
      return false if row.any?{|el| el == '_'}
    end
    true
  end

  def finished?
    winner? || draw?
  end

  def invalid_move?(input)
    return true unless input.is_a?(Array)
    return true unless input.length == 2
    return true unless input.all?{|el| el.is_a?(Fixnum)}
    return true unless input.all?{|num| num <= 2 && num >= 0}
    return true unless token_at(input) == '_'
    false
  end

  def display
    rows.each{|row| p row}
  end

  def open_positions
    open_pos = []
    rows.each_with_index do |row, y|
      row.each_with_index do |token, x|
        if token == '_'
          open_pos << [y,x]
        end
      end
    end
    open_pos
  end
end