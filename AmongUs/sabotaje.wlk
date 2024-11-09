import nave.*
import jugador.*

class Sabotaje {
    method realizar(unImpostor)

}

object reducirElOxigeno inherits Sabotaje{

    override method realizar(unImpostor){
        laNaveUnica.bajarNivelDeOxigeno(10)
    }
}

class ImpugnarUnJugador inherits Sabotaje{

    const jugadorAImpugnar

    override method realizar(unImpostor){
        jugadorAImpugnar.impugnarVoto()
        
    }
}