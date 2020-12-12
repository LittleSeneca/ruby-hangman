def even?(x)
    (x % 2) == 0 
end
def more_then_five?(x)
  x > 5 
end 
def less_then_three?(x)
  x < 3 
end 
puts even?(2)
puts even?(3)
puts more_then_five?(3)
puts more_then_five?(6)
puts less_then_three?(2)
puts less_then_three?(4)

input = "srtieonrsat"
$input_array = input.split("")

attempt = "r"

def check_input_accuracy (letter)
    $input.include? "letter" 
end

check_input_accuracy (attempt)