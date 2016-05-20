require "pry"
input = ""
legend = [
  "a", "b", "c",
  "d", "e", "f"
]
done = false

def display_the_board user_board
  puts
  puts user_board.values_at("a", "b", "c").join " "
  puts user_board.values_at("d", "e", "f").join " "
end

def display_temp_board user_board, answeres, pair, legend
  user_board[pair.first] = answeres[pair.first]
  user_board[pair.last] = answeres[pair.last]
  display_the_board user_board
end

def key legend, answeres
  Hash[legend.zip(answeres)]
end

def choose_items
  puts
  pair = []
  puts "Please pick 2 to check if they match"
  puts "First Guess"
  input = gets.chomp
  pair.push input
  puts "Second Guess"
  second_input = gets.chomp
  pair.push second_input
  return pair
end

def display_the_legend legend
  puts
  puts "Key:"
  puts legend.values_at(0, 1, 2).join " "
  puts legend.values_at(3, 4, 5).join " "
end

def answeres
  answeres =
  [
  1, 2, 3,
  1, 2, 3
  ]
  # answeres.shuffle
end

def show_board
  if #any if corret
    
  end
  display_the_board
end

def user_board legend
  board =
  [
  "@", "@", "@",
  "@", "@", "@"
  ]
  Hash[legend.zip(board)]
end

def update_board_if_correct user_board, answeres, pair, legend
  if answeres[pair.first] == answeres[pair.last]
  user_board[pair.first] = answeres[pair.first]
  user_board[pair.last] = answeres[pair.last]
  # display_the_board user_board
  end
  user_board
end

def win
  if


  end
end


def play_again?
  puts "Would you like to play again y or n?"
  input = gets.chomp
  if input == "n"
    puts "thanks for playing"
    done = true
  end
end

user_board = user_board(legend)

puts "Welcome to Memory:"


until input == "quit"
  display_the_board(user_board)
  display_the_legend(legend)
  pair = choose_items
  temp_board = user_board.clone
  display_temp_board(temp_board, key(legend, answeres), pair, legend)
  user_board = update_board_if_correct(user_board, key(legend, answeres), pair, legend)

  # play_again?
end
