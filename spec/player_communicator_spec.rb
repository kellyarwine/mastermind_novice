require 'player_communicator'
require 'game_settings'

describe PlayerCommunicator do
	
	describe '#construct_gameboard' do

  	it 'should display the header' do
			subject.total_turns = 12
			subject.turn_number = 1
			subject.guess_history = [["r","r","r","r","r"]]
			subject.feedback_history = [["+","+","+","+","+"]]
  		subject.construct_gameboard.should include("Mastermind")
  	end

  	it 'should display the footer' do
			subject.total_turns = 12
			subject.turn_number = 1
			subject.guess_history = [["r","r","r","r","r"]]
			subject.feedback_history = [["+","+","+","+","+"]]  		
  		subject.construct_gameboard.should include("|___________|___________|")
  	end

		it 'should display one turn of the turn history' do
			subject.total_turns = 12
			subject.turn_number = 1
			subject.guess_history = [["r","r","r","r","r"]]
			subject.feedback_history = [["+","+","+","+","+"]]
			subject.construct_gameboard.should  include("Turn #1   | r r r r r | + + + + + |")
		end

		it 'should display two turns of the turn history' do
			subject.total_turns = 12
			subject.turn_number = 2
			subject.guess_history = [["r","r","r","r","r"], ["g","g","g","g","g"]]
			subject.feedback_history = [["+","+","+","+","+"], ["-","-","-","-","-"]]
			subject.construct_gameboard.should include("Turn #2   | g g g g g | - - - - - |")
		end

		it 'should display twelve turns of the blank turn history' do
			subject.total_turns = 12
			subject.turn_number = 0
			subject.guess_history = []
			subject.feedback_history = []
			subject.construct_gameboard.should include("Turn #12  |           |           |")
		end

		#need to test validity of entry
	end
end