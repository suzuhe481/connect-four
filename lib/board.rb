class Board
  attr_accessor :width, :height, :max_height, :board_arr

  def initialize(width = 7, height = 0)
    @width = width
    @height = height
    @max_height = 7

    @board_arr = Array.new(width) { Array.new(height) }
  end

  # Returns the value of the token at the given position.
  def get_token_at(row, column)
    @board_arr[column][row]
  end

  # Drops a token at a given column.
  def drop_token(column, token)
    @board_arr[column - 1].append(token)
  end

  # Prints the current game board.
  def print_board
    rotated_board = @board_arr

    rotated_board.each do |col|
      until col.count == @max_height
        col.append(" ")
      end
    end

    rotated_board = rotated_board.map(&:reverse).transpose

    rotated_board.each do |row|
      p row
    end
    puts ""
  end
end
