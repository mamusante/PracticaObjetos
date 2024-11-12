class Aldea{

    const crucifijosEnIglesias

    method valeLaPena(unaExpedicion) = self.oro() >= 15

    method serInvadidoPor(unaExpedicion){
        unaExpedicion.llevarseRiqueza(self.oro())
    }

    method oro() = crucifijosEnIglesias
}

class AldeaAmurallada inherits Aldea{

    const cantidadMinimaDeVikingos

    override method valeLaPena(unaExpedicion) = super(unaExpedicion)  and self.cumpleConMinimoDeVikingos(unaExpedicion)

    method cumpleConMinimoDeVikingos(unaExpedicion) = unaExpedicion.cantidadDeVikingos() > cantidadMinimaDeVikingos

    override method serInvadidoPor(unaExpedicion){
        self.verificarMinimoDeVikingos(unaExpedicion)
        super(unaExpedicion)
    }

    method verificarMinimoDeVikingos(unaExpedicion){
        if(not self.cumpleConMinimoDeVikingos(unaExpedicion)){
            throw new Exception (message = "Esta aldea no pudo ser invadida lusers")
        }

    }
}