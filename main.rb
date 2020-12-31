# This is the game hangman

require 'random-word'

word = RandomWord.adjs.next.split("")
$word = word
$word_upper = word.map { |string| string.upcase }
$word_hashed = word.map { |string| string = "x" }
$tries = $word.length()
# Greeting the user of the program
def welcome ()
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
def check_input (letter)
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

welcome

# Main Guessing Algorithm, while loop which checks input against the generated word.

while $tries != 0 do
    puts "Your word is #{$word_hashed.join("")}"
    puts "You have #{$tries} tries remaining"
    puts "Type any letter you want now, and please, just one letter"
    choice = gets.split("")

    if check_input(choice) == 0
        puts "You selected well"

    elsif check_input(choice) == 1
        puts "You selected wrong"
        $tries = $tries - 1
    elsif check_input(choice) == 2
        puts "You must enter a letter"
    elsif check_input(choice) == 3 
        puts "You may only enter one letter"
    else
        puts "You are wrong"
    end
end
puts "I like pie"