import item.*
import jugador.*
import nave.*
class Tarea {
  const requisitos

  method realizar(unJugador)
  method cumpleRequisitos(unJugador) = requisitos.all({unItem => unJugador.posee(unItem)})
}

object arreglarTableroElectrico inherits Tarea (requisitos = [llaveInglesa]) {

    override method realizar(unJugador)
    {
        unJugador.aumentarNivelDeSospecha(10)
        
    }
    
}

object sacarLaBasura inherits Tarea (requisitos = [escoba , bolsaDeConsorcio])
{
    override method realizar(unJugador) {
      
        unJugador.bajarNivelDeSospecha(4)
    
    }
}

object ventilarLaNave inherits Tarea (requisitos = []) {
    override method realizar(unJugador){
        laNaveUnica.aumentarNivelDeOxigeno(5)
    }
}