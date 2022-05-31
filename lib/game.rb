class Game
  attr_accessor :board, :curr_player, :curr_token, :curr_round

  def initialize
    @board = Board.new
    @curr_player = "Player 1"
    @curr_token = "⛉"
    @curr_round = 1
  end

  # Prints out the game's introductiona and instructions.
  def start
    puts "Welcome to Connect Four."
    puts "The goal of this game is to get 4 of your tokens in row, either horizontally, vertically, or diagonally."
    puts "Player 1: ⛉"
    puts "Player 2: ⛊"
    puts "Each player takes turns picking a column to drop their token."
    puts "Player 1 will go first."
    puts

    # @board.print_board

    # @board.drop_token(4, "X")
    # @board.drop_token(3, "O")

    # @board.print_board


    rounds_start
  end

  # Starts the game's rounds.
  def rounds_start
    puts "rounds started"
    col_dropped = ""

    
    # @board.drop_token(4, @curr_token)
    # @board.drop_token(4, @curr_token)

    until curr_round > 42
      puts "Round #{curr_round}"
      @board.print_board

      loop do
        puts "#{curr_player}, pick a column for your token #{curr_token}"
        col_dropped = gets.chomp.to_i
        
        break if validate_play(col_dropped)

        puts "Enter a valid column position."
      end

      # puts "last play is #{col_dropped}"

      row_dropped = @board.drop_token(col_dropped, @curr_token)
      if @board.check_win?(row_dropped, col_dropped)
        @board.print_board
        puts "#{curr_player} WINS!"
        exit
      end
      switch_player

      @board.print_board

    end

    puts "End of game."
    @board.print_board
  end

  # Validates a player's column choice.
  def validate_play(col_play)
    result = false

    if col_play.to_s =~ /^[1-7]$/
      # puts "Between 1-7"
      result = true
    else
      return false
    end

    if @board.column_full?(col_play.to_i)
      puts "Column is full."
      result = false
    end

    result
  end

  # Goes to the next round and switches player.
  def switch_player
    if @curr_player == "Player 1"
      @curr_player = "Player 2"
      @curr_token = "⛊"
    else
      @curr_player = "Player 1"
      @curr_token = "⛉"
    end

    @curr_round += 1
  end
end
