import Empresa.*
class Consumo {
    const fechaConsumo
    method costo()

    method fechaEntre(fechaInicial , fechaFinal){
        fechaConsumo.between(fechaInicial, fechaFinal)
    }
}

class ConsumoDeInternet inherits Consumo{
    const cantidadMBConsumidos

    override method costo() = cantidadMBConsumidos * pdepfoni.precioPorMB()

    method seSatisfacePorInternet(mbdisponibles) = cantidadMBConsumidos <= mbdisponibles


    method cantidadMBConsumidos() = cantidadMBConsumidos
}

class ConsumoDeLlamadas inherits Consumo{
    const cantidadSegundosConsumidos

    method seSatisfacePorSegundos()

    override method costo() = pdepfoni.precioFijo() + self.segundosACobrar() * pdepfoni.precioPorSegundo()

    method segundosACobrar() = if(cantidadSegundosConsumidos <= 30) 0 else (cantidadSegundosConsumidos - 30)
    
}