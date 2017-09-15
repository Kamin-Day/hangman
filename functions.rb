require "pry"

#Opens a dictionary file of words
#Randomly chooses a line to read
#Returns the word contained in that line.
def selectWord
  chosen_line = nil
  File.foreach("dictionary.txt").each_with_index do |line, number|
    chosen_line = line if rand < 1.0/(number+1)
  end
  return chosen_line.chomp
end

#Takes in the game word, and creates a list of hashes
#There is one hash for each letter in the game word
#Each key represents that value
#Each value is set to false to represent a letter that has not been guessed.
#Returns the list of hashes.
def setPlayField(gameWord)
	gameField = []
	gameWord.split('').each do |c|
		gameField.push(Hash[c, false])
	end
	return gameField
end

#Takes in the game word and returns an array of each letter in the word
def setListOfLetters(gameWord)
	list = []
	gameWord.split('').each do |l|
		list.push(l)
	end
	return list
end

# #Takes in the chances remaining, the current game field, 
# # and a list of letters which have already been used
# # informs the player about the game state at the start of each round.
# def startRound(chances, gameField, used)
# 	puts chancesToS(chances) + "       " + guessedToS(used)
# 	puts " "
# 	puts displayWord(gameField)
# 	puts " "
# end

#Calls functions to create a message to display with information 
# about the current round
def displayRoundInfo(chances, used)
	return chancesToS(chances) + "       " + guessedToS(used)
end

#Takes in a list of letter which have been guess, 
#If no letters have been guessed, it returns that statement
#Otherwise, it returns a string leting the player know which 
#letters have already been used.
def guessedToS(used)
	if used.empty? == true
		return "You haven't guesed any letters yet."
	else
		usedString = "You have already guessed: "
		used.each do |g|
			usedString += (g + " ")
		end
	return usedString
	end
end

#Takes in the number of chances remaining,
#and returns a string informing the player of how many tries they have left.
def chancesToS(chances)
	return "You have " + chances.to_s + " guesses remaining!"
end

#Takes in the gameField, and checks if each character has yet been
#guessed or not. If not, display a "_" in its place
#If it has been guessed, display the key as a character
#Returns a string such as "ha_gm__", a partically complete hangman!

def displayWord(gameField)
	displayString = ""
	gameField.each do |c|
		if c[c.keys[0]] == false
			displayString += "_ "
		else
			displayString += c.keys[0] + " "
		end
	end
	return "Your word is... " + displayString
end

#Prompts the user to enter a guess
def guessPrompt 
	return "Guess a single letter:..."
end

#Grabs and returns user input
def getGuess 
	return gets.chomp.to_s
end

# # takes in a string from the user from getGuess,
# # checks to make sure it is valid, with only one character being a letter
# # if it is valid, it returns the valid guess
# # otherwise, it prompts the user to guess again.
# def validGuess(guess)
# 	if guess.length > 1 || guess.length < 0 || letter?(guess) == false
# 		puts "You can only choose one letter. Numbers or symbols don't work!"
# 		validGuess(getGuess)
# 	else
# 		return guess
# 	end
# end

#Takes in a guess and checks if it is valid
#returns false untill guess is valid
#when valid, returns true
def guessIsValid(guess) 
	if guess.length > 1 || guess.length < 1 || letter?(guess) == false
		return false
	else 
		return true
	end
end

#Takes in the users guess, and checks if it has been used already
#if it has already been used, returns false
#if it is a new option, returns true
def newOption(guess, lettersGuessed)
	if lettersGuessed.include? guess
		return false
	else
		return true
	end
end

#Takes in a guess string
#If the string contains numbers, it will return false
#If the string contains only "letter" characters, returns true
def letter?(guess)
   return guess[/[a-zA-Z]+/] == guess
end

#Takes in the users guess and a list letters that are in the word
# if their guess matches, returns true
# if their guess does not match, returns false
def checkGuess(guess, correctL) 
	if correctL.include? guess
		return true
	else
		return false
	end
end

#Takes in a guess and the letters guessed so far,
#adds the guess to the list
#returns the new list
def addGuessed(guess, wordsGuessed)
	wordsGuessed.push(guess)
	return wordsGuessed
end

#Lets the user know their guess was correct
#returns an updated game field
def correctGuess(guess, gameField)
	gameField.each do |c|
		if guess == c.keys[0]
			c[guess] = true
		end
	end
	return gameField
end

#Returns a statement letting the user know what their guess was,
# and that it was correct
def informCorrect(guess)
	return "Good work! There is a " + guess + " in your word"
end

#Reduces the number of chances remaining by one
def incorrectGuess(chances)
	return chances -= 1
end

#Returns a statement to let the user know their guess did not match any of the letters in their word
def informIncorrect
	return "Sorry! Try again!"
end

#Takes in the game field
#Checks to see if the user has won the game
#If all of the letters have been revealed, 
# => the player has won and win? returns true
#If any of the letters have not been revealed,
# => the player has not won and win? returns false
def win?(gameField)
	gameField.each do |c|
		if c[c.keys[0]] == false
			return false
		end
	end
end

#Takes the game word and builds a message to display 
#If the player was unable to guess their word
def lose(gameWord) 
	return 'Game Over! Your word was "' + gameWord + '".'
end

#Takes the game word and chances remaining to build 
# a message to display if the player won the game
def winMessage(gameWord, chancesRemaining) 
	return 'Congradulations, you won by guessing the word "' + gameWord + '" with ' + chancesRemaining.to_s + ' chances remaining!'
end

# Returns a statement notifying the player that they have already used a guess
def canNotReuseGuess
	return "You've already tried that, pick a different guess"
end

# Returns a statement notifying the player that their guess is not valis
def invalidGuess
	return"Enter a single letter.. Numbers and other symbols don't work!"
end

  # account = row["Account"].chomp

	 #  if !accounts[account]
	 #    accounts[account] = {
	 #      tally: 0.00,
	 #      categories: {
	 #      }
	 #    }
	 #  end