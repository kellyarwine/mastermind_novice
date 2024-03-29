require 'game_settings'

class AnalyzeGuess
	def initialize
		@match = GameSettings.match_symbol
		@no_match = GameSettings.no_match_symbol
		@near_match = GameSettings.near_match_symbol
	end

	def get_feedback(guess,code)
		feedback = []
		temp_code = code.dup
		for current_symbol in 0..guess.length-1
			if guess[current_symbol] == temp_code[current_symbol]
				feedback << @match
				temp_code[current_symbol] = "X"
			elsif [guess[current_symbol]] - temp_code == []
				feedback << @near_match
				symbol_position = temp_code.index(guess[current_symbol])
				temp_code[symbol_position] = "X"
			else
				feedback << @no_match
			end
		end
		feedback.sort
	end
end