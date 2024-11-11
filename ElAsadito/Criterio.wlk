class Criterio{
    method verSiPasaElElemento(unElemento , personaQueDa , personaQueRecibe)
}

object sordo inherits Criterio{

    override method verSiPasaElElemento(unElemento , personaQueDa , personaQueRecibe){
        personaQueDa.dar(personaQueDa.cualquierElemento(), personaQueRecibe)
    }
}

object pasoTodoParaQueNoMeJodan inherits Criterio{
    override method verSiPasaElElemento(unElemento , personaQueDa , personaQueRecibe){

        personaQueDa.darTodosSusElementos(personaQueRecibe)
    }
}

object pideCambiarDePosicion inherits Criterio{
    override method verSiPasaElElemento(unElemento , personaQueDa , personaQueRecibe){

        personaQueDa.cambiarDePosicionCon(personaQueRecibe)
    }
}

object elBendito inherits Criterio{
    override method verSiPasaElElemento(unElemento , personaQueDa , personaQueRecibe){
        personaQueDa.dar(unElemento, personaQueRecibe)
    }
}