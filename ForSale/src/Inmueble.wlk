class Inmueble{
    const tamanio
    const cantidadDeAmbientes
    const zona

    method zona() = zona

    method valor() = self.valorParticular() + zona.plusDeZona()

    method valorParticular()
 
}

class Casa inherits Inmueble{
    const valor

    override method valorParticular() = valor
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

class Local inherits Casa{
    var tipoDeLocal 

    method tipoDeLocal(nuevoTipo){
        tipoDeLocal = nuevoTipo
    }

    override method valorParticular() = tipoDeLocal.valorParticular(self)

    method remodelar(){
        tipoDeLocal.remodelarse(self)
    }

}

class TipoDeLocal{
    method valorParticular(local)

    method remodelarse(local)
}

class Galpon inherits TipoDeLocal{

    override method valorParticular(local) = local.valorParticular() / 2

    override method remodelarse(local){
        local.tipoDeLocal(new ALaCalle())
    }
    
}

class ALaCalle inherits TipoDeLocal{

    const montoFijo = 0

    override method valorParticular(local) = local.valorParticular() + montoFijo

    override method remodelarse(local){
        local.tipoDeLocal(new Galpon())
    }
}