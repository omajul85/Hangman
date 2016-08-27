require 'spec_helper.rb'

feature 'Losing a Game:' do
	context "User loses a game" do
		before do
			set_game("cat", "Is a Pet")
		end

		scenario 'user does not guess the word' do
			guess('p')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 2'
			expect(page).to have_content '_ _ _ '
			guess('e')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 1'
			expect(page).to have_content '_ _ _ '
			guess('o')
			expect(page).to have_current_path('/game_over')
			expect(page).to have_content 'Boooo, You lose!'
			expect(page).to have_content 'The word was cat'
		end

		scenario 'user restarts the game' do
			guess 'p'
			guess 'e'
			guess 'o'
			expect(page).to have_current_path('/game_over')
			expect(page).to have_content 'Boooo, You lose!'
			restart
			expect(page).to have_current_path('/')
		end

	end
end