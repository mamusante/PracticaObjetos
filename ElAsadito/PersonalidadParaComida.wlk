class PersonalidadParaLaComida{

}

object vegetariano{

    method leCopa(unaComida) = !unaComida.esCarne()
}

object dietetico{

    method leCopa(unaComida) = unaComida.calorias() < laOMS.caloriasRecomendables()
}

class alternado{
    var aceptoLaAnterior = false
    method leCopa(unaComida) {
        aceptoLaAnterior = !aceptoLaAnterior
        return aceptoLaAnterior
    }
}

class combinacionDePersonalidades{

    const personalidades = []

    method leCopa(unaComida) = personalidades.all({personalidad => personalidad.leCopa(unaComida)})
}

object laOMS {
    var caloriasRecomendables = 500

    method caloriasRecomendables() = caloriasRecomendables
}