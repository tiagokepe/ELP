#!/usr/bin/ruby

require 'composto.rb'
require 'strategy.rb'
require 'observador.rb'




preparacao = PreparadorDrink.new


bebida = Composto.new(preparacao)

observador= Observador.new(bebida)

puts "Sua bebida tem inicialmente: "+bebida.volume.to_s



while bebida.volume > 0 do
	bebida.consumiu
end
