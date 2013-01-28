require 'pry'
require 'secret_code_generator'
require 'player_communicator'
require 'analyze_guess'
require 'game_settings'

#TODO:  fix secret_code_generator test

class Game
	
	def initialize
		@turn_number = 1
		@total_turns = GameSettings.total_turns
		@player_communicator = PlayerCommunicator.new
		@analyze_guess = AnalyzeGuess.new
	end

	def run_game
		@secret_code = SecretCodeGenerator.new.generate_secret_code
		for @turn_number in 1..@total_turns
			@guess = @player_communicator.guess_io
			@player_communicator.store_guess(@guess)
			@feedback = @analyze_guess.get_feedback(@guess, @secret_code)
			@player_communicator.store_feedback(@feedback)
			@player_communicator.display_gameboard(@turn_number, @total_turns, @feedback)
		end
	end

end