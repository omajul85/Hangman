require 'spec_helper.rb'

feature 'Winning a Game:' do
	context "User wins a game" do
		before do
			set_game("cat", "Is a Pet")
		end

		scenario 'user guess the whole word' do
			guess('c')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 3'
			expect(page).to have_content 'C _ _ '
			guess('a')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 3'
			expect(page).to have_content 'C A _ '
			guess('t')
			expect(page).to have_current_path('/game_over')
			expect(page).to have_content 'Congratulations, You won!'
		end

	end
end