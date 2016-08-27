require 'spec_helper.rb'

feature 'Submitting the form with word and clue: ' do
	scenario 'user enters data to initialize the game' do
		set_game
		expect(page).to have_current_path('/play')
		expect(page).to have_content 'Clue: Country in America'
		expect(page).to have_content 'Remaining attempts: 8'
		expect(page).to have_content '_ _ _ _ _ _ _ _ '
	end
end