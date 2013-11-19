require_relative 'player'

class ComputerPlayer < Player
  def get_move
    [[0,1,2].sample, [0,1,2].sample]
  end
  
end