import jugador.*

object laNaveUnica {
    var nivelDeOxigeno = 0
    var jugadores = []
    var cantidadDeTripulantes = 0
    var cantidadDeImpostores = 0

    method aumentarNivelDeOxigeno(valorAAumentar) {
        nivelDeOxigeno += valorAAumentar
    }

    method tareaRealizada()
    {
        if(self.juegoGanado()){
             throw new DomainException (message = "Felicidades!! Todas las tareas han sido realizadas, ganaron man")
        }
           
    }

    method juegoGanado(){
        return jugadores.all({unJugador => unJugador.completoTodasSusTareas()})
    }


}