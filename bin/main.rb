#!/usr/bin/env ruby
=begin
class Board 
    attr_reader :board

    def initialize
        @board = board
    end
@board is a 3x3 matrix
    def board
        @board = [
            0,1,2,
            3,4,5,
            6,7,8
        ]
    end

     def display_board(board)
    puts ''
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '--- --- ---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '--- --- ---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts ''
  end
=end
#game = true
#step 1 player one 
p "Player One, please, make a move from @board"
player_1_input = gets.chomp
p "Move completed!"

#Print board with registered move
p "display_board"

#step 2 player two 
p "Player Two, please, make a move from @board"
player_2_input = gets.chomp
p "Move completed"

#move check
=begin 
if player_input is not found in board
    p "invalid move"
=end

#Print board with registered move
p "display_board"

#The above steps would be repeated
=begin
while !WIN_COMBINATION do
    "step 1" & "step 2"
end
=end

#Print board with registered move
p "display_board"

#if a player tries to make a move to an occupied space
p "Player One, please, make a move."
player_1_input = gets.chomp
p "This space is already occupied!"

#if a player enters a move that matches the @WIN_COMBINATION
#game = false
p "${Player} won!"

#Print board with registered move
p "display_board"

#if all spaces are occupied without a @WIN_COMBINATION
#game = false
p "Match is a draw"

#Print board with registered move
p "display_board"
end