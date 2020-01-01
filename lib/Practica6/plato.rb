class Plato
	attr_reader :nombre, :descripcion, :alimentos, :desc_alimentos, :gramos

	def initialize (nombre, &block)
		@nombre = nombre
		@alimentos = Lista.new
		@desc_alimentos = []
		@gramos = Lista.new

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end

	def nombre (nombre)
		@descripcion = nombre
	end

	def alimento (alimento, parametros = {})
		@alimentos.insert([alimento])
		@gramos.insert([parametros[:gramos]])
		
		descripcion = parametros[:descripcion]
		descripcion << "(#{parametros[:gramos]} gr)"

		@desc_alimentos << descripcion
	end

	def to_s
		output = @descripcion
		output << "\n#{'=' * @descripcion.size}\n\n"
		output << "Ingredientes: #{@desc_alimentos.join(', ')}\n"
		output
	end
end
