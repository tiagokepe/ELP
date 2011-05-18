#!/usr/bin/ruby

require 'tarefa.rb'
require 'observer'


class Composto < Ingrediente
	
	include Observable

	attr_reader :subingredientes, :volume

	LIMITE 70

	def initialize()
		@subingredientes=[]
		@volume=0.0
	end

	def adicionar_subingrediente(subingrediente)
		@subingredientes << subingrediente
		@volume += subingrediente.volume
		changed
		notify_observers(volume)
	end

	def remover_subingrediente(subingrediente)
		@subingredientes.delete(subingrediente)
		@volume -= subingrediente.volume
		@volume=0 if @volume<0
		changed
		notify_observers(volume)
	end

	def consumiu
		@volume-=rand(LIMITE)+1
		@volume=0 if @volume<0
		changed
		notify_observers(volume)
	end

end


class Bebida < Composto
	@tipo_bebida=Suco.new
	def initialize(tipo_bebida = nil)
		@tipo_bebida ||= tipo_bebida
		@subingredientes+=@tipo_bebida.montar
		@volume+=@tipo_bebida.volume
	end

	def fazer_bebida
		@tipo_bebida.fazer_bebida()
	end
end
