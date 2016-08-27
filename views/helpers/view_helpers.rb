require 'hangman_engine'

module ViewHelpers
  
  def show_board(game)
    HangmanEngine::Drawer.draw_board(game)
  end
  
end