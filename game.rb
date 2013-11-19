require_relative 'board'
require_relative 'computer_player'
require_relative 'human_player'

class Game
  attr_reader :players
  def initialize
    human = HumanPlayer.new(:X)
    computer = ComputerPlayer.new(:O)
    @players = [human, computer]
  end
end