require_relative "api_communicator_factor.rb"

def welcome
    # puts out a welcome message here!
    puts "Hi, and welcome to the Star Wars database. It's not a trap."
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  answer = gets.chomp
  answer
end

def what_detail(character)
  puts "Please select which detail you would like to view:"
  return_keys(character)
  detail = gets.chomp
end

#what_detail("Luke Skywalker")
