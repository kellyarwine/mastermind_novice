require 'game'
require 'mock_player_communicator'

describe Game do
	
	describe '#run_game' do
			let(:secret_code) { SecretCodeGenerator.new }
			let(:analyze_guess) { AnalyzeGuess.new }
			let(:player_communicator) { PlayerCommunicator.new }
			let(:subject) 						{ Game.new(player_communicator) }

  	it 'should generate a secret code' do
	  	secret_code.should_receive(:generate_secret_code)
	  	secret_code.generate_secret_code
  	end

  	it 'should receive a guess' do
  	  player_communicator.should_receive(:guess_io)
	    player_communicator.guess_io
  	end

  	xit 'should request a new guess when the guess entered is invalid' do
  	  subject.guess = ["b","b","b","b"]
  	  player_communicator.should_receive(:display_invalid_guess_message)  		
  	  player_communicator.valid_guess?(subject.guess)
  	end

  	it 'should store guesses' do
	    player_communicator.should_receive(:store_guess)  		
  		player_communicator.store_guess(["r","r","r","r","r"])
  	end

  	it 'should store feedback' do
			player_communicator.should_receive(:store_feedback)
	    player_communicator.store_feedback([" "," "," "," "," "])			
  	end

  	xit 'should increment turn_number after each turn' do
  	end

  	it 'should receive feedback' do
 	    analyze_guess.should_receive(:get_feedback) 		
 	    analyze_guess.get_feedback(["r","r","r","r","r"], ["y","y","y","y","y"])
  	end

  	it 'should display a gameboard' do
  		player_communicator.should_receive(:display_gameboard)
 			player_communicator.display_gameboard(1,12,[" "," "," "," "," "])
  	end

  	it 'should win_game when the secret code is guessed' do
  		subject.feedback = ["+","+","+","+","+"]
  		subject.win_game?.should == true
  	end

  	it 'should not win_game when user does not guess the secret code' do
  		subject.feedback = ["+","+","+","+","-"]
  		subject.win_game?.should == false
  	end

 		it 'should exit game when user guesses the secret code' do
  		subject.feedback = ["+","+","+","+","+"]
  		subject.exit_game?.should == true
  	end

 		it 'should not exit game when user does not guess the secret code' do
  		subject.feedback = ["+","+","+","+","-"]
  		subject.exit_game?.should == false
  	end

 		it 'should exit game when user wins the game' do
 			subject.feedback = ["+","+","+","+","+"]
 			subject.exit_game?.should == true
  	end

 		it 'should exit game when user runs out of turns' do
 			subject.turn_number = 13
 			subject.total_turns = 12
 			subject.exit_game?.should == true
  	end

 		it 'should not exit game when user still has turns' do
 			subject.turn_number = 11
 			subject.total_turns = 12
 			subject.exit_game?.should == false
  	end

  end

end