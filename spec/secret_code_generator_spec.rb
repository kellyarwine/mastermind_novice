require 'secret_code_generator'

describe SecretCodeGenerator do
	subject { SecretCodeGenerator.new.generate_secret_code }

	describe '#generate_secret_code' do
		it 'should be a code 5 symbols in length' do
			subject.length.should == 5
		end

		it 'should only contain available symbols' do
			(subject - GameSettings.available_symbols).should == []
		end

		xit "should randomly generate the secret code" do
  	  subject.should_receive(:sample).exactly(5).times
	    subject
		end


	end
end