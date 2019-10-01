class Player 
    require_relative 'board'

    attr_reader :name, :marker

    def initialize(mark, marker)
        @name = name
        @marker = marker
    end

    def move(board)
        position = get_move(board)
        board.update_board(position.to_i, self)
    end

    def get_move(board)
        puts "#{name}, choose a position to place your #{marker}"
        position = gets.chomp

        until position =~ /^[0-8]{1}$/ && (board.board[position.to_i] != 'x' && board.board[position.to_i] != 'o')
            puts 'Enter a number that is valid'
            position = gets.chomp
    end
    position
end