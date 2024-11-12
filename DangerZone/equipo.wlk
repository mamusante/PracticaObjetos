class Equipo{

    const integrantes = []

    method puedeUsar(unaHabilidad) = integrantes.any({integrante => integrante.puedeUsar(unaHabilidad)})
    

    method recibirDanio(unaPeligrosidad){

        integrantes.forEach({integrante => integrante.bajarSalud(unaPeligrosidad * 0.3)})
        
    }
}