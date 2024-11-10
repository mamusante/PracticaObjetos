class Pack{

    const vigencia

    method estaVigente(){
        const hoy = new Date()

        return vigencia > hoy
    }
    
    method satisface(unConsumo)

    method registrarConsumo(consumo)

    method estaAcabado()
}

class CreditoDisponible inherits Pack{
    var cantidadDeCreditoDisponible

    override method satisface(unConsumo) = unConsumo.costo() < cantidadDeCreditoDisponible

    override method registrarConsumo(consumo){
        cantidadDeCreditoDisponible -= consumo.costo()
    }

    override method estaAcabado() = cantidadDeCreditoDisponible >= 0

    
}

class MBlibres inherits Pack{
    var cantidadDeMBLibres

    override method satisface(unConsumo) = unConsumo.seSatisfacePorInternet(cantidadDeMBLibres)

    override method registrarConsumo(unConsumo){
        cantidadDeMBLibres -= unConsumo.cantidadMBConsumidos()
    }
    
    override method estaAcabado() = cantidadDeMBLibres >= 0
}

class MBlibresMasMas inherits MBlibres{

    override method satisface(unConsumo) = super(unConsumo) or unConsumo.cantidadMBConsumidos() <= 0.1 
    
    override method estaAcabado() = false
    
}

class llamadasGratis inherits Pack{
    
    override method satisface(unConsumo) = unConsumo.seSatisfacePorSegundos()

    override method registrarConsumo(unConsumo){
    }

    override method estaAcabado() = false
}

class internetIlimitadoLosFindes inherits Pack{

    override method satisface(unConsumo) = unConsumo.fechaConsumo().dayOfWeek() == 6 or unConsumo.fechaConsumo().dayOfWeek() == 7


    override method registrarConsumo(unConsumo){
    }

    override method estaAcabado() = false
}