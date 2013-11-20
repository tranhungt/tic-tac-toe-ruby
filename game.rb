require_relative 'board'
require_relative 'computer_player'
require_relative 'human_player'
class Game
  attr_reader :players, :board
  def initialize
    @board = Board.new
    human = HumanPlayer.new(:X)
    computer = ComputerPlayer.new(:O, board)
    @players = [human, computer]
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
    if board.draw?
      puts "It's a draw!"
    else
      turn = turn == 1 ? 0 : 1
      puts "#{players[turn]} Wins!"
    end
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