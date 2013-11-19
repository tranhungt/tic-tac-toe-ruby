require_relative 'board'
require_relative 'computer_player'
require_relative 'human_player'

class Game
  attr_reader :players, :board
  def initialize
    human = HumanPlayer.new(:X)
    computer = ComputerPlayer.new(:O)
    @players = [human, computer]
    @board = Board.new
  end

  def play
    turn = [0,1].sample
    until board.finished?
      
    end
  end
end