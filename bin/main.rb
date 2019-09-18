#basic steps
p "Player One, please, make a move."
player_1_input = gets.chomp
p "Move completed!"
p "Player Two, please, make a move."
player_2_input = gets.chomp
p "Move completed"

#if a player tries to make a move to an occupied space
p "Player One, please, make a move."
player_1_input = gets.chomp
p "This space is already occupied!"

#repeat basic steps until a player wins

#when a player wins
p "Player One wins!"

#if game ties
p "It's a tie."