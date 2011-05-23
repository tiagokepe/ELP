#!/usr/bin/ruby

require 'ingrediente.rb'
require "observer"
require 'observador'


class Composto < Ingrediente
	
	include Observable

	attr_reader :subingredientes, :volume, :preparador

	LIMITE=70


	def initialize(prep = nil)
		@subingredientes=[]
		@volume=0.0
		
		if prep
			@preparador=prep
			@preparador.montar.each {|ingrediente| self.adicionar_subingrediente(ingrediente) }
		end
	end

	def adicionar_subingrediente(subingrediente)
		@subingredientes << subingrediente
		@volume += subingrediente.volume
		changed
		notify_observers(@volume)
	end

	def remover_subingrediente(subingrediente)
		@subingredientes.delete(subingrediente)
		@volume -= subingrediente.volume
		@volume=0 if @volume<0
		changed
		notify_observers(@volume)
	end

	def consumiu
		@volume-=rand(LIMITE)+1
		@volume=0 if @volume<0
		changed
		notify_observers(@volume)
	end

end


