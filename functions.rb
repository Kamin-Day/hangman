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

#Takes in the chances remaining, the current game field, 
# and a list of letters which have already been used
# informs the player about the game state at the start of each round.
def startRound(chances, gameField, used)
	puts chancesToS(chances) + "       " + guessedToS(used)
	puts displayWord(gameField)
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
	if chances == 0
		return "Game Over!"
	else
	return "You have " + chances.to_s + " guesses remaining!"
	end
end

#Takes in the gameField, and checks if each character has yet been
#guessed or not. If not, display a "_" in its place
#If it has been guessed, display the key as a character
#Returns a string such as "ha_gm__", a partically complete hangman!

def displayWord(gameField)
	displayString = ""
	gameField.each do |c|
		if c[c.keys[0]] == false
			displayString += "_"
		else
			displayString += c.keys[0]
		end
	end
	return displayString
end

#Grabs and returns user input
def getGuess 
	puts "Guess a letter:"
	return gets.chomp.to_s
end

# takes in a string from the user from getGuess,
# checks to make sure it is valid, with only one character being a letter
# if it is valid, it returns the valid guess
# otherwise, it prompts the user to guess again.
def validGuess(guess)
	if guess.length > 1 || letter?(guess) == false
		puts "You can only choose one letter. Numbers or symbols don't work!"
		validGuess(getGuess)
	else
		return guess
	end
end

#Takes in a guess string
#If the string contains numbers, it will return false
#If the string contains only "letter" characters, returns true
def letter?(guess)
   return guess[/[a-zA-Z]+/] == guess
end



  # account = row["Account"].chomp

	 #  if !accounts[account]
	 #    accounts[account] = {
	 #      tally: 0.00,
	 #      categories: {
	 #      }
	 #    }
	 #  end