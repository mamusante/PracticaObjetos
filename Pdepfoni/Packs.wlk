class Pack{

    const vigencia
    
    method satisface(unConsumo)
}

class CreditoDisponible inherits Pack{
    var cantidadDeCreditoDisponible

    override method satisface(unConsumo) = unConsumo.costo() < cantidadDeCreditoDisponible

    
}

class MBlibres inherits Pack{
    var cantidadDeMBLibres

    override method satisface(unConsumo){
        unConsumo.seSatisfacePorInternet(cantidadDeMBLibres)
    }
}

class llamadasGratis{
    

}

class internetIlimitadoLosFindes{

}