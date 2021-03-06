class Plato
	attr_reader :nombre, :descripcion, :alimentos, :desc_alimentos

	def initialize (nombre, &block)
		@nombre = nombre
		@alimentos = Lista.new
		@desc_alimentos = []
		
		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end

	def nombre (nom)
		@descripcion = nom
	end

	def alimento (parametros = {})
		descripcion = parametros[:descripcion]

		al = Alimentodsl.new(descripcion, parametros[:gramos], parametros[:valores])
		@alimentos.insert([al])

		descripcion << "(#{parametros[:gramos]} gr)"

		@desc_alimentos << descripcion
	end

	def energia_total
		suma = 0

		@alimentos.each { |i| suma += i.kcal_total }

		suma.round(2)
	end

	def gases_total
		suma = 0

		@alimentos.each { |i| suma += i.gases }

		suma.round(2)
	end

	def terreno_total
		suma = 0

		@alimentos.each { |i| suma += i.terreno }

		suma.round(2)
	end

	def to_s
		output = @descripcion
		output << "\n#{'=' * @descripcion.size}\n\n"
		output << "Ingredientes: #{@desc_alimentos.join(', ')}\n"
		output << "Valores nutricionales-ambientales: \n"
		output << "Energia = #{energia_total} kcal\n"
		output << "Gases = #{gases_total} kgCO2\n"
		output << "Terreno = #{terreno_total} m2"
		output
	end
end
