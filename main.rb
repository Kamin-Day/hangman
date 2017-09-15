require "pry"
require_relative "functions.rb"





#Calls a function to set gameWord to a string representing a 
#word randomly selected from a word dictionary.
#This is the word the player will be trying to guess
gameWord = selectWord

#Sets the starting number of guesses
chancesRemaining = 6
lettersGuessed = []

#calls a funtion to set the gameField as a list of hashes with keys
#representing each character in the game word, with a value of false,
#untill the letter has been guessed.
gameField = setPlayField(gameWord)

#Creates an array of letter in the game word to check later
lettersInPlay = setListOfLetters(gameWord)
binding.pry
#Checks to see if the game is still in session
#If the user has no more chances, the game is over
#If the user has won the game by guessing all of the letters correctly, the game is over
while chancesRemaining > 0 && win?(gameField) == false do
	puts gameWord
	# (chancesRemaining, gameField, lettersGuessed)

	#Calls functions to gather information to display
	# regarding the current round of gameplayxs
	puts displayRoundInfo(chancesRemaining, lettersGuessed)
	puts ""
	puts displayWord(gameField)
	puts ""
	#Checks if a guess is valid
	#gets user input untill a guess is valid
	#provides feedback based on guesses
	#once a valid guess has been recieved, the game resumes
	puts guessPrompt
	guess = getGuess
	until guessIsValid(guess) == true && newOption(guess, lettersGuessed) == true do
		if newOption(guess, lettersGuessed) == false
			puts canNotReuse
			puts guessPrompt
			guess = getGuess
		end
		if guessIsValid(guess) == false
			puts invalidGuess
			puts guessPrompt
			guess = getGuess
		end
		# guess = getGuess
	end

	#Adds the users guess to a list of letters already guessed
	wordsGuessed = addGuessed(guess, lettersGuessed)

	# takes a valid guess and checks to see if it is one of the letters in the word to be guessed
	# if it is, true is returned and it updates the game field and congradulates the user
	# if it is not, the game field is left the same, the user is notified, and one of their chances is removed
	if checkGuess(guess, lettersInPlay) == true
		puts informCorrect(guess)
	 	correctGuess(guess, gameField)
	else
	 	chancesRemaining = incorrectGuess(chancesRemaining)
	 	puts informIncorrect
	end
	
end

#Checks to see if the game is over because the user has won
# or if they have ran out of chances and lost
# then calls a function to construct a message 
# informing the user of the games outcome
if win?(gameField) != false
	puts winMessage(gameWord, chancesRemaining) 
else
	puts lose(gameWord)
end


	
	# #Calls a function, which shows the user informtion about the current game state
	# startRound(chancesRemaining, gameField, letterssGuessed)

	# #Prompts the user to enter a value to guess 
	# #Checks the validity of the guess
	# #Asks for a new guess if invalid
	# #If valid, sets the user input to "guess"

	# # while valid? == false
	# guess = validGuess(getGuess)
	# wordsGuessed = addGuessed(guess, wordsGuessed)


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