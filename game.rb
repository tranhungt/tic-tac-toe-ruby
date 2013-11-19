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
      current_player = players[turn]
      move = get_player_move(current_player)
      symbol = current_player.symbol
      board.put_token(move, symbol)
      board.display
      turn = turn == 1 ? 0 : 1
    end
    puts "Game Finished"
    puts board.winner?
    puts board.draw?
  end

  def get_player_move(current_player)
    move = 'asdf'
    while board.invalid_move?(move)
      move = current_player.get_move
    end
    puts "#{current_player} places #{move}"
    move
  end
end

# game = Game.new
# game.play