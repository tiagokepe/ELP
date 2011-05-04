#!/usr/bin/ruby

require 'tarefa.rb'

class Composto < Ingrediente
	
	attr_reader :subingredientes

	def initialize(nome)
		super(nome)
		@subingredientes=[]
	end

	def preco(horario)
		total=0.0
		@subingredientes.each{|subingrediente| total += subingrediente.preco}
		total=( horario >  22 )? total*2 : total
	end

	def adicionar_subingrediente(subingrediente)
		@subingredientes << subingrediente
	end

	def remover_subingrediente(subingrediente)
		@subingredientes.delete(subingrediente)
	end

end




class Drink < Composto
	def initialize
		super('Drink')
	end

end





