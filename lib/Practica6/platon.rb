class PlatoN
	include Comparable
	attr_reader :alimentos, :gramos

	def initialize (lista)
		@alimentos = Lista.new
		@gramos = Lista.new

		lista.each do |x|
			if (@alimentos.vacia || !@alimentos.find { |i| i == x })
				@alimentos.insert([x])
				@gramos.insert([(x.proteinas + x.lipidos + x.carbohidratos).round(2)])
			else
				y = @alimentos.find_index(x)
				@gramos[y].valor += x.proteinas + x.lipidos + x.carbohidratos 
				@gramos[y].valor = @gramos[y].valor.round(2)
			end
		end
	end

	def gramos_total
		suma = 0
		
		@gramos.each do |i|
			suma += i
		end

		return suma.round(2)
	end

	def prot
		suma = 0
		x = 0
		cantidad = 0

		@alimentos.each do |i|
			cantidad = @gramos[x].valor / (i.proteinas + i.lipidos + i.carbohidratos)
			suma += i.proteinas * cantidad
			x += 1
		end	

		return ((suma * 100) / gramos_total).round(2)
	end

	def car
		suma = 0
		x = 0
		cantidad = 0

		@alimentos.each do |i|
			cantidad = @gramos[x].valor / (i.proteinas + i.lipidos + i.carbohidratos)
			suma += i.carbohidratos * cantidad
			x += 1
		end	

		return ((suma * 100) / gramos_total).round(2)
	end

	def lip
		suma = 0
		x = 0
		cantidad = 0

		@alimentos.each do |i|
			cantidad = @gramos[x].valor / (i.proteinas + i.lipidos + i.carbohidratos)
			suma += i.lipidos * cantidad
			x += 1
		end	

		return ((suma * 100) / gramos_total).round(2)
	end

	def vct
		suma = 0
		
		suma += prot * gramos_total * 4 / 100
		suma += car * gramos_total * 4 / 100
		suma += lip * gramos_total * 9 / 100
		
		return suma.round(2)
	end	

	def to_s

		if (@alimentos.vacia)
			return "[]"
		else
			cadena = String.new

			cadena << "["
			x = 0

			@alimentos.each do |i|
				cadena << "#{i.nombre} -> "
				cadena << "#{@gramos[x].valor}g, "
			       	x += 1
			end

			cadena << "Proteinas -> #{prot}%, "
			cadena << "Carbohidratos -> #{car}%, "
			cadena << "Lipidos -> #{lip}%, "
			cadena << "VCT -> #{vct} kcal]"
		end

		return cadena
	end	
			
	def <=> (other)
		vct <=> other.vct
	end

	def espanola
		return ((prot >= 14.0 || prot <= 26.0) && (car >= 34.0 || car <= 46.0) && (lip >= 34.0 || lip <= 46.0))
	end

	def vasca
		return ((prot >= 9.0 || prot <= 21.0) && (car >= 54.0 || car <= 66.0) && (lip >= 19.0 || lip <= 31.0))
	end

	def vegetaria
		cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		cordero = Alimento.new("Cordero",18.0,0.0,3.1,50.0,164.0)
		vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		camarones = Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		pollo = Alimento.new("Pollo",20.6,0.0,5.6,5.7,7.1)

		[cerdo,cordero,vaca,camarones,pollo].each do |i|
			if (@alimentos.find { |x| x == i }) != nil
				return false
			end
		end

		return ((prot >= 14.0 || prot <= 26.0) && (car >= 34.0 || car <= 46.0) && (lip >= 34.0 || lip <= 46.0))
	end
end
