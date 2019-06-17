import wollok.game.*
import hector.*

class Maiz{
	var property position
	var property valor = 150
	var esBebe =  true
	
	method image() = if(esBebe) "corn_baby.png" else "corn_adult.png"
	
	method efectoRegada(){
		game.removeVisual(self)
		esBebe = false
		game.addVisual(self)
	}
	method estaListoParaCosechar() = not esBebe
}

class Trigo {
	var property position
	var gradoEvolucion = 0 
	var property valor = (gradoEvolucion - 1) * 100
	var images = ["wheat_0.png", "wheat_1.png", "wheat_2.png","wheat_3.png" ]
	
	method image() {
		return images.get(gradoEvolucion)
	}
	method efectoRegada(){
		game.removeVisual(self)
		game.addVisual(self)
		if (gradoEvolucion < 3) gradoEvolucion++ else gradoEvolucion = 0
	}
	method estaListoParaCosechar() = gradoEvolucion >= 2
}

class Tomaco {
	var property position
	var property valor = 80
	
	method image() {
		return "tomaco.png"
	} 
	method efectoRegada(){
		game.removeVisual(self)
		game.addVisualIn(self, self.position().up(1))	
		}
	method estaListoParaCosechar() = true
	}
	