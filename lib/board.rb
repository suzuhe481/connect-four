class Board
  attr_accessor :width, :height, :board_arr

  def initialize(width = 7, height = 0)
    @width = width
    @height = height

    @board_arr = Array.new(width) { Array.new(height) }
  end
end
