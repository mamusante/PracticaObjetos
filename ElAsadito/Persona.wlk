import PersonalidadParaComida.*
import Criterio.*

class Persona{

  var property posicion = 0
  var criterio 
  var personalidadParaLaComida
  var loQueComio = []

  method pedirElementoA(unaPersona , unElemento){
    unaPersona.pasarElemento(unElemento, self)
  }

  method pasarElemento(unElemento, personaQueRecibe){
    self.puedePasarElElemento(unElemento)
    criterio.verSiPasaElElemento(unElemento , self, personaQueRecibe)
  }

  method puedePasarElElemento(unElemento){
    if(!self.tiene(unElemento)) throw new DomainException (message = "no te puedo pasar eso pq no tengo eso amigacho")
  }

  method tiene(unElemento) = posicion.elementosCerca().contains(unElemento)

  method dar(unElemento, personaQueRecibe){
    posicion.elementosCerca().remove(unElemento)
    personaQueRecibe.recibir(unElemento)

  }

  method recibir(unElemento){
    posicion.elementosCerca().add(unElemento)
  }

  method cualquierElemento() = posicion.elementosCerca().anyOne()

  method darTodosSusElementos(personaQueRecibe) {
    posicion.elementosCerca().forEach({elemento => personaQueRecibe.recibir(elemento)})
    posicion.elementosCerca().clear()
  } 
  
  method cambiarDePosicionCon(unaPersona){
    const miPosicion = posicion
    posicion = unaPersona.posicion()
    unaPersona.posicion(miPosicion)
  }
  
  method verSiQuiereComer(unaBandeja){
    if(self.leCopa(unaBandeja)){
      self.registrarComida(unaBandeja)
    }
  }

  method cantidadDeElementosCerca() = posicion.cantidadDeElementosCerca()

  method leCopa(unaComida) = personalidadParaLaComida.leCopa(unaComida)
  

  method registrarComida(unaComida){
    loQueComio.add(unaComida)
  }

  method estaPipon() = loQueComio.any({comida => comida.esPesada()})
  

  method comioAlgo() = !loQueComio.isEmpty()

  method comioCarne() = loQueComio.any({comida => comida.esCarne()})

  method laEstaPasandoBien() = self.comioAlgo()
}

object osky inherits Persona (criterio = elBendito , personalidadParaLaComida = alternado){

}

object moni inherits Persona (criterio = elBendito , personalidadParaLaComida = alternado){
  override method laEstaPasandoBien() = super() and self.posicion() == 1
}

object facu inherits Persona (criterio = elBendito , personalidadParaLaComida = alternado){
  override method laEstaPasandoBien() = super() and self.comioCarne()
}

object vero inherits Persona (criterio = elBendito , personalidadParaLaComida = alternado){
  override method laEstaPasandoBien() = super() and self.cantidadDeElementosCerca() < 3
}

class Posicion{
  var property elementosCerca = []

  method cantidadDeElementosCerca() = elementosCerca.size()
}