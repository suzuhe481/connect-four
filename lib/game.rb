class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def start
    puts "Welcome to Connect Four."
    puts "The goal of this game is to get 4 of your tokens in row, either horizontally, vertically, or diagonally."
  end
end
