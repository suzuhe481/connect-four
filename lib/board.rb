class Board
  attr_accessor :width, :height, :max_height, :board_arr

  def initialize(width = 7, height = 0)
    @width = width
    @height = height
    @max_height = 7

    @board_arr = Array.new(width) { Array.new(height) }
  end

  # Returns the value of the token at the given position.
  def get_token_at(row, col)
    @board_arr[col - 1][row - 1]
  end

  # Drops a token at a given column.
  def drop_token(col, token)
    @board_arr[col - 1].append(token)
  end

  # Checks for matching tokens above given token.
  def match_above(row, col)
    curr_token = get_token_at(row, col)
    initial_token = curr_token
    curr_row = row
    curr_col = col

    in_a_row = -1
    while curr_token == initial_token
      in_a_row += 1
      curr_row += 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row
  end

  # Checks for matching tokens below given token.
  def match_below(row, col)
    curr_token = get_token_at(row, col)
    initial_token = curr_token
    curr_row = row
    curr_col = col

    in_a_row = -1
    while curr_token == initial_token
      in_a_row += 1
      curr_row -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row
  end

  # Checks for matching tokens left of given token.
  def match_left(row, col)
    curr_token = get_token_at(row, col)
    initial_token = curr_token
    curr_row = row
    curr_col = col

    in_a_row = -1
    while curr_token == initial_token
      in_a_row += 1
      curr_col -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row
  end

  # Checks for matching tokens right of given token.
  def match_right(row, col)
    curr_token = get_token_at(row, col)
    initial_token = curr_token
    curr_row = row
    curr_col = col

    in_a_row = -1
    while curr_token == initial_token
      in_a_row += 1
      curr_col += 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row
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
