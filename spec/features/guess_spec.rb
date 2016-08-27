require 'spec_helper.rb'

feature 'Guessing characters of the word: ' do
	context "Input characters" do
		before do
			set_game
		end

		scenario 'user enters a valid character' do
			guess('c')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 8'
			expect(page).to have_content 'C _ _ _ _ _ _ _ '
		end

		scenario 'user enters an invalid character' do
			guess('p')
			expect(page).to have_current_path('/play')
			expect(page).to have_content 'Remaining attempts: 7'
			expect(page).to have_content '_ _ _ _ _ _ _ _ '
		end
	end
end