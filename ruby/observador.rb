require 'composto.rb'

class Observador

	def initialize(componentes)
		componentes.each {|componente| componente.add_observer(self) }
	end

	def update(volume,identificador)
		puts "O volume do copo  "+identificador.to_s+" agora está em: "+volume.to_s
	end

end


