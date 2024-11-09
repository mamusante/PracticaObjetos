import jugador.*
import item.*

object laNaveUnica {
    var nivelDeOxigeno = 0
    var jugadores = []
    var cantidadDeTripulantes = 0
    var cantidadDeImpostores = 0

    method aumentarNivelDeOxigeno(valorAAumentar) {
        nivelDeOxigeno += valorAAumentar
    }

    method bajarNivelDeOxigeno(valorABajar) {
        if(!self.alguienTieneTuboDeOxigeno())
        {
            nivelDeOxigeno -= valorABajar
            self.verificarQueAunHayOxigeno()
        }  
    }

    method alguienTieneTuboDeOxigeno(){
        return jugadores.any({unJugador => unJugador.posee(tuboDeOxigeno)})
    }

    method verificarQueAunHayOxigeno(){
        if(nivelDeOxigeno <= 0){
            throw new DomainException(message = "Ganaron los impostores, no hay mas oxigeno en la nave :(")
        }
    }

    method tareaRealizada()
    {
        if(self.todasLasTareasFueronRealizadas()){
            self.juegoGanado()
        }
           
    }

    method juegoGanado(){

        throw new DomainException (message = "Felicidades!! Los tripulantes ganaron el juego")

    }

    method juegoPerdido(){
        
        throw new DomainException (message = "Perdieron bobos, ganaron los impostores")

    }
    method todasLasTareasFueronRealizadas(){
        return jugadores.all({unJugador => unJugador.completoTodasSusTareas()})
    }

    method comenzarVotacion(){

        const votos = self.jugadoresVivos().map({unJugador => unJugador.voto()})

        const elMasVotado = votos.max { alguien => votos.occurrencesOf(alguien) }
        
        if(elMasVotado != votoEnBlanco){
            elMasVotado.expulsar()
        }
        

        
    }

    method expulsarUnImpostor(){
        cantidadDeImpostores -= 1
        if( 0 >= cantidadDeImpostores) {
            self.juegoGanado()
        }
    }
    method expulsarUnTripulante(){
        cantidadDeTripulantes -= 1
        if(cantidadDeTripulantes == cantidadDeImpostores) {
            self.juegoPerdido()
        }
            
    }

    method jugadoresVivos(){
        return jugadores.filter({unJugador => unJugador.vivo()})
    }

    method cualquieraVivo(){

        return self.jugadoresVivos().anyOne()

    }

    method cualquierJugadorConMochiVacia(){
        return self.jugadoresVivos().findOrElse({unJugador => unJugador.mochilaVacia()}, votoEnBlanco)
    }

    method jugadorConMayorNivelDeSospecha(){
       
        return self.jugadoresVivos().max{unJugador => unJugador.nivelDeSospecha()}
    }

    method cualquierJugadorNoSospechoso(){
        return self.jugadoresVivos().findOrElse({unJugador=> !unJugador.sospechoso()}, votoEnBlanco)
    }

}

object votoEnBlanco{}