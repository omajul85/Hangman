def set_game(word = "colombia", clue = "Country in America")
	visit('/')
	fill_in :word, with: word
	fill_in :clue, with: clue
	click_button 'Submit'
end

def guess(char)
	visit('/play')
	fill_in :character, with: char
	click_button 'Guess'
end