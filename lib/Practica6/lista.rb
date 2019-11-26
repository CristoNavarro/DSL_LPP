Nodo = Struct.new(:valor, :next, :prev)

class Lista
	include Enumerable
	attr_reader :head, :tail

	def initialize (head = nil)
		@head, @tail = head, head
	end

	def to_s
		cadena = String.new
		if (vacia)
			return "[]"
		else
			cadena << "["
			nodo = Nodo.new(@head.valor, @head.next, @head.prev)

			while nodo != tail
				cadena << "#{nodo.valor} "
				nodo = nodo.next
			end

			cadena << "#{nodo.valor}]"
		end

		return cadena
			
	end

	def vacia
		head == nil
	end

	def insert (datos)
		datos.each {|i|
			nodo = Nodo.new(i, nil, nil)
			if vacia
				@head = nodo
			else
				nodo.prev = @tail
				@tail.next = nodo
			end
			@tail = nodo
		}
	end

	def pop_front
		if !vacia
			@head = @head.next 
			@head.prev = nil
		end
	end

	def pop_back
		if !vacia
			@tail = @tail.prev
			@tail.next = nil
		end
	end

	def gases_anuales
		if vacia
			return 0
		else
			resultado = [0,0]
			aux = @head

			while aux != @tail
				resultado = aux.valor + resultado
				aux = aux.next
			end
			
			resultado = aux.valor + resultado

			return resultado[0]
		end
	end

	def gases_diarias
		return (gases_anuales / 365).round(3)
	end

	def terreno
		if vacia
			return 0
		else
			resultado = [0,0]
			aux = @head

			while aux != @tail
				resultado = aux.valor + resultado
				aux = aux.next
			end
			
			resultado = aux.valor + resultado

			return resultado[1]
		end
	end

	def each
		aux = @head

		while aux != nil
			yield aux.valor
			aux = aux.next
		end

	end

	def size
		i = 0
		aux = @head

		while aux != nil
			i += 1
			aux = aux.next
		end

		return i
	end

	def [] (index)
		if index >= size
			return nil
		else
			aux = @head
			i = index

			while i != 0
				aux = aux.next
				i -= 1
			end

			return aux
		end
	end
end
