require 'game_settings'

class SecretCodeGenerator
	def generate_secret_code
		code = []
		5.times do
			code << GameSettings.available_symbols.sample
		end
		code
	end
end