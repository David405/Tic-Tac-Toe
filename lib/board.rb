# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize
    create_board
    display_board(@board)
  end

  def create_board
    @board = [
      0, 1, 2,
      3, 4, 5,
      6, 7, 8
    ]
  end

  def update_board(position, player)
    @board[position] = player.marker
    display_board(@board)
  end

  private

  def display_board(board)
    puts ''
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '--- --- ---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '--- --- ---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
end
