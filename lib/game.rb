# frozen_string_literal: true

class Game
  attr_accessor :turn, :board, :game_on
  attr_reader :player1, :player2, :player1_moves, :player2_moves, :win_combinations

  def initialize(player1, player2)
    @turn = 0
    @game_on = true
    @player1 = player1
    @player2 = player2
    @player1_moves = []
    @player2_moves = []
    @win_combinations = [[0, 1, 2],
                         [3, 4, 5],
                         [6, 7, 8],
                         [0, 3, 6],
                         [1, 4, 7],
                         [2, 5, 8],
                         [2, 4, 6],
                         [0, 4, 8]]
  end

  def ask_position
    player_name = turn.even? ? player1.name : player2.name
    "#{player_name}, choose a position"
  end

  def valid?(user_input)
    user_input.between?(1, 9)
  end

  def play(user_input)
    index = user_input - 1
    player_marker = turn.even? ? player1.marker : player2.marker

    board.mark_position(index, player_marker)
    moves(index)

    @turn += 1
  end

  def moves(index)
    if turn.even?
      player1_moves << index
    else
      player2_moves << index
    end
  end

  def occupied?(user_input)
    index = user_input - 1
    player1_moves.include?(index) || player2_moves.include?(index)
  end

  def draw?
    turn >= 9 unless win?
  end

  def win?
    result = false
    i = 0
    while i < win_combinations.length
      if (win_combinations[i] & player1_moves) == win_combinations[i] ||
         (win_combinations[i] & player2_moves) == win_combinations[i]
        result = true
        break
      end
      i += 1
    end
    result
  end

  def display_winner
    player_name = turn.even? ? player2.name : player1.name
    "#{player_name} wins!"
  end
end
