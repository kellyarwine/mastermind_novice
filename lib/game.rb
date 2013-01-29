require 'secret_code_generator'
require 'player_communicator'
require 'analyze_guess'
require 'game_settings'

class Game
	attr_accessor :secret_code, :total_turns, :turn_number, :guess, :player_communicator, :guess_history, :feedback_history, :feedback
	
	def initialize(communication_io)
		@turn_number = 1
		@total_turns = GameSettings.total_turns
		@player_communicator = communication_io
		@analyze_guess = AnalyzeGuess.new
	end

	def run_game
		@secret_code = SecretCodeGenerator.new.generate_secret_code
		while exit_game? == false
			@guess = @player_communicator.guess_io
			while @player_communicator.valid_guess?(@guess) == false
				@player_communicator.display_invalid_guess_message
				@guess = @player_communicator.guess_io
			end
			@player_communicator.store_guess(@guess)
			@feedback = @analyze_guess.get_feedback(@guess, @secret_code)
			@player_communicator.store_feedback(@feedback)
			@player_communicator.display_gameboard(@turn_number, @total_turns, @feedback)
			@turn_number += 1
		end
		@player_communicator.display_game_over_message(win_game?, @secret_code)
	end

	def exit_game?
		@turn_number > @total_turns || win_game?
	end

	def win_game?
		@feedback == ["+","+","+","+","+"]
	end
end