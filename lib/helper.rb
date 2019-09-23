class Board 
    attr_reader :WIN_COMBINATIONS
    attr_accessor :board
    def initialize
        @WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
        @board = [[0,1,2],[3,4,5],[6,7,8]]
end

def display_board
    @board.each do |i|
        i.each do |j|
            print "| #{j} |"
        end
        puts ""
end

def input_to_index
    user_input_index = user_input.to_i - 1
end

def move(board, user_input_index, user_input)
    board
    user_input_index = value
    user_input = []
end
