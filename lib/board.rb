class Board
  attr_accessor :width, :height, :max_height, :board_arr

  def initialize(width = 7, height = 0)
    @width = width
    @height = height
    @max_height = 6

    @board_arr = Array.new(width) { Array.new(height) }
  end

  # Returns the value of the token at the given position.
  # Returns nil if given position is out of bounds.
  def get_token_at(row, col)
    return nil if row > 6 || row < 1 ||
                  col > 7 || col < 1

    @board_arr[col - 1][row - 1]
  end

  # Drops a token at a given column.
  # Returns the row position of where the dropped token landed.
  def drop_token(col, token)
    @board_arr[col - 1].append(token)

    @board_arr[col - 1].count
  end

  # Returns true if token in a given position is part of a four in a row.
  def check_win?(row, col)
    if match_vertically(row, col) >= 4 ||
       match_horizontally(row, col) >= 4 ||
       match_diagonally_SW_to_NE(row, col) >= 4 ||
       match_diagonally_NW_to_SE(row, col) >= 4

      return true
    end

    false
  end

  # Returns true if a given column is full.
  def column_full?(col)
    col_height = board_arr[col - 1].count { |token| token != " " }

    return true if col_height == 6

    return false
  end

  # Prints the current game board.
  def print_board
    rotated_board = Marshal.load(Marshal.dump(@board_arr))

    # Adds nil for empty spaces in the board array.
    rotated_board.each do |col|
      col.append(nil) until col.count == @max_height
    end

    # Rotates board.
    rotated_board = rotated_board.map(&:reverse).transpose

    # Prints the top level column numbers.
    print "    "
    (1..7).each do |num|
      print " #{num}"
    end
    puts

    # Prints a nicely formatted board.
    rotated_board.each do |row|
      print "    |"
      
      row.each do |token|
        if token.nil?
          print "_"
        else
          print token.to_s
        end
        print "|"
      end
      puts
    end
  end

  private

  # Returns the number of vertically matching tokens at a given position.
  def match_vertically(row, col)
    # Counts matching tokens above given position.
    curr_token = get_token_at(row, col)
    
    return 0 if curr_token.nil?

    initial_token = curr_token
    curr_row = row
    curr_col = col
    in_a_row_up = -1

    while curr_token == initial_token
      in_a_row_up += 1
      curr_row += 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    # Counts matching tokens below given position.
    curr_token = get_token_at(row, col)
    curr_row = row
    curr_col = col
    in_a_row_down = -1

    while curr_token == initial_token
      in_a_row_down += 1
      curr_row -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row_up + in_a_row_down + 1
  end

  # Returns the number of horizontally matching tokens at a given position.
  def match_horizontally(row, col)
    # Counts matching tokens to the left of given position.
    curr_token = get_token_at(row, col)

    return 0 if curr_token.nil?

    initial_token = curr_token
    curr_row = row
    curr_col = col
    in_a_row_left = -1

    while curr_token == initial_token
      in_a_row_left += 1
      curr_col -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    # Counts matching tokens to the right of given position.
    curr_token = get_token_at(row, col)
    curr_row = row
    curr_col = col
    in_a_row_right = -1

    while curr_token == initial_token
      in_a_row_right += 1
      curr_col += 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    in_a_row_left + in_a_row_right + 1
  end

  # Returns the number of diagonally matching tokens from a Southwest to Northeast direction at a given position.
  def match_diagonally_SW_to_NE(row, col)
    # Counts matching tokens to the Southwest of given position.
    curr_token = get_token_at(row, col)

    return 0 if curr_token.nil?

    initial_token = curr_token
    curr_row = row
    curr_col = col
    in_a_row_SW = -1

    while curr_token == initial_token
      in_a_row_SW += 1
      curr_row -= 1
      curr_col -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    
    # Counts matching tokens to the Northeast of given position.
    curr_token = get_token_at(row, col)
    curr_row = row
    curr_col = col
    in_a_row_NE = -1

    while curr_token == initial_token
      in_a_row_NE += 1
      curr_row += 1
      curr_col += 1

      curr_token = get_token_at(curr_row, curr_col)
    end
    
    in_a_row_SW + in_a_row_NE + 1
  end

  # Returns the number of diagonally matching tokens from a Northwest to Southeast direction at a given position.
  def match_diagonally_NW_to_SE(row, col)
    # Counts matching tokens to the Northwest of given position.
    curr_token = get_token_at(row, col)

    return 0 if curr_token.nil?

    initial_token = curr_token
    curr_row = row
    curr_col = col
    in_a_row_NW = -1

    while curr_token == initial_token
      in_a_row_NW += 1
      curr_row += 1
      curr_col -= 1

      curr_token = get_token_at(curr_row, curr_col)
    end

    
    # Counts matching tokens to the Southeast of given position.
    curr_token = get_token_at(row, col)
    curr_row = row
    curr_col = col
    in_a_row_SE = -1

    while curr_token == initial_token
      in_a_row_SE += 1
      curr_row -= 1
      curr_col += 1

      curr_token = get_token_at(curr_row, curr_col)
    end
    
    in_a_row_NW + in_a_row_SE + 1
  end
end
