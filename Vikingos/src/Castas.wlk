class Casta{

    method puedeIr(unVikingo) = true

    method ascenderSocialmente(unVikingo)

}

object jarl inherits Casta{

    override method puedeIr(unVikingo) = not unVikingo.tieneArmas()

    override method ascenderSocialmente(unVikingo) {
        unVikingo.ascenderA(karl)
        unVikingo.bonificarAscenso()
    }
}

object karl inherits Casta{
    override method ascenderSocialmente(unVikingo) {
        unVikingo.ascenderA(thrall)
    }
  
}

object thrall inherits Casta{
    override method ascenderSocialmente(unVikingo) {
        // No pasa nada pq no pueden ascender
    }
}