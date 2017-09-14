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
end

describe "Statments" do
	it "ensures proper informatation about letters guessed is sent to the user" do
		result = guessedToS(["a", "b", "c", "d", "e"])
		result2 = guessedToS([])

		expect(result).to eq("You have already guessed: a b c d e ")
		expect(result2).to eq("You haven't guesed any letters yet.")
	end

	it "ensures that the user is correctly informed of how many chances they have remaining." do
		result = chancesToS(0)
		result2 = chancesToS(4)

		expect(result).to eq("Game Over!")
		expect(result2).to eq("You have 4 guesses remaining!")
	end		

	it "makes sure that guessed letters are displaying correctly" do
		result = displayWord([{"p"=> false},{"o"=> false},{"k"=> false},{"e"=> false},{"m"=> false},{"o"=> false},{"n"=> false}])
		result2 = displayWord([{"p"=> true},{"o"=> false},{"k"=> true},{"e"=> false},{"m"=> true},{"o"=> false},{"n"=> false}])

		expect(result).to eq("_______")
		expect(result2).to eq("p_k_m__")
	end		
end

describe "Using A Guess" do
	it "ensures that a user guess is made up of valid characters, containing only letters" do
		result1 = letter?("a")
		result2 = letter?("aa")
		result3 = letter?("a1")
		result4 = letter?("1")
		result5 = letter?("21")
		result6 = letter?("1.")
		result7 = letter?("~")

		expect(result1).to eq(true)
		expect(result2).to eq(true)
		expect(result3).to eq(false)
		expect(result4).to eq(false)
		expect(result5).to eq(false)
		expect(result6).to eq(false)
		expect(result7).to eq(false)
	end

	# ===============================
	# ===   ===  /---\ |==\
	# = |   |_|  |   | |  /
	# ===.  |\.  |   | |==\
	# =.    | \  \___/ |__/

	it "ensures that a user guess is valid containing only 1 letter" do
		result1 = validGuess("a")
		result2 = validGuess("1a")
		result3 = validGuess("as")


		expect(result1).to eq("a")
	end
end








