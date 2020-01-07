# Autor:: Cristo Daniel Navarro Rodriguez
#
# == Clase Alimento
#
# Con esta clase, queremos representar los alimentos de una dieta. Incluye el modulo Comparable para efectuar comparaciones.

class Alimentodsl
	include Comparable
	# Nombre del alimento
	attr_reader :nombre
	# Cantidad de proteinas en gramos
       	attr_reader :proteinas
	# Cantidad de carbohidratos en gramos
	attr_reader :carbohidratos
	# Cantidad de lipidos en gramos
	attr_reader :lipidos
	# Cantidad de CO2 emitido
	attr_reader :gases
	# Metros cuadrados de terreno usados al año
	attr_reader :terreno

	def initialize (a, valores)
                @nombre,@proteinas,@carbohidratos,@lipidos,@gases,@terreno = a,valores[0],valores[1],valores[2],valores[3],valores[4]
        end

	# Formatea el alimento

	def to_s
                "Nombre: #{@nombre}, Proteinas: #{@proteinas}, Carbohidratos: #{@carbohidratos}, Lipidos: #{@lipidos}, Gases: #{@gases}, Terreno: #{@terreno}"
        end	

	# Calcula las kcal aportadas por los carbohidratos
	     
	def kcal_glucidos
	        @carbohidratos * 4
        end

	# Calcula las kcal aportadas por los lipidos

	def kcal_lipidos
                @lipidos * 9
        end

	# Calcula las kcal aportadas por las proteinas

	def kcal_proteinas
		@proteinas * 4
	end

 	# Calcula las kcal totales aportadas por el alimento

	def kcal_total
                kcal_glucidos + kcal_lipidos + kcal_proteinas
        end

	# Permite sumar un alimento con un array [gases,terreno] para calcular el impacto de varios alimentos

	def +(array)
		[(@gases + array[0]).round(2),(@terreno + array[1]).round(2)]
	end	

	# Compara alimentos segun sus kcal totales aportadas
	
	def <=>(other)
		kcal_total <=> other.kcal_total
	end
end
