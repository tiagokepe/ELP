#!/usr/bin/ruby

require 'ingrediente.rb'
require "observer"
require 'observador'


class Composto < Ingrediente
	
	include Observable

	attr_reader :subingredientes, :volume, :preparador, :identificador

	LIMITE=70


	def initialize(prep = nil, ident = -1)
		@subingredientes=[]
		@volume=0.0
		@identificador=ident
		
		if prep
			@preparador=prep
			@preparador.montar.each {|ingrediente| self.adicionar_subingrediente(ingrediente) }
		end
	end

	def adicionar_subingrediente(subingrediente)
		@subingredientes << subingrediente
		@volume += subingrediente.volume
		changed
		notify_observers(@volume,@identificador)
	end

	def remover_subingrediente(subingrediente)
		@subingredientes.delete(subingrediente)
		@volume -= subingrediente.volume
		@volume=0 if @volume<0
		changed
		notify_observers(@volume,@identificador)
	end

	def consumiu
		random = rand(LIMITE) +1
		@volume-=random
		@volume=0 if @volume<0
		changed
		notify_observers(@volume,@identificador)
	end

end


