require 'hangman_engine'

class Game
	def self.create(word, allowed_attempts, clue)
		@game = HangmanEngine::Game.new(word, allowed_attempts, clue)
	end

	def self.instance
  	@game
  end

end