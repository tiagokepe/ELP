require 'composto.rb'

class Observador

	def initialize(comp)
		comp.add_observer(self)
	end

	def update(volume)
		puts "O volume mudou, agora esta em "+volume.to_s
	end

end


