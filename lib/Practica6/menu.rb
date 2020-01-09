
class Menu
	attr_reader :nombre, :platos, :desc_platos, :descripcion, :precio

	def initialize (nombre, &block)
                @nombre = nombre
		@platos = []
                @desc_platos = []

                if block_given?
                        if block.arity == 1
                                yield self
                        else
                                instance_eval(&block)
                        end
                end
        end

	def descripcion (cadena)
		@descripcion = cadena
	end

	def componente (plato ,parametros = {})
		desc = parametros[:descripcion]
 
		@platos << plato

		desc << " (#{parametros[:precio]} €)"
                @desc_platos << desc
	end

	def precio (num)
		@precio = num
	end

	def to_s
		output = @nombre
		output << " (#{@precio} €)\n"
		output << "\n#{'=' * output.size}\n\n"
		output << "Platos:\n"

		x = 0
		t_cal = 0
		t_gas = 0
		t_ter = 0

		@platos.each do |i|
			output << "#{desc_platos[x]} || Calorias = #{i.energia_total} kcal || Gases = #{i.gases_total} kgCO2 || Terreno = #{i.terreno_total} m2\n"
			x += 1
			t_cal += i.energia_total
			t_gas += i.gases_total
			t_ter += i.terreno_total
		end

		output << "Total: Calorias = #{t_cal.round(2)} kcal || Gases = #{t_gas.round(2)} kgCO2 || Terreno = #{t_ter.round(2)} m2"
		output
	end
end
