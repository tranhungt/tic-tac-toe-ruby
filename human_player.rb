require_relative 'player.rb'
class HumanPlayer < Player
  def get_move
    puts "Enter a coord in the form 'Y,X'"
    gets.chomp.split(',').map(&:to_i)
  end

end