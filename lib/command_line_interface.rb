def welcome
    puts "Hello and welcome!"
end

def get_character_from_user
  puts "please enter a character"
  return gets.chomp
end

def get_preference
  puts "what do you want to know? Type 'films', 'appearance', 'homeworld', or 'exit' to exit the program."
  return gets.chomp
end
