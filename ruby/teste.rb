#!/usr/bin/ruby

require 'composto.rb'
require 'strategy.rb'
require 'observador.rb'




@bebidas=[]

for i in (1..5)

	preparacao = PreparadorDrink.new
	@bebidas<<Composto.new(preparacao,i)
end

observador= Observador.new(@bebidas)
while @bebidas.size > 0 do
    print "\e[H\e[2J"

	@bebidas.each {|bebida| 
		bebida.consumiu
	}
	@bebidas.delete_if {|bebida| bebida.volume == 0 }
	sleep 1
end
