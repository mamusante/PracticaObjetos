class Inmueble{
    const tamanio
    const cantidadDeAmbientes
    const zona

    method zona() = zona

    method valor() = self.valorParticular() + zona.plusDeZona()

    method valorParticular()
 
}

class Casa inherits Inmueble{
    const valorDeLaCasa

    override method valorParticular() = valorDeLaCasa
}

class PH inherits Inmueble{

    const minimoPrecioParaPH = 500000

    override method valorParticular() = minimoPrecioParaPH.max(self.valorDebidoAMetrosCuadrados())

    method valorDebidoAMetrosCuadrados() = tamanio * 14000
}

class Departamento inherits Inmueble{

    const precioPorAmbiente = 350000

    override method valorParticular() = cantidadDeAmbientes * precioPorAmbiente
}