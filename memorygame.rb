require "pry"
input = ""
legend = [
  "a", "b", "c",
  "d", "e", "f"
]

def display_the_board user_board
  puts user_board.values_at("a", "b", "c").join " "
  puts user_board.values_at("d", "e", "f").join " "
end

def key legend
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
  [
  1, 2, 3,
  1, 2, 3
  ]
end

def user_board legend
  board =
  [
  "@", "@", "@",
  "@", "@", "@"
  ]
  Hash[legend.zip(board)]
end

user_board = user_board(legend)

puts "Welcome to Memory:"


until input == "quit"
  display_the_board(user_board)
  display_the_legend(legend)
  choose_items

end
