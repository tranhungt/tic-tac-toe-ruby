require_relative 'player'

class ComputerPlayer < Player
  attr_reader :human_symbol, :board
  POINT_MAP = {
    [0,0] => [1,1,0,0,1,0,0,0],
    [0,1] => [0,1,0,0,0,1,0,0],
    [0,2] => [0,1,0,0,0,0,1,1],
    [1,0] => [0,0,1,0,1,0,0,0],
    [1,1] => [1,0,1,0,0,1,0,1],
    [1,2] => [0,0,1,0,0,0,1,0],
    [2,0] => [0,0,0,1,1,0,0,1],
    [2,1] => [0,0,0,1,0,1,0,0],
    [2,2] => [1,0,0,1,0,0,1,0]
  }
  def initialize(symbol, board)
    @human_symbol = symbol == :O ? :X : :O
    @board = board
    super(symbol)
  end

  def get_move
    two_point_moves = []
    block_moves = []
    current_points = calculate_current_points
    p current_points
    board.open_positions.each do |pos|
      temp_points = combine_points(POINT_MAP[pos], current_points)
      if three_in_a_row?(temp_points)
        return pos
      elsif negative_two_in_a_row?(current_points) && !negative_two_in_a_row?(temp_points)
        block_moves << pos
      elsif two_in_a_row?(temp_points)
        two_point_moves << pos
      end
    end
    if !block_moves.empty?
      block_moves.sample
    elsif !two_point_moves.empty?
      two_point_moves.sample
    else
      get_random_move
    end
  end

  def three_in_a_row?(points)
    points.any?{|p| p == 3}
  end

  def two_in_a_row?(points)
    points.any?{|p| p == 2}
  end

  def negative_two_in_a_row?(points)
    points.any?{|p| p == -2}
  end

  def calculate_current_points
    current_points = Array.new(8){0}
    taken_positions = board.taken_positions
    taken_positions.each do |pos|
      sym = board.token_at(pos)
      if sym == symbol
        current_points = combine_points(current_points, POINT_MAP[pos])
      else
        negative_points = POINT_MAP[pos].map{|p| p * -1}
        current_points = combine_points(current_points, negative_points)
      end
    end
    current_points
  end

  def combine_points(points1, points2)
    new_points = []
    8.times do |k|
      new_points << points1[k] + points2[k]
    end
    new_points
  end

  def get_random_move
    board.open_positions.sample
  end
end