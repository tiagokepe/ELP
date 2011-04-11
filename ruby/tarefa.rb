#!/usr/bin/ruby

class Tarefa
	def initialize(nome)
		@nome= nome
	end


	def duracao
		0.0
	end
end



class AdicionarVodka < Tarefa
	
	def initialize
		super('Adicionar Vodka')
	end

	def duracao
		2.0
	end
end

class AdicionarFruta < Tarefa
	
	def initialize
		super('Adicionar Fruta')
	end


	def duracao
		3.0
	end
end

class AdicionarGelo < Tarefa
	
	def initialize
		super('Adicionar Gelo')
	end


	def duracao
		0.5
	end
end
class Enfeitar < Tarefa
	
	def initialize
		super('Enfeitar')
	end

	def duracao
		1.0
	end
end

class Misturar < Tarefa
	
	def initialize
		super('Misturar')
	end

	def duracao
		5.0
	end

end



