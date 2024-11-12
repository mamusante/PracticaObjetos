class EstadoDeOperacion{

    method reservarANombreDe(unInteresado , unaOperacion)

    method concretar(unInteresado , unaOperacion)
}

object disponible inherits EstadoDeOperacion{
    override method reservarANombreDe(unInteresado , unaOperacion){

        unaOperacion.estado(new Reserva(clienteQueReservo = unInteresado))
    }

    override method concretar(unInteresado , unaOperacion) {
        unaOperacion.estado(cerrado)
    }
}

class Reserva inherits EstadoDeOperacion{
    const clienteQueReservo

    override method reservarANombreDe(unInteresado , unaOperacion){
        throw new Exception(message = "Mildis, ya esta reservado")
    }

    override method concretar(unInteresado , unaOperacion) {
        self.verificarQuePuedeConcretarElCliente(unInteresado)
        unaOperacion.estado(cerrado)
    }

    method verificarQuePuedeConcretarElCliente(unCliente){
        if(not unCliente == clienteQueReservo){
            throw new Exception(message = "Esta operacion fue reservada por otro cliente sorry master")
        }
    }
    
}

object cerrado inherits EstadoDeOperacion{
   override method reservarANombreDe(unInteresado , unaOperacion){
        self.fallarPorOperacionCerrada()
    }

    override method concretar(unInteresado , unaOperacion) {
        self.fallarPorOperacionCerrada()
    }

    method fallarPorOperacionCerrada(){
        throw new Exception(message = "Mildis, ya esta cerrada esta operacion")
    }
}