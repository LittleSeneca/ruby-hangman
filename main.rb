# This is the game hangman

require 'random-word'

word = RandomWord.adjs.next.split("")
$word = word
$word_upper = word.map { |string| string.upcase }
$word_hashed = word.map { |string| string = "#" }
$word_nil = []
$wrong_letters = []
for length in $word do
  $word_nil.push(nil)
end
$tries = $word.length()
# Greeting the user of the program
def welcome
  puts
  puts "Welcome to hangman!"
  puts
  puts "The stakes are high, the prize sucks,"
  puts "And you have #{$tries} tries to pull this off..."
  puts "Are you ready? If you think so, press any key now"
  gets
  system('clear')
end

# Checking the input to see if it matches the requirements
def check_input(letter)
  # does the input match the single digit length requirement?
  if letter.length() -1 == 1
    # is the input a letter or a number?
    if letter[0][/[a-zA-Z]+/]  == letter[0] 
      # is the input a match to the generated word? 
      if $word.include? (letter[0])
        # the input matches the generated word
        return 0
      else
        # the input is valid but does not match the word
        return 1
      end
    else
      # the input meets the length requirement but is not a letter
      return 2
    end
  else
    # the input is not valid
    return 3
  end
end

# Stating the location of the first match
def match_input(letter)
  return $word.index(letter[0])
end
welcome

# Main Guessing Algorithm, while loop which checks input against the generated word.

while $tries != 0 do
  system "clear"
  word_hashed_local = $word_hashed
  if $word == $word_nil
    puts "Congradulations, You have won"
    break
  end
  puts "Your word is #{word_hashed_local.join}"
  puts "You have #{$tries} tries remaining"
  puts "Letters you guessed wrong: #{$wrong_letters.join(",")}"
  puts "Type any letter you want now, and please, just one letter - Then, press enter"
  choice = gets.split("")
  if check_input(choice) == 0 
    puts "You selected well"
    word_hashed_local[Integer(match_input(choice))] = String(choice[0])
    $word[Integer(match_input(choice))] = nil
  elsif check_input(choice) == 1
    puts "You selected wrong"
    $tries = $tries - 1
    $wrong_letters.push(choice[0])
  elsif check_input(choice) == 2
    puts "You must enter a letter"
  elsif check_input(choice) == 3 
    puts "You may only enter one letter"
  else
    puts "You are wrong"
  end
end
if $tries == 0 
  puts "You lost the game. Sorry"
  puts "goodbye"
else
  puts "You had #{$tries} left in your attempt"
  puts "goodbye"
end
