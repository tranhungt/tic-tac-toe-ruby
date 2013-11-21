require_relative 'player'

class ComputerPlayer < Player
  attr_reader :human_symbol, :board, :possible_moves
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
    @open_moves = board.open_positions
    @possible_moves = []
    super(symbol)
  end

  def get_move
    two_point_moves = []
    block_moves = []
    @possible_moves = board.open_positions.dup
    open_moves = board.open_positions.dup
    current_points = calculate_current_points
    return @possible_moves.sample if possible_moves.count == 9
    open_moves.each do |pos|
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
    # elsif !two_point_moves.empty?
      # two_point_moves.sample
    else
      get_best_move(open_moves, current_points)
      @possible_moves.sample
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

  def get_points(pos, sym)
    sym == symbol ? POINT_MAP[pos] : POINT_MAP[pos].map{|p| p * -1}
  end

  def get_best_move(open_moves, current_points, turn = symbol, moves_taken = [])
    moves_taken = moves_taken.dup
    open_moves.each do |open_pos|
      new_points = get_points(open_pos, turn)
      temp_points = combine_points(current_points, new_points)
      if temp_points.count(-2) == 2
        moves_taken << open_pos
        @possible_moves.delete(moves_taken[0])
      else
        new_open_moves = open_moves.select{|m| m != open_pos}
        moves_taken << open_pos
        turn = turn == symbol ? human_symbol : symbol
        get_best_move(new_open_moves, temp_points, turn, moves_taken)
      end
    end
  end

  # def get_best_move(open_moves, current_points, turn = symbol)
  #   open_moves.each do |open_pos|
  #     new_points = POINT_MAP[open_pos]
  #     temp_points = combine_points(current_points, new_points)
  #     reduced_open_moves = open_moves.select{|pos| pos != open_pos}
  #     reduced_open_moves.each do |pos|
  #       negative_points = POINT_MAP[pos].map{|p| p * -1}
  #       new_temp_points = combine_points(temp_points, negative_points)
  #       if new_temp_points.count(-2) == 2
  #         possible_moves.delete(open_pos)
  #       end
  #     end
  #   end
  #   possible_moves.sample
  # end
end