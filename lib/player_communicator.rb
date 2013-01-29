require 'game_settings'

class PlayerCommunicator

	attr_accessor :guess_history, :feedback_history, :total_turns, :turn_number, :guess, :game_answer
	def initialize
		@feedback_history = []
		@guess_history = []
	end
	
	def guess_io
		puts "Please enter your guess:"
		@guess = gets.chomp.split(//)
	end

	def valid_guess?(guess)
		guess - GameSettings.available_symbols == [] && guess.length == 5
	end

	def display_invalid_guess_message
		puts GameSettings.invalid_guess_message
	end

	def store_guess(guess)
		@guess_history << guess
	end

	def store_feedback(feedback)
		@feedback_history << feedback
	end

	def display_game_over_message(win_game, code)
		@game_answer = win_game ? GameSettings.win_message : GameSettings.lose_message
		puts "\nThe secret code was:\n#{code.join}\n\n" + game_answer + "\n"
	end

	def display_play_again_message
		puts GameSettings.play_again_message
		gets.chomp == "Y" ? true : false
	end

	def display_gameboard(turn_number, total_turns, feedback)
		@total_turns = total_turns
		@turn_number = turn_number
		@feedback = feedback
		puts construct_gameboard
	end

	def construct_gameboard
		gameboard = ""
		gameboard << generate_gameboard_header
		gameboard << generate_gameboard_play_history
		gameboard << generate_gameboard_footer
	end

	def generate_gameboard_header
	"           _______________________
          |                       |
          |       Mastermind      |
          |_______________________|\n"
	end

	def generate_gameboard_play_history
		gameboard_line = ""
		for turn_number_history in 1..@total_turns
			if turn_number_history <= @turn_number
				gameboard_line << "Turn ##{"%-3d" % turn_number_history} | " + @guess_history[turn_number_history-1].join(" ") + " | " + @feedback_history[turn_number_history-1].join(" ") + " |\n"
			else
				gameboard_line << "Turn ##{"%-3d" % turn_number_history} |           |           |\n"				
			end	
		end
		gameboard_line
	end

	def generate_gameboard_footer
	"          |___________|___________|
          Enter a guess containing the
          following symbols: " + GameSettings.available_symbols.join + ".\n\n"
	end
end