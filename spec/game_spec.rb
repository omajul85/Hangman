require 'game'
require 'hangman_engine'

describe Game do
	let(:word) { "colombia" }
	let(:clue) { "Country in America" }
  subject(:game) { described_class.create(word, word.length, clue) }

  context "Methods of the class:" do
  	it "shows the word" do
	  	expect(game.word).to eq word
	  end

	  it "shows the clue" do
	  	expect(game.clue).to eq clue
	  end
	end

  context "When initializing the game:" do
	  it "array of guesses is empty" do
	  	expect(game.guesses).to eq []
	  end

	  it "number of attempts is equal to the length of the word" do
	  	expect(game.allowed_attempts).to eq word.length
	  end

	  it "game is not finished" do
	  	expect(game.finished?).to be false
	  end

	  it "game is not lost yet" do
	  	expect(game.lost?).to eq false
	  end

	  it "the board only contains underscores and empty spaces representing the secret word" do
	  	secret = "_ _ _ _ _ _ _ _ "
	  	expect(HangmanEngine::Drawer.draw_board(game)).to eq secret
	  end
	end

	context "Guessing a character:" do
		it "returns the number of attempts used if wrong character" do
			expect(game.guess('p')).to eq 1
		end

		it "returns the array with the correct characters guessed so far" do
			game.guess 'c'
			expect(game.guess('o')).to eq ["c", "o"]
		end

		it "the board contains the characters guessed so far" do
			game.guess 'c'
			game.guess 'o'
			str = "c o _ o _ _ _ _ "
			expect(HangmanEngine::Drawer.draw_board(game)).to eq str
		end
	end
end