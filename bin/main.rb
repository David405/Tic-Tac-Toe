#basic steps 
p "Player One, please, make a move"
player_1_input = gets.chomp
p "Move completed!"

#Print board with registered move
p "@board"

p "Player Two, please, make a move."
player_2_input = gets.chomp
p "Move completed"

#Print board with registered move
p "@board"


#The above steps would be repeated
p "Player One, make another move"

#Print board with registered move
p "@board"

p "Player Two, make another move"

#Print board with registered move
p "@board"

#if a player tries to make a move to an occupied space
p "Player One, please, make a move."
player_1_input = gets.chomp
p "This space is already occupied!"

#if a player enters a move that matches the @WIN_COMBINATION
p "${Player} won!"

#Print board with registered move
p "@board"

#if all spaces are occupied without a @WIN_COMBINATION
p "Match is a draw"

#Print board with registered move
p "@board"

