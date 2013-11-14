class Board 
  attr_accessor :rows
  def initialize
    @rows = Array.new(3){|array| Array.new(3){'_'}}
  end

end