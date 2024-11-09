import nave.*
import tarea.*
import item.*

class Jugador {
  const color
  var mochila = []
 
  var property vivo = true


  var nivelDeSospecha = 40

 

  method posee(unItem) {
    return mochila.contains(unItem)
  }

 

  method aumentarNivelDeSospecha(valorAAumentar){
    nivelDeSospecha += valorAAumentar
  }

  method bajarNivelDeSospecha(valorABajar){
    nivelDeSospecha -= valorABajar
  }
  method sospechoso() = nivelDeSospecha > 50

  method nivelDeSospecha() = nivelDeSospecha

  method buscarItem(unItem){
    mochila.add(unItem)
  }

  method realizarTarea() 

  method completoTodasSusTareas() 

  method llamarReunionDeEmergencia(){
    laNaveUnica.comenzarVotacion()
  }

  method mochilaVacia() = mochila.isEmpty()

  method voto()

}

class Impostor inherits Jugador{

  override method completoTodasSusTareas() = true

  method expulsar(){
    laNaveUnica.expulsarUnImpostor()
    vivo = false
  }

  method realizarSabotaje(unSabotaje) {
    self.aumentarNivelDeSospecha(5)
    unSabotaje.realizar(self)
  }

  override method realizarTarea() {
    // no hace nada
  }

  override method voto(){
    laNaveUnica.cualquieraVivo()
  }

}

class Tripulante inherits Jugador{

  var votoImpugnado = false
  const personalidad
  const tareasARealizar = []

  method impugarVoto()
  {
    votoImpugnado = true
  }

  method expulsar(){
    laNaveUnica.expulsarUnTripulante()
    vivo = false
  }

   

  override method completoTodasSusTareas() = tareasARealizar.isEmpty()

  override method realizarTarea(){

    const tareaARealizar = self.tareaPendienteYHacible()
    tareaARealizar.realizar(self)
    tareasARealizar.remove(tareaARealizar)
    laNaveUnica.tareaRealizada()

  }

  method tareaPendienteYHacible(){
    return tareasARealizar.find({unaTarea => unaTarea.cumpleRequisitos(self)})
  }

  override method voto(){
    if(!votoImpugnado){
      return personalidad.votarSegunPersonalidad()
    }else {
      votoImpugnado = false 
      return votoEnBlanco
    }
      
  }

}

class Troll {
  method votarSegunPersonalidad(){
    return laNaveUnica.cualquierJugadorNoSospechoso()
  }
}

class Detective {
  method votarSegunPersonalidad(){
    return laNaveUnica.jugadorConMayorNivelDeSospecha()
  }
}

class Materialista {
  method votarSegunPersonalidad(){
    return laNaveUnica.cualquierJugadorConMochiVacia()
  }
}

