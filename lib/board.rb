# frozen_string_literal: true

class Board
  attr_reader :board, :marker

  def initialize
    create_board
  end

  def create_board
    @board = ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']
  end

  def display_board
    "#{board[0]}|#{board[1]}|#{board[2]}\n" \
    "-----------\n" \
    "#{board[3]}|#{board[4]}|#{board[5]}\n" \
    "-----------\n" \
    "#{board[6]}|#{board[7]}|#{board[8]}"
  end

  def mark_position(index, marker)
    board[index] = ' ' + marker + ' '
  end
end
