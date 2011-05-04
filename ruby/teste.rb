#!/usr/bin/ruby

require 'tarefa_composta.rb'


@drink = Drink.new

@drink.adicionar_subingrediente(Vodka.new)
@drink.adicionar_subingrediente(Gelo.new)
@drink.adicionar_subingrediente(Azeitona.new)

puts @drink.total
