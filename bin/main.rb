#!/usr/bin/env ruby

# frozen_string_literal: true

require "./lib/board.rb"
require "./lib/player.rb"
require "./lib/game.rb"

puts " Welcome to Tic Tac Toe!"
puts "Player 1, what is your name?"
player_1 = Player.new(gets.chomp)
player_1.marker = "x"
puts "#{player_1.name}. You are x"
puts "Now, player number 2, what is your name?"
player_2 = Player.new(gets.chomp)
player_2.marker = "o"
puts "#{player_2.name}, you are o"
puts "Enter OK to continue"

repeat_game = true

while repeat_game
  new_board = Board.new 
  game = Game.new(player_1, player_2, new_board)

  while game.game_on
    puts game.ask_position
    puts new_board.display_board if game.turn == 0 
    move = gets.chomp.to_i

    if game.valid?(move)
      if game.occupied?(move)
        while game.occupied?(move)
          puts "This position is already taken. Enter a valid number between 1 to 9."
          move = gets.chomp.to_i
          until game.valid?(move)
            puts "This move is not valid. Enter a valid number between 1 to 9."
            move = gets.chomp.to_i
          end
        end
      else
        puts "The selected move is valid"
      end
    else
      until game.valid?(move)
        puts "This move is not valid. Enter a valid number between 1 to 9."
        move = gets.chomp.to_i
        while game.occupied?(move)
          puts "This position is already taken. Enter a valid number between 1 to 9."
          move = gets.chomp.to_i
        end
      end
    end

    game.play(move)
    puts game.board.display_board

    if game.draw?
      puts "Its a tie"
      game.game_on = false
    end

    if game.win?
      puts game.display_winner
      game.game_on = false
    end
  end

  unless game.game_on
    puts "Restart game? (Enter yes or no)"
    case gets.chomp
    when "yes"
      puts "Enter OK to continue."
    when "no"
      repeat_game = false
      abort "Game over"
    end
  end
end
