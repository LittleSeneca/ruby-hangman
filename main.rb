# This is the game hangman

require 'random-word'
word = RandomWord.adjs.next.split("")
$word = word
$word_upper = word.map { |string| string.upcase }
$word_hashed = word.map { |string| string = "x" }
$tries = $word.length()

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
def check_input_length (letter)
    letter.length() - 1 == 1
end
def check_input_accuracy (letter)
    $word.include? "letter" 
end
welcome

while $tries != 0 do
    puts "Your word is #{$word_hashed.join("")}"
    puts "You have #{$tries} tries remaining"
    puts "Type any letter you want now, and please, just one letter"
    choice = gets
    choice_value = choice.split(" ")[0]
    if check_input_length(choice) == true
        puts check_input_accuracy(choice)
        puts $word.join("")
        if check_input_accuracy(choice) == true
            puts "Yay! You guessed correctly"
            sleep(2)
            system('clear')
        else
            puts "Nope, you are Killing him!"
            $tries = $tries -1
            sleep(2)
            system('clear')
        end
    else
        puts "That was not a single digit enty, please try again"
        sleep(2)
        system('clear')
    end
end