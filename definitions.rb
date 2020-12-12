input = "srtieonrsat"
$input_array = input.split("")

attempt = gets.split("")

# checking the input to see if it matches the requirements
def check_input (letter)
  # does the input match the single digit length requirement?
  if letter.length() -1 == 1
      # is the input a letter or a number?
      if letter[0][/[a-zA-Z]+/]  == letter[0] 
          # is the input a match to the generated word? 
          if $input_array.include? (letter[0])
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

puts attempt
puts check_input(attempt)