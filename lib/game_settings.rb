class GameSettings
	def self.match_symbol
		"+"
	end
	def self.near_match_symbol
		"-"
	end
	def self.no_match_symbol
		" "
	end
	def self.available_symbols
		["b","g","o","p","r","y"]
	end
	def self.total_turns
		15
	end
	def self.win_message
		"You're a genius!  You win!"
	end
	def self.lose_message
		"Fail! You lose."
	end
	def self.play_again_message
		"Want to try again? (Y/N)"
	end
	def self.invalid_guess_message
		"Oops! Your guess was invalid.\n"
	end	
end