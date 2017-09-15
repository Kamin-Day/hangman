require "spec_helper"
require_relative "../functions.rb"

describe "wordSelection" do
	it "check that a valid string has been chosen to play with" do
		# Exercise
		result = selectWord().class

		# Verify
		expect(result).to eq(String)
	end

	# it "ensures the word selected is of reasonable length" do

	# 	result = selectWord()
	# 	expect(result).to satisfy(result.length > 4 && result.length < 13)
	# end
end
describe "gameField" do
	it "checks to make sure the game field is being created correctly" do
		# Exercise
		result = setPlayField("pokemon")
		# Verify
		expect(result.length).to eq(7)
		expect(result).to eq([{"p"=> false},{"o"=> false},{"k"=> false},{"e"=> false},{"m"=> false},{"o"=> false},{"n"=> false}])
	end
	it "makes sure a valid list of strings of single letters in returned" do
		result = setListOfLetters("mississippi")

		expect(result).to eq(["m", "i", "s", "s", "i", "s", "s", "i", "p", "p", "i"])
	end
end

describe "Statments" do
	it "ensures proper informatation about letters guessed is sent to the user" do
		result = guessedToS(["a", "b", "c", "d", "e"])

		expect(result).to eq("You have already guessed: a b c d e ")
	end
	it "ensures that no when no letters have been guessed yet, it is displayed properly" do
		result = guessedToS([])

		expect(result).to eq("You haven't guesed any letters yet.")
	end

	it "ensures that the user is correctly informed of how many chances they have remaining." do
		result = chancesToS(4)

		expect(result).to eq("You have 4 guesses remaining!")
	end	
	it "makes sure that guessed letters are displaying correctly if none have yet been correctly guessed" do
		result = displayWord([{"p"=> false},{"o"=> false},{"k"=> false},{"e"=> false},{"m"=> false},{"o"=> false},{"n"=> false}])

		expect(result).to eq("Your word is... _ _ _ _ _ _ _ ")
	end		
	it "makes sure that guessed letters are displaying correctly if some have been correctly guessed" do
		result = displayWord([{"p"=> true},{"o"=> false},{"k"=> true},{"e"=> false},{"m"=> true},{"o"=> false},{"n"=> false}])

		expect(result).to eq("Your word is... p _ k _ m _ _ ")
	end		
end

describe "Using A Guess" do
	it "ensures a correct return with one letter" do
		result = letter?("a")
		expect(result).to eq(true)
	end
	it "ensures a correct return with 2 letters" do
		result = letter?("aa")
		expect(result).to eq(true)
	end
	it "ensures a correct return with a letter and a number" do
		result = letter?("a1")
		expect(result).to eq(false)
	end
	it "ensures a correct return with 1 number" do
		result = letter?("1")
		expect(result).to eq(false)
	end
	it "ensures a correct return with 2 numbers" do
		result = letter?("21")
		expect(result).to eq(false)
	end
	it "ensures a correct return with 1 number and a character" do
		result = letter?("1.")
		expect(result).to eq(false)
	end
	it "ensures a correct return with a character" do
		result = letter?("~")
		expect(result).to eq(false)
	end
	it "checks validity of guess based on characters and length" do
		result = guessIsValid("dd")
		expect(result).to eq(false)
	end
	it "checks validity of guess based on characters and length" do
		result = guessIsValid("")
		expect(result).to eq(false)
	end
	it "checks validity of guess based on characters and length" do
		result = guessIsValid("d")
		expect(result).to eq(true)
	end
	it "checks to see if a letter has already been used" do
		result = newOption("d", ["", "a", "b", "c", "d"])
		expect(result).to eq(false)
	end
	it "checks to see if a letter has already been used" do
		result = newOption("", ["", "a", "b", "c", "d"])
		expect(result).to eq(false)
	end
	it "checks to see if a letter has already been used" do
		result = newOption("e", ["", "a", "b", "c", "d"])
		expect(result).to eq(true)
	end
end
describe "Game Sessions" do
	it "checks if the user has won the game" do
		result = win?([{"p"=> false},{"o"=> false},{"k"=> false},{"e"=> false},{"m"=> false},{"o"=> false},{"n"=> false}])
		expect(result).to eq(false)
	end
	it "checks if the user has won the game" do
		result = win?([{"p"=> true},{"o"=> true},{"k"=> true},{"e"=> true},{"m"=> true},{"o"=> true},{"n"=> true}])
		expect(result).to eq(true)
	end
end
describe "Game Outcome" do
	it "Makes sure a winning message is displayed with the game word correctly and chances left correctly" do
		result = winMessage("pokemon", 2)
		expect(result).to eq('Congradulations, you won by guessing the word "pokemon" with 2 chances remaining!')
	end
	it "Makes sure a game over message is displayed, informing the user they have lost and what word they were trying to guess" do
		result = lose("pokemon")
		expect(result).to eq('Game Over! Your word was "pokemon".')
	end
end
	

	




	# ===============================
	# ===   ===  /---\ |==\
	# = |   |_|  |   | |  /
	# ===.  |\.  |   | |==\
	# =.    | \  \___/ |__/

	# it "ensures that a user guess is valid containing only 1 letter" do
	# 	result1 = validGuess("a")
	# 	result2 = validGuess("1a")
	# 	result3 = validGuess("as")


	# 	expect(result1).to eq("a")
	# end






