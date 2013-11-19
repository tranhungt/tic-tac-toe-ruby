require_relative 'player'

class ComputerPlayer < Player
  attr_reader :comp_first, :human_first, :human_symbol
  def initialize(symbol)
    human_symbol = symbol == :O ? :X : :O
    comp_first= get_comp_first_matrix
    human_first = get_human_first_matrix
    super(symbol)
  end

  def get_move
    [[0,1,2].sample, [0,1,2].sample]
  end

  def get_comp_first_matrix
      
  end

  def get_human_first_matrix

  end
  
end