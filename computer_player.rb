require_relative 'player'

class ComputerPlayer < Player
  attr_reader :human_symbol, :board
  def initialize(symbol, board)
    human_symbol = symbol == :O ? :X : :O
    @board = board
    super(symbol)
  end

  def get_move
    [[0,1,2].sample, [0,1,2].sample]
  end
  
end