class Board
  attr_accessor :width, :height, :board_arr

  def initialize(width = 7, height = 0)
    @width = width
    @height = height

    @board_arr = Array.new(width) { Array.new(height) }
  end

  # Returns the value of the token at the given position.
  def get_token_at(row, column)
    @board_arr[column][row]
  end
end
