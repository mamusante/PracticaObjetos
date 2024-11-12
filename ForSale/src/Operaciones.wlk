import Estados.*

class Operacion{
    const inmueble
    const estado = disponible

    method comision()

    method reservarInmueble(unInteresado){

        estado.reservarANombreDe(unInteresado , self)
    }

    method concretarOperacion(unInteresado){
        estado.concretarOperacion(unInteresado, self)
        
    }

    method zona() = inmueble.zona()

}

class Alquiler inherits Operacion{
    const cantidadDeMeses

    override method comision() = (cantidadDeMeses * inmueble.valor()) / 50000
}

class Venta inherits Operacion{

    const anioDeVenta

    override method comision() = anioDeVenta.porcentajeDeComision() * inmueble.valor()

}

