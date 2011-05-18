class Tipo
end

class Suco < Bebida
	def fazer_bebida
		adicionar_subingrediente(gelo.new)
	end
end

class Drink < Bebida
end
