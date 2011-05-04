#!/usr/bin/ruby

require 'tarefa.rb'
require 'observer'


class Composto < Ingrediente
	
	include Observable

	attr_reader :subingredientes, :preco

	LIMITE_SUP=22
	LIMITE_INF=6

	def initialize(nome)
		super(nome)
		@subingredientes=[]
		@preco=0.0
		@multiplicador=1

		Thread.new do
			while true
				if LIMITE_INF > Time.now.hour or  Time.now.hour >  LIMITE_SUP
					@multiplicador=2
				else
					@multiplicador=1
				end
			end
			notify_observers(total)
		end
	end

	def total
		@preco * @multiplicador
	end

	def adicionar_subingrediente(subingrediente)
		@subingredientes << subingrediente
		@preco += subingrediente.preco
	end

	def remover_subingrediente(subingrediente)
		@subingredientes.delete(subingrediente)
		@preco -= subingrediente.preco
	end

end




class Drink < Composto
	def initialize
		super('Drink')
	end

end





