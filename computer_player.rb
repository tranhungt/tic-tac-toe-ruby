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
    human_symbol = symbol == :O ? :X : :O
    @board = board
    current_points = Array.new(8){0}
    super(symbol)
  end

  def get_move
    
    [[0,1,2].sample, [0,1,2].sample]
  end
  
  
  
end