# This is the game hangman

require 'random-word'
def word_generator ()
    word = RandomWord.adjs.next.split("")
    puts word.join(' ')

    word_hashed = word.each do |i|
        i = "x"
        puts i
    end
    puts word_hashed.join(' ')
end

word_generator