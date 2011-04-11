#!/usr/bin/ruby

require 'tarefa.rb'

class TarefaComposta < Tarefa
	
	attr_reader :subtarefas

	def initialize(nome)
		super(nome)
		@subtarefas=[]
	end

	def duracao
		total=0.0
		@subtarefas.each{|subtarefa| total += subtarefa.duracao}
		total
	end

	def adicionar_subtarefa(subtarefa)
		@subtarefas << subtarefa
	end

	def remover_subtarefa(subtarefa)
		@subtarefas.delete(subtarefa)
	end

end




class AdicionarIngredientes < TarefaComposta
	def initialize
		super('Adicionar Ingredientes')
		adicionar_subtarefa(AdicionarVodka.new)
		adicionar_subtarefa(AdicionarFruta.new)
		adicionar_subtarefa(AdicionarGelo.new)
	end

end




class EntregarDrink < TarefaComposta
	def initialize
		super('EntregarDrink')
		adicionar_subtarefa(FazerDrink.new)
		adicionar_subtarefa(Enfeitar.new)
	end
end


class FazerDrink < TarefaComposta

	def initialize
		super('FazerDrink')
		adicionar_subtarefa(AdicionarIngredientes.new)
		adicionar_subtarefa(Misturar.new)
	end
end

