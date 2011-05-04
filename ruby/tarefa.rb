#!/usr/bin/ruby

class Ingrediente
	def initialize(nome)
		@nome= nome
	end


	def preco
		0.0
	end
end



class Vodka < Ingrediente
	
	def initialize
		super('Vodka')
	end

	def preco
		2.0
	end
end

class Fruta < Ingrediente
	
	def initialize
		super('Fruta')
	end


	def preco
		3.0
	end
end

class Gelo < Ingrediente
	
	def initialize
		super('Gelo')
	end


	def preco
		0.5
	end
end
class GuardaChuva < Ingrediente
	
	def initialize
		super('Guarda Chuva')
	end

	def preco
		1.0
	end
end

class Azeitona < Ingrediente
	
	def initialize
		super('Azeitona')
	end

	def preco
		5.0
	end

end



