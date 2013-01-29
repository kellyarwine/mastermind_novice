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

		it 'should not allow invalid symbols in the guess' do
			subject.guess = ["b","b","b","b","X"]
			subject.valid_guess?(subject.guess).should == false
		end

		it 'should not allow a guess less than 5 symbols in length' do
			subject.guess = ["b","b","b","b"]
			subject.valid_guess?(subject.guess).should == false		
		end
		
		it 'should return winning message if game is won' do
			subject.display_game_over_message(true,["b","b","b","b","b"])
			subject.game_answer.should == GameSettings.win_message
		end
		
		it 'should return losing message if game is lost' do
			subject.display_game_over_message(false,["b","b","b","b","b"])
			subject.game_answer.should == GameSettings.lose_message
		end

		it 'should return Y if player chooses to play again' do
			subject.stub(:gets).and_return("Y\n")
			subject.display_play_again_message.should == true
		end

		it 'should return N if player chooses to play again' do
			subject.stub(:gets).and_return("N\n")
			subject.display_play_again_message.should == false
		end
	end
end