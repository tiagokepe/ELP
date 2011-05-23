#!/usr/bin/ruby

class Ingrediente
	attr_reader :alcool
	
	@alcool=false
	def volume
		raise "Ingrediente genérico"
	end
end


class Agua < Ingrediente
	def volume
		200
	end
end

class Vodka < Ingrediente
	
	def volume
		200
	end
end

class Fruta < Ingrediente
	def volume
		100
	end
end

class Gelo < Ingrediente

	def volume
		50
	end
end
class GuardaChuva < Ingrediente
	def volume
		0
	end
end

class Azeitona < Ingrediente
	def volume
		10
	end

end

class LeiteCondensado < Ingrediente
	def volume
		40
	end
end
