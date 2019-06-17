import wollok.game.*
import farmVille.*


class Hector {
	var property position = game.at(3,3)
	var property plantasParaVender = []
	var property oroAcumulado = 0
	
	method sembrar(planta){
		if(game.colliders(self).isEmpty()){
			game.addVisual(planta)
		}
	}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	
	method image() = "player.png"
	
	method regar(){
		if(not game.colliders(self).isEmpty()){
			return game.colliders(self).forEach({unaPlanta => unaPlanta.efectoRegada()})
		}
		else {
			return game.say(self,"no hay nada para regar")
		}
	}
	
	method cosechar(){
		if(not game.colliders(self).isEmpty()){
			var planta = game.colliders(self).first()
			if(planta.estaListoParaCosechar()){
				plantasParaVender.add(planta)
				game.removeVisual(planta)
			}		
		}
		else{
			game.say(self,"no hay nada para cosechar")
		}
	}
	
	method valorTotal(){
		return self.plantasParaVender().forEach({unaPlanta => self.oroAcumulado() + unaPlanta.valor()})
	}
	
	method vender(){
		var valorTotalDeCosecha = self.plantasParaVender().map({unaPlanta => unaPlanta.valor()}).sum()
		if(not game.colliders(self).isEmpty() and game.colliders(self).first().monedas() >= valorTotalDeCosecha){
			self.oroAcumulado(valorTotalDeCosecha)
			self.plantasParaVender().clear()
		} else {
				game.say(self,"no estas en un mercado")
		  }
		}
}


class Mercado {
	var property monedas = 0
	var property mercaderia=[]
	var property position
	method image() = "market.png"
		
}

