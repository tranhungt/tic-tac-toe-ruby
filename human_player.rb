require_relative 'player.rb'
class HumanPlayer < Player
  def get_move
    puts "Enter a coord in the form 'Y,X'"
    move = gets.chomp.split(',').map(&:to_i)
    get_move if invalid_move?(move)
  end

  def invalid_move?(move)

  end
end