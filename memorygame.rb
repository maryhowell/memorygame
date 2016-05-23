require "pry"
input = ""
done = false
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

def display_temp_board user_board, answers, pair, legend
  user_board[pair.first] = answers[pair.first]
  user_board[pair.last] = answers[pair.last]
  display_the_board user_board
end

def key legend, answers
  Hash[legend.zip(answers)]
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

# def correct_key? pair
#   check = false
#   until check
#     if ("a" .. "f").include?(pair)
#       check = true
#     else pair.length > 1
#       puts "please try another letter from the Key"
#       pair = gets.chomp
#     end
#   end
#   pair
# end

def answers legend
  correct =
  [
    1, 2, 3,
    1, 2, 3
  ]
  Hash[legend.zip(correct)]
  # answers.shuffle
end

def user_board legend
  board =
  [
    "@", "@", "@",
    "@", "@", "@"
  ]
  Hash[legend.zip(board)]
end

def update_board_if_correct user_board, answers, pair, legend
  if answers[pair.first] == answers[pair.last]
    user_board[pair.first] = answers[pair.first]
    user_board[pair.last] = answers[pair.last]
  end
  user_board
end

def win? answers, user_board, legend
  if user_board(legend) == answers(legend)
    puts "YAY you won!!"
    done = true
  else
    done = false
  end
  done
  # binding.pry
end

def play_again?
  puts "Would you like to play again y or n?"
  again = gets.chomp
  if again == "n"
    puts "thanks for playing"
    done = true
  end
end

user_board = user_board(legend)

puts "Welcome to Memory:"

display_the_board(user_board)
loop do
  until win?(answers(legend), user_board, legend)
    display_the_legend(legend)
    pair = choose_items
    temp_board = user_board.clone
    display_temp_board(temp_board, key(legend, answers(legend)), pair, legend)
    user_board = update_board_if_correct(user_board, key(legend, answers(legend)), pair, legend)
    break if done == true
  end
  again = play_again?
  break if again == "n"
  done = false
  # answers = answers.shuffle
end
