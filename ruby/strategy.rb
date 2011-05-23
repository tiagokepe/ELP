require 'ingrediente.rb'

class Preparador
end

class PreparadorSuco

	def montar
		ingredientes=[]
		ingredientes << Agua.new
		ingredientes << Fruta.new
		ingredientes
	end
end

class PreparadorDrink
	
	def montar
		ingredientes=[]
		ingredientes<<Vodka.new
		ingredientes<<Fruta.new
		ingredientes<<Gelo.new
		ingredientes<<Azeitona.new
		ingredientes<<GuardaChuva.new
		ingredientes
	end
end

class PreparadorBatida
	def montar
		ingredientes=[]
		ingredientes<<Vodka.new
		ingredientes<<Fruta.new
		ingredientes<<Gelo.new
		ingredientes<<LeiteCondensado.new
		ingredientes
	end
end
