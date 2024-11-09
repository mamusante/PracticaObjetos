import item.*
import jugador.*
import nave.*
class Tarea {
  const requisitos

  method realizar(unJugador)
  method cumpleRequisitos(unJugador) = requisitos.all({unItem => unJugador.posee(unItem)})
  method usarItemsNecesarios(unJugador){
    requisitos.forEach({unItem => unJugador.usar(unItem)})
  }
}

object arreglarTableroElectrico inherits Tarea (requisitos = [llaveInglesa]) {

    override method realizar(unJugador)
    {
        unJugador.aumentarNivelDeSospecha(10)
        self.usarItemsNecesarios(unJugador)
        
    }
    
}

object sacarLaBasura inherits Tarea (requisitos = [escoba , bolsaDeConsorcio])
{
    override method realizar(unJugador) {
      
        unJugador.bajarNivelDeSospecha(4)
        self.usarItemsNecesarios(unJugador)
    
    }
}

object ventilarLaNave inherits Tarea (requisitos = []) {
    override method realizar(unJugador){
        laNaveUnica.aumentarNivelDeOxigeno(5)
    }
}