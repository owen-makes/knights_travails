
class Knight
  attr_accessor :x, :y, :board, :moves

  def initialize(x = 3, y = 3)
    @x = x
    @y = y
    @board = Array.new(8) {Array.new(8)}
    @moves = possible_moves
  end

  def possible_moves(initial = [@x,@y])
    #populate possible moves
    pm = [    
      [@x - 2, @y - 1],
      [@x - 2, @y + 1],
      [@x + 2, @y - 1],
      [@x + 2, @y + 1],
      [@x + 1, @y - 2],
      [@x - 1, @y - 2],
      [@x + 1, @y + 2],
      [@x - 1, @y + 2]]
    #reject ilegal moves
    pm.reject {|x,y| x < 0 || y < 0 || x > 7 || y > 7}
  end
end

test = Knight.new(0,7)

p test.moves.length
