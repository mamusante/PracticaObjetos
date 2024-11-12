import Vikingo.*
import Aldea.*
import Capital.*
import Castas.*


class Expedicion(){

    const vikingos = []
    const lugaresDeExpedicion = []

    method cantidadDeVikingos() = vikingos.size()

    method realizarExpedicion(){
        lugaresDeExpedicion.forEach({lugar => lugar.serInvadidoPor(self)})
    }

    method valeLaPena(){
        lugaresDeExpedicion.forEach({lugar => lugar.valeLaPena(self)})
    }

    method llevarseRiquezas(unasMoneditas){
        vikingos.forEach({vikingo => self.darSuParteA(vikingo , unasMoneditas)})
    }

    method darSuParteA(unVikingo, unasMonedas){
        unVikingo.reclamarBotin(unasMonedas / self.cantidadDeVikingos())
    }

    method cobrarVidas(){
        vikingos.forEach({vikingo => vikingo.cobrarVida()})
    }

}