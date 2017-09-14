require "pry"
require_relative "functions.rb"

#Calls a function to set gameWord to a string representing a 
#word randomly selected from a word dictionary.
#This is the word the player will be trying to guess
gameWord = selectWord

#Sets the starting number of guesses
chancesRemaining = 6
wordsGuessed = ["a", "b"]

#calls a funtion to set the gameField as a list of hashes with keys
#representing each character in the game word, with a value of false,
#untill the letter has been guessed.
gameField = setPlayField(gameWord)
lettersInPlay = setListOfLetters(gameWord)

#Calls a function, which shows the user informtion about the current game state
startRound(chancesRemaining, gameField, wordsGuessed)

#Prompts the user to enter a value to guess 
#Checks the validity of the guess
#Asks for a new guess if invalid
#If valid, sets the user input to "guess"
guess = validGuess(guess)



puts gameWord




#1
#Find a dictionary of some works from the web and save it to your project directory.

#2
#When a new game is started, your script should load in the dictionary and randomly 
# select a word between 5 and 12 characters long for the secret word.

#3
# You don't need to draw an actual stick figure (though you can if you want to!),
#  but do display some sort of count so the player knows how many more incorrect guesses 
#  	she has before the game ends. You should also display which correct letters have 
#  	already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) 
#  	and which incorrect letters have already been chosen.

#4
#Every turn, allow the player to make a guess of a letter. It should be case insensitive.
 # Update the display to reflect whether the letter was correct or incorrect. If out of 
 # guesses, the player should lose.

#5
# Now implement the functionality where, at the start of any turn, instead of making a
#  guess the player should also have the option to save the game.

#6
# When the program first loads, add in an option that allows you to open one of your 
# saved games, which should jump you exactly back to where you were whe


#Script to generate words of proper length
# input_lines = File.readlines('words.txt')
# File.open('dictionary.txt', 'w') do |f|
#     input_lines.each do |line|
#     	if line.chomp.length > 4 && line.chomp.length < 13
#     		f.write line
#     	end
#   end
# end