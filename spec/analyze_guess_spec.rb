require 'analyze_guess'

	describe AnalyzeGuess do
	
		describe '#get_feedback' do
			subject			{ AnalyzeGuess.new.get_feedback(guess, code)}	

			context 'with all match symbols and a 7-symbol guess' do
				let(:guess) { ["r","r","r","r","r","r","r"]}
				let(:code) 	{ ["r","r","r","r","r","r","r"]}	
				it 'should display 7 match symbols' do
		    	subject.should == ["+"]*guess.length
	    	end
			end

			context 'with a few match and no_match symbols' do
				let(:guess) { ["g","g","o","y","y"]}
				let(:code) 	{ ["g","g","o","r","r"]}	
				it 'should display 3 match and 2 no_match symbols' do
		    	subject.should == [" "]*2 + ["+"]*3
	    	end
			end

			context 'with all no_match symbols and a 10-symbol guess' do
				let(:guess) { ["r","r","r","r","r","r","r","r","r","r"]}
				let(:code) 	{ ["g","g","g","g","g","g","g","g","g","g"]}	
				it 'should display 10 no_match symbols' do
		    	subject.should == [" "]*guess.length	
	    	end
			end

			context 'with all near_match symbols' do
				let(:guess) { ["r","r","g","g","o","g"]}
				let(:code) 	{ ["g","g","r","r","g","o"]}	
				it 'should display 6 near_match symbols' do
		    	subject.should == ["-"]*guess.length
	    	end
			end

			context 'with a few near_match and no_match symbols' do
				let(:guess) { ["p","p","r","g","g"]}
				let(:code) 	{ ["g","g","o","r","r"]}	
				it 'should display 3 near_match and 2 no_match symbols' do
		    	subject.should == [" "]*2 + ["-"]*3
	    	end
			end

			context 'with a variety of near_match, no_match and match symbols' do
				let(:guess) { ["g","p","r","y","g"]}
				let(:code) 	{ ["g","g","o","r","r"]}	
				it 'should display 1 match, 2 near_match and 2 no_match symbols' do
		    	subject.should == [" "]*2 + ["+"] + ["-"]*2
	    	end
			end

			context 'with more duplicate symbols in guess than in code' do
				let(:guess) { ["g","g","g","y","g"]}
				let(:code) 	{ ["g","g","o","o","o"]}	
				it 'should display 2 match and 3 no_match symbols' do
		    	subject.should == [" "]*3 + ["+"]*2
	    	end
			end

			context 'with more duplicate symbols in guess than in code and variety of feedback symbols returned' do
				let(:guess) { ["b","g","g","g","g"]}
				let(:code) 	{ ["g","g","o","o","o"]}	
				it 'should display 1 match, 1 near_match and 3 no_match symbols' do
		    	subject.should == [" "]*3 + ["+"] + ["-"]
	    	end
			end

		end
	end