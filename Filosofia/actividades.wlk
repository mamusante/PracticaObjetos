import deportes.*
class Actividad {
    method afectar(unFilosofo)
}

object tomarVino inherits Actividad{
    override method afectar(unFilosofo){
        unFilosofo.disminuirIluminacion(10)
        unFilosofo.agregarHonorifico("el borracho")
    }
}

class JuntarseEnElAgora inherits Actividad {

    const companieroDeJuntada

    override method afectar(unFilosofo){
        unFilosofo.aumentarIluminacion(self.unDecimoDeIluminacionDelCompa())
    }

    method unDecimoDeIluminacionDelCompa() = companieroDeJuntada.nivelDeIluminacion() * (1/10)
}

object admirarElPaisaje inherits Actividad{
    override method afectar(unFilosofo){ }
}

class MeditarBajoUnaCascada inherits Actividad{
    const metrosDeLaCascada
    override method afectar(unFilosofo){
        unFilosofo.aumentarIluminacion(10*metrosDeLaCascada)
    }
}

class PracticarUnDeporte inherits Actividad{
    const deporte

    override method afectar(unFilosofo){
        unFilosofo.rejuvenecer(deporte.diasQueRejuvenece())
    }
}

