RSpec.describe Alimento do

	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
        end

	context "Probando a instanciar un alimento, acceso a variables y to_s: " do
                it "Se puede instanciar un alimento." do
                        a = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		end

		it "Los getter funcionan." do
                        expect(@chocolate.nombre).to eq("Chocolate")
                        expect(@chocolate.proteinas).to eq(5.3)
                        expect(@chocolate.carbohidratos).to eq(47.0)
                        expect(@chocolate.lipidos).to eq(30.0)
                        expect(@chocolate.gases).to eq(2.3)
                        expect(@chocolate.terreno).to eq(3.4)
                        expect(@nuez.nombre).to eq("Nuez")
                        expect(@nuez.proteinas).to eq(20.0)
                        expect(@nuez.carbohidratos).to eq(21.0)
                        expect(@nuez.lipidos).to eq(54.0)
	                expect(@nuez.gases).to eq(0.3)
	                expect(@nuez.terreno).to eq(7.9)
                end

		it "Funciona el to_s." do
                        expect(@chocolate.to_s).to eq("Nombre: Chocolate, Proteinas: 5.3, Carbohidratos: 47.0, Lipidos: 30.0, Gases: 2.3, Terreno: 3.4")
                        expect(@nuez.to_s).to eq("Nombre: Nuez, Proteinas: 20.0, Carbohidratos: 21.0, Lipidos: 54.0, Gases: 0.3, Terreno: 7.9")
                end
        end

	context "Probando las funciones para calcular el valor energetico: " do
		it "Se calculan las kcal de los glucidos." do
                        expect(@chocolate.kcal_glucidos).to eq(188.0)
                        expect(@nuez.kcal_glucidos).to eq(84.0)
		end

		it "Se calculan las kcal de los lipidos." do
                        expect(@chocolate.kcal_lipidos).to eq(270.0)
                        expect(@nuez.kcal_lipidos).to eq(486.0)
                end

		it "Se calculan las kcal de las proteinas." do
                        expect(@chocolate.kcal_proteinas).to eq(21.2)
                        expect(@nuez.kcal_proteinas).to eq(80.0)
                end

		it "Se calculan las kcal totales del alimento." do
                        expect(@chocolate.kcal_total).to eq(479.2)
                        expect(@nuez.kcal_total).to eq(650.0)
                end
	end

	context "Probando la suma y la multiplicacion por un entero para el calculo del impacto: " do
		it "Se suma los gases y el terreno de un alimento con un array [gases,terreno]." do
			expect(@chocolate + [0.3,7.9] ).to eq([2.6,11.3])
		end
	end

	context "Comprobando que Alimento es comparable: " do
		it "Funcionan los operadores de comparacion." do
			expect(@chocolate == @nuez).to eq(false)
			expect(@chocolate == @chocolate).to eq(true)
			expect(@chocolate < @nuez).to eq(true)
			expect(@chocolate > @nuez).to eq(false)
			expect(@chocolate >= @nuez).to eq(false)
			expect(@chocolate <= @nuez).to eq(true)
			expect(@chocolate >= @nuez).to eq(false)
			expect(@chocolate.between?(@tofu, @nuez)).to eq(true)
			expect(@tofu.clamp(@chocolate, @nuez)).to eq(@chocolate)
		end
	end
end

RSpec.describe Dieta do

	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@hombre = Dieta.new([@chocolate, @chocolate, @chocolate, @chocolate, @chocolate, @nuez, @tofu])
		@mujer = Dieta.new([@chocolate, @chocolate, @chocolate, @chocolate, @nuez])
        end

	context "Probando a instanciar una dieta y las funciones para calcular el impacto de los alimentos: " do
		it "Se instancia una dieta." do
			dieta = Dieta.new([@chocolate, @nuez, @nuez, @leche, @cafe])
		end

		it "Se calcula el impacto de la dieta de un hombre." do
			expect(@hombre.impacto).to eq([13.8,27.1])
			expect(@hombre.energia).to eq(3128.8)
		end

		it "Se calcula el impacto de la dieta de una mujer." do
			expect(@mujer.impacto).to eq([9.5,21.5])
			expect(@mujer.energia).to eq(2566.8)
                end
		
		it "Se calculan las proteinas de una dieta." do
			expect(@hombre.prot).to eq(54.5)
			expect(@mujer.prot).to eq(41.2)
                end
	end
end

RSpec.describe Lista do

	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@huevo = Alimento.new("Huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
		@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		@queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
		@cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@leche = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@enum = Lista.new
		@espanola = Lista.new
		@vasca = Lista.new
		@vegetaria = Lista.new
		@vegetaliana = Lista.new
		@locuracarne = Lista.new
		@enum.insert([@chocolate,@nuez,@tofu])
		@espanola.insert([@chocolate,@chocolate,@chocolate,@chocolate,@tofu,@nuez,@huevo,@huevo,@huevo])
		@vasca.insert([@chocolate,@chocolate,@chocolate,@chocolate,@chocolate,@tofu,@lentejas])
		@vegetaria.insert([@chocolate,@chocolate,@chocolate,@chocolate,@queso,@leche,@leche,@leche,@leche,@leche,@leche,@huevo])
		@vegetaliana.insert([@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas])
		@locuracarne.insert([@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@chocolate,@chocolate,@chocolate,@chocolate,@chocolate])
	end

	before (:each) do
		@nodo1 = Nodo.new(2,nil,nil)
		@lista1 = Lista.new(@nodo1)
		@lista2 = Lista.new(nil)
		@lista3 = Lista.new(nil)
		@lista3.insert([2,3,4,1,3,6,1,6,1])
	end

	context "Probando que se puede instanciar una lista, acceso a variables y to_s: " do
		it "Se instancia una lista." do
			expect(@lista1.instance_of? Lista).to eq(true)
		end

		it "Se puede acceder a las variables de la lista." do
			expect(@lista1.head).to eq(@nodo1)
			expect(@lista1.tail).to eq(@nodo1)
		end

		it "Funciona el to_s." do
			expect(@lista1.to_s).to eq("[2]")
			expect(@lista2.to_s).to eq("[]")
		end
	end

	context "Probando el funcionamiento de los nodos de la lista: " do
		it "Existe un nodo con sus datos, su siguiente y su previo." do
			@nodo = Nodo.new(1,nil,nil)
			expect(@nodo.valor).to eq(1)
			expect(@nodo.next).to eq(nil)
			expect(@nodo.prev).to eq(nil)
		end
	end

	context "Probando el funcionamiento de la lista: " do
		it "Se comprueba si la lista esta vacia." do
			expect(@lista2.vacia).to eq(true)
			expect(@lista1.vacia).to eq(false)
		end
		
		it "Se puede insertar un elemento." do
			@lista1.insert([4])
			expect(@lista1.to_s).to eq("[2 4]")
			@lista2.insert([5])
			expect(@lista2.to_s).to eq("[5]")
		end

		it "Se pueden insertar varios elementos." do
			@lista1.insert([1,5,6,3])
			expect(@lista1.to_s).to eq("[2 1 5 6 3]")
			@lista2.insert([2,3,4])
			expect(@lista2.to_s).to eq("[2 3 4]")
		end

		it "Se extrae el primer elemento." do
			@lista3.pop_front
			expect(@lista3.to_s).to eq("[3 4 1 3 6 1 6 1]")
			@lista3.pop_front
			expect(@lista3.to_s).to eq("[4 1 3 6 1 6 1]")
		end

		it "Se extrae el ultimo elemento." do
			@lista3.pop_back
			expect(@lista3.to_s).to eq("[2 3 4 1 3 6 1 6]")
			@lista3.pop_back
			expect(@lista3.to_s).to eq("[2 3 4 1 3 6 1]")
			@lista2.pop_back
			expect(@lista2.to_s).to eq("[]")
		end
	end

	context "Se comprueba que se calculan los diferentes impactos de las diestas: " do
		it "Se calculan las emisiones anuales de gases." do
			expect(@espanola.gases_anuales).to eq(24.1)
			expect(@vasca.gases_anuales).to eq(13.9)
			expect(@vegetaria.gases_anuales).to eq(43.6)
			expect(@vegetaliana.gases_anuales).to eq(4)
			expect(@locuracarne.gases_anuales).to eq(87.5)
		end

		it "Se calculan las emisiones diarias de gases." do
			expect(@espanola.gases_diarias).to eq(0.066)
			expect(@vasca.gases_diarias).to eq(0.038)
			expect(@vegetaria.gases_diarias).to eq(0.119)
			expect(@vegetaliana.gases_diarias).to eq(0.011)
			expect(@locuracarne.gases_diarias).to eq(0.240)
		end

		it "Se calculan los metros cuadrados de uso de terreno." do
			expect(@espanola.terreno).to eq(40.8)
			expect(@vasca.terreno).to eq(22.6)
			expect(@vegetaria.terreno).to eq(113.7)
			expect(@vegetaliana.terreno).to eq(34.0)
			expect(@locuracarne.terreno).to eq(127.0)
		end
	end

	context "Se comprueba que la lista es enumerable: " do
		it "Funcionan los operadores de enumerable." do
			expect(@enum.collect { |i| i.kcal_total }).to eq([479.2,650.0,82.8])
			expect(@enum.select { |i| i.kcal_total == 82.8 }).to eq([@tofu])
			expect(@enum.max).to eq(@nuez)
			expect(@enum.min).to eq(@tofu)
			expect(@enum.sort).to eq([@tofu,@chocolate,@nuez])
			expect(@enum.find { |i| i == @tofu }).to eq(@tofu)
			expect(@enum.find { |i| i == @huevo }).to eq(nil)
		end
	end
			
end

RSpec.describe PlatoN do
	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		@huevo = Alimento.new("Huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@queso = Alimento.new("Queso",25.0,1.3,33.0,11.0,41.0)
		@cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@leche = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		@camarones = Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@pollo = Alimento.new("Pollo",20.6,0.0,5.6,5.7,7.1)
		@vasca = Lista.new
		@vasca.insert([@chocolate,@chocolate,@chocolate,@tofu,@chocolate,@lentejas,@chocolate])
		@vasca1 = Lista.new
		@vasca1.insert([@chocolate,@tofu,@lentejas])
		@gramos1 = Lista.new
		@gramos1.insert([411.5,14.7,76.9])
		@espanola = Lista.new
		@espanola.insert([@chocolate,@chocolate,@chocolate,@chocolate,@tofu,@nuez,@huevo,@huevo,@huevo])
		@espanola1 = Lista.new
		@espanola1.insert([@chocolate,@tofu,@nuez,@huevo])
		@gramos2 = Lista.new
		@gramos2.insert([329.2,14.7,95,75.3])
		@pruebas1 = PlatoN.new(@vasca)
		@pruebas2 = PlatoN.new(@espanola)
		@espanola3 = Lista.new
		@espanola3.insert([@chocolate,@chocolate,@chocolate,@chocolate,@tofu,@nuez,@huevo,@huevo,@huevo])
		@espanolaa = PlatoA.new(@espanola3)
		@espanola4 = Lista.new
		@espanola4.insert([@chocolate,@chocolate,@chocolate,@chocolate,@queso,@leche,@leche,@leche,@leche,@leche,@leche,@huevo])
		@espanolab = PlatoA.new(@espanola4)
		@espanola5 = Lista.new
		@espanola5.insert([@chocolate,@chocolate,@chocolate,@chocolate,@chocolate,@queso,@huevo])
		@espanolac = PlatoA.new(@espanola5)
		@vasca3 = Lista.new
		@vasca3.insert([@chocolate,@chocolate,@chocolate,@tofu,@chocolate,@lentejas,@chocolate])
		@vascaa = PlatoA.new(@vasca3)
		@vasca4 = Lista.new
		@vasca4.insert([@chocolate,@chocolate,@chocolate,@camarones,@chocolate,@lentejas,@chocolate])
		@vascab = PlatoA.new(@vasca4)
		@vasca5 = Lista.new
		@vasca5.insert([@chocolate,@chocolate,@chocolate,@vaca,@chocolate,@lentejas,@chocolate])
		@vascac = PlatoA.new(@vasca5)
		@vegetaria3 = Lista.new
		@vegetaria3.insert([@chocolate,@chocolate,@chocolate,@chocolate,@queso,@leche,@leche,@leche,@leche,@leche,@leche,@huevo])
		@vegetariaa = PlatoA.new(@vegetaria3)
		@vegetaria4 = Lista.new
		@vegetaria4.insert([@chocolate,@leche,@leche,@leche,@leche,@leche,@leche,@huevo,@nuez,@nuez,@queso,@lentejas,@lentejas])
		@vegetariab = PlatoA.new(@vegetaria4)
		@vegetaliana3 = Lista.new
		@vegetaliana3.insert([@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas])
		@vegetalianaa = PlatoA.new(@vegetaliana3)
		@vegetaliana4 = Lista.new
		@vegetaliana4.insert([@nuez,@nuez,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas,@lentejas])
		@vegetalianab = PlatoA.new(@vegetaliana4)
		@carne3 = Lista.new
		@carne3.insert([@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@cerdo,@chocolate,@chocolate,@chocolate])
		@carnea = PlatoA.new(@carne3)
		@carne4 = Lista.new
		@carne4.insert([@vaca,@vaca,@vaca,@vaca,@vaca,@vaca,@vaca,@vaca,@vaca,@vaca,@chocolate,@chocolate,@chocolate])
		@carnec = PlatoA.new(@carne4)
		@carne5 = Lista.new
		@carne5.insert([@pollo,@pollo,@pollo,@pollo,@pollo,@pollo,@pollo,@pollo,@pollo,@pollo,@chocolate,@chocolate,@chocolate])
		@carneb = PlatoA.new(@carne5)
		@lista1 = Lista.new
		@lista1.insert([@espanolaa,@vascab,@vegetariab,@carnec])
	end

	context "Comprobando que se puede instanciar un PlatoN y se puede acceder a sus atributos: " do
		it "Se puede instanciar un PlatoN." do
			expect(@pruebas1.instance_of? PlatoN).to eq(true)
			expect(@pruebas2.instance_of? PlatoN).to eq(true)
		end

		it "Se puede acceder a los atributos." do
			expect(@pruebas1.alimentos.valores).to eq(@vasca1.valores)
			expect(@pruebas1.gramos.valores).to eq(@gramos1.valores)
			expect(@pruebas2.alimentos.valores).to eq(@espanola1.valores)
			expect(@pruebas2.gramos.valores).to eq(@gramos2.valores)
		end
	end

	context "Comprobando que se calculan los porcentajes y el VCT: " do
		it "Se calculan los gramos totales del plato." do
			expect(@pruebas1.gramos_total).to eq(503.1)
			expect(@pruebas2.gramos_total).to eq(514.2)
		end

		it "Se calcula el porcentaje de proteinas." do
			expect(@pruebas1.prot).to eq(11.53)
			expect(@pruebas2.prot).to eq(17.15)
		end

		it "Se calcula el porcentaje de carbohidratos." do
			expect(@pruebas1.car).to eq(57.42)
			expect(@pruebas2.car).to eq(41.66)
		end

		it "Se calcula el porcentaje de lipidos." do
			expect(@pruebas1.lip).to eq(31.05)
			expect(@pruebas2.lip).to eq(41.19)
		end

		it "Se calcula el VCT." do
			expect(@pruebas1.vct).to eq(2793.46)
			expect(@pruebas2.vct).to eq(3115.79)
		end

		it "Se obtiene el plato formateado." do
			expect(@pruebas1.to_s).to eq("[Chocolate -> 411.5g, Tofu -> 14.7g, Lentejas -> 76.9g, Proteinas -> 11.53%, Carbohidratos -> 57.42%, Lipidos -> 31.05%, VCT -> 2793.46 kcal]")
			expect(@pruebas2.to_s).to eq("[Chocolate -> 329.2g, Tofu -> 14.7g, Nuez -> 95.0g, Huevo -> 75.3g, Proteinas -> 17.15%, Carbohidratos -> 41.66%, Lipidos -> 41.19%, VCT -> 3115.79 kcal]")
		end
	end

	context "Comparacion del valor nutricional entre platos de una dieta: " do
		it "Se comparan platos de la dieta espanola." do
			expect(@espanolaa.espanola).to eq(true)
			expect(@espanolab.espanola).to eq(true)
			expect(@espanolac.espanola).to eq(true)
			expect(@espanolaa == @espanolab).to eq(false)
			expect(@espanolaa == @espanolaa).to eq(true)
			expect(@espanolac < @espanolaa).to eq(true)
			expect(@espanolab > @espanolaa).to eq(false)
			expect(@espanolab >= @espanolac).to eq(false)
			expect(@espanolac <= @espanolaa).to eq(true)
			expect(@espanolac >= @espanolaa).to eq(false)
			expect(@espanolac.between?(@espanolab, @espanolaa)).to eq(true)
			expect(@espanolaa.clamp(@espanolab, @espanolac)).to eq(@espanolac)
		end

		it "Se comparan platos de la dieta vasca." do
			expect(@vascaa.vasca).to eq(true)
			expect(@vascab.vasca).to eq(true)
			expect(@vascac.vasca).to eq(true)
			expect(@vascaa == @vascab).to eq(false)
			expect(@vascaa == @vascaa).to eq(true)
			expect(@vascab < @vascaa).to eq(true)
			expect(@vascab > @vascac).to eq(false)
			expect(@vascab >= @vascac).to eq(false)
			expect(@vascaa <= @vascac).to eq(true)
			expect(@vascaa >= @vascac).to eq(false)
			expect(@vascaa.between?(@vascab, @vascac)).to eq(true)
			expect(@vascac.clamp(@vascab, @vascaa)).to eq(@vascaa)
		end

		it "Se comparan platos de la dieta vegetaria." do
			expect(@vegetariaa.vegetaria).to eq(true)
			expect(@vegetariab.vegetaria).to eq(true)
			expect(@vegetariaa == @vegetariab).to eq(false)
			expect(@vegetariaa == @vegetariaa).to eq(true)
			expect(@vegetariaa < @vegetariab).to eq(true)
			expect(@vegetariaa > @vegetariaa).to eq(false)
			expect(@vegetariaa >= @vegetariab).to eq(false)
			expect(@vegetariaa <= @vegetariab).to eq(true)
			expect(@vegetariaa.between?(@vegetariaa, @vegetariab)).to eq(true)
			expect(@vegetariaa.clamp(@vegetariaa, @vegetariab)).to eq(@vegetariaa)
		end

		it "Se comparan platos de la dieta vegetaliana." do
			expect(@vegetalianaa == @vegetalianab).to eq(false)
			expect(@vegetalianaa == @vegetalianaa).to eq(true)
			expect(@vegetalianaa < @vegetalianab).to eq(true)
			expect(@vegetalianaa > @vegetalianab).to eq(false)
			expect(@vegetalianaa >= @vegetalianab).to eq(false)
			expect(@vegetalianaa <= @vegetalianab).to eq(true)
			expect(@vegetalianaa.between?(@vegetalianaa, @vegetalianab)).to eq(true)
			expect(@vegetalianaa.clamp(@vegetalianaa, @vegetalianab)).to eq(@vegetalianaa)
		end

		it "Se comparan platos de la dieta locura por la carne." do
			expect(@carnea == @carneb).to eq(false)
			expect(@carnea == @carnea).to eq(true)
			expect(@carnec < @carneb).to eq(true)
			expect(@carneb > @carnea).to eq(false)
			expect(@carnec >= @carneb).to eq(false)
			expect(@carneb <= @carnea).to eq(true)
			expect(@carneb.between?(@carnec, @carnea)).to eq(true)
			expect(@carnec.clamp(@carneb, @carnea)).to eq(@carneb)
		end
	end

	context "Pruebas para listas de platos: " do
		it "Funcionan las pruebas para enumerar lsitas de platos." do
			expect(@lista1.collect { |i| i.vct }).to eq([3115.79,2792.52,3333.55,2560.61])
			expect(@lista1.select { |i| i.vct == 2792.52 }).to eq([@vascab])
			expect(@lista1.max).to eq(@vegetariab)
			expect(@lista1.min).to eq(@carnec)
			expect(@lista1.sort).to eq([@carnec,@vascab,@espanolaa,@vegetariab])
		end
	end
end

RSpec.describe PlatoA do
	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		@huevo = Alimento.new("Huevo", 13.0, 1.1, 11.0, 4.2, 5.7)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@vasca = Lista.new
		@vasca.insert([@chocolate,@chocolate,@chocolate,@tofu,@chocolate,@lentejas,@chocolate])
		@gases1 = Lista.new
		@gases1.insert([11.5,2.0,0.4])
		@terreno1 = Lista.new
		@terreno1.insert([17.0,2.2,3.4])
		@espanola = Lista.new
		@espanola.insert([@chocolate,@chocolate,@chocolate,@chocolate,@tofu,@nuez,@huevo,@huevo,@huevo])
		@gases2 = Lista.new
		@gases2.insert([9.2,2.0,0.3,12.6])
		@terreno2 = Lista.new
		@terreno2.insert([13.6,2.2,7.9,17.1])
		@pruebas1 = PlatoA.new(@vasca)
		@pruebas2 = PlatoA.new(@espanola)
	end

	context "Comprobando que se puede instanciar y acceder a los atributos: " do
		it "Se puede instanciar." do
			expect(@pruebas1.instance_of? PlatoA).to eq(true)
			expect(@pruebas2.instance_of? PlatoA).to eq(true)
		end

		it "Comprobaciones sobre los tipos y la jerarquia." do
			expect(@pruebas1.instance_of? PlatoN).to eq(false)
			expect(@pruebas2.instance_of? PlatoN).to eq(false)
			expect(@pruebas1.is_a? PlatoA).to eq(true)
			expect(@pruebas2.is_a? PlatoA).to eq(true)
			expect(@pruebas1.is_a? PlatoN).to eq(true)
			expect(@pruebas2.is_a? PlatoN).to eq(true)
			expect(@pruebas1.respond_to? ('vct')).to eq(true)
			expect(@pruebas2.respond_to? ('vct')).to eq(true)
			expect(@pruebas1.respond_to? ('valor')).to eq(false)
			expect(@pruebas2.respond_to? ('valor')).to eq(false)
			expect(PlatoA.superclass).to eq(PlatoN)
		end

		it "Se puede acceder a los atributos." do
			expect(@pruebas1.gases.valores).to eq(@gases1.valores)
			expect(@pruebas1.terreno.valores).to eq(@terreno1.valores)
			expect(@pruebas2.gases.valores).to eq(@gases2.valores)
			expect(@pruebas2.terreno.valores).to eq(@terreno2.valores)
		end
	end

	context "Comprobando las funcionalidades de la clase: " do
		it "Se calcula el valor total de las emisiones de gases. " do
			expect(@pruebas1.gases_total).to eq(13.9)
			expect(@pruebas2.gases_total).to eq(24.1)
		end

		it "Se estiman los metros cuadrados de uso de terreno. " do
			expect(@pruebas1.terreno_total).to eq(22.6)
			expect(@pruebas2.terreno_total).to eq(40.8)
		end

		it "Se obtiene la eficiencia energetica formateada." do
			expect(@pruebas1.to_s).to eq("[Gases -> 13.9, Terreno -> 22.6]")
			expect(@pruebas2.to_s).to eq("[Gases -> 24.1, Terreno -> 40.8]")
		end
	end
end
