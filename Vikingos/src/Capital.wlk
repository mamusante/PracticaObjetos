class Capital{
    var defensoresDerrotados
    const factorDeRiqueza

    method valeLaPena(unaExpedicion) = self.monedasEnBotin() / 3 > unaExpedicion.cantidadDeVikingos()

    method monedasEnBotin() = defensoresDerrotados * factorDeRiqueza

    method serInvadidoPor(unaExpedicion){
        self.derrotarDefensores(unaExpedicion)
        unaExpedicion.llevarseRiqueza(self.monedasEnBotin())
    }

    method derrotarDefensores(unaExpedicion){
        defensoresDerrotados += unaExpedicion.cantidadDeVikingos()
        unaExpedicion.cobrarVidas()
    }
}