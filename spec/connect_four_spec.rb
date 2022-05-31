require "./lib/game.rb"
require "./lib/board.rb"

player1 = "⛉"
player2 = "⛊"

# NOTE
# Remove "if false" from bottom of each describe method test to run those tests.

# Example board
board = Board.new
board.drop_token(1, player1)
board.drop_token(1, player2)
board.drop_token(1, player2)

board.drop_token(2, player2)
board.drop_token(2, player2)
board.drop_token(2, player2)
board.drop_token(2, player1)

board.drop_token(3, player2)
board.drop_token(3, player1)
board.drop_token(3, player1)
board.drop_token(3, player1)
board.drop_token(3, player2)
board.drop_token(3, player2)

board.drop_token(4, player1)
board.drop_token(4, player1)
board.drop_token(4, player2)
board.drop_token(4, player1)

board.drop_token(5, player2)
board.drop_token(5, player1)
board.drop_token(5, player2)
board.drop_token(5, player1)

board.drop_token(6, player1)
board.drop_token(6, player2)
board.drop_token(6, player2)
board.drop_token(6, player2)

board.drop_token(7, player2)
board.drop_token(7, player1)
board.drop_token(7, player1)
board.drop_token(7, player1)
board.drop_token(7, player2)
board.drop_token(7, player2)
board.print_board

puts "token: .#{board.get_token_at(6, 5)}."

describe Board do
  describe "#match_horizontally" do
    it "returns number of horizontally matching tokens" do
      expect(board.match_horizontally(6, 5)).to eql(0)
    end

    it "returns number of horizontally matching tokens" do
      expect(board.match_horizontally(2, 4)).to eql(3)
    end

    it "returns number of horizontally matching tokens" do
      expect(board.match_horizontally(4, 6)).to eql(1)
    end

    it "returns number of horizontally matching tokens" do
      expect(board.match_horizontally(3, 2)).to eql(2)
    end

    it "returns number of horizontally matching tokens" do
      expect(board.match_horizontally(4, 4)).to eql(4)
    end
  end if false

  describe "#match_vertically" do
    it "returns number of vertically matching tokens" do
      expect(board.match_vertically(6, 5)).to eql(0)
    end

    it "returns number of vertically matching tokens" do
      expect(board.match_vertically(2, 1)).to eql(2)
    end

    it "returns number of vertically matching tokens" do
      expect(board.match_vertically(4, 3)).to eql(3)
    end

    it "returns number of vertically matching tokens" do
      expect(board.match_vertically(1, 7)).to eql(1)
    end

    it "returns number of vertically matching tokens" do
      expect(board.match_vertically(1, 4)).to eql(2)
    end
  end if false

  describe "#match_diagonally_SW_to_NE" do
    it "returns the number of diagonally matching tokens from SW to NE" do
      expect(board.match_diagonally_SW_to_NE(6, 5)).to eql(0)
    end

    it "returns the number of diagonally matching tokens from SW to NE" do
      expect(board.match_diagonally_SW_to_NE(3, 3)).to eql(2)
    end

    it "returns the number of diagonally matching tokens from SW to NE" do
      expect(board.match_diagonally_SW_to_NE(3, 6)).to eql(1)
    end

    it "returns the number of diagonally matching tokens from SW to NE" do
      expect(board.match_diagonally_SW_to_NE(3, 7)).to eql(1)
    end

    it "returns the number of diagonally matching tokens from SW to NE" do
      expect(board.match_diagonally_SW_to_NE(1, 5)).to eql(2)
    end
  end if false

  describe "#match_diagonally_NW_to_SE" do
    it "returns the number of diagonally matching tokens from NW to SE" do
      expect(board.match_diagonally_NW_to_SE(6, 5)).to eql(0)
    end

    it "returns the number of diagonally matching tokens from NW to SE" do
      expect(board.match_diagonally_NW_to_SE(3, 3)).to eql(3)
    end

    it "returns the number of diagonally matching tokens from NW to SE" do
      expect(board.match_diagonally_NW_to_SE(2, 4)).to eql(3)
    end

    it "returns the number of diagonally matching tokens from NW to SE" do
      expect(board.match_diagonally_NW_to_SE(2, 5)).to eql(2)
    end

    it "returns the number of diagonally matching tokens from NW to SE" do
      expect(board.match_diagonally_NW_to_SE(1, 5)).to eql(1)
    end
  end if false

  describe "#check_win?" do
    it "returns true if a token is part of a four in a row" do
      expect(board.check_win?(3, 3)).to eql(false)
    end

    it "returns true if a token is part of a four in a row" do
      expect(board.check_win?(4, 5)).to eql(true)
    end

    it "returns true if a token is part of a four in a row" do
      expect(board.check_win?(1, 5)).to eql(false)
    end

    it "returns true if a token is part of a four in a row" do
      expect(board.check_win?(2, 7)).to eql(false)
    end
  end if false

  describe "#column_full?" do
    it "returns true if a column is full" do
      expect(board.column_full?(1)).to eql(false)
    end

    it "returns true if a column is full" do
      expect(board.column_full?(3)).to eql(true)
    end

    it "returns true if a column is full" do
      expect(board.column_full?(5)).to eql(false)
    end

    it "returns true if a column is full" do
      expect(board.column_full?(7)).to eql(true)
    end
  end if false
end