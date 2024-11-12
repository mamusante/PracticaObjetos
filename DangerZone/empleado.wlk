class Empleado{
    const habilidades = []
    var cantidadDeSalud
    var tipoDeProfesion
    

    method estaIncapacitado() = cantidadDeSalud < tipoDeProfesion.saludCritica()

    method puedeUsar(unaHabilidad) = self.posee(unaHabilidad) and !self.estaIncapacitado()

    method posee(unaHabilidad) = habilidades.contains(unaHabilidad)

    method ascenderAEspia() {
        tipoDeProfesion = new Espia()
    }

    method aprender(unasHabilidades){
        // Solo aprende aquellas que no sabe

        unasHabilidades.forEach({habilidad => self.aprenderSiNoPosee(habilidad)})
    }

    method aprenderSiNoPosee(unaHabilidad){
        if(!self.posee(unaHabilidad)) habilidades.add(unaHabilidad)
    }

    method recibirDanio(unaPeligrosidad){
        self.bajarSalud(unaPeligrosidad)
    }
    method bajarSalud(unaPeligrosidad){
        cantidadDeSalud -= unaPeligrosidad
    }

    method registrarMision(unaMision){
        if(self.sobrevivio()){
            tipoDeProfesion.registrarMision(unaMision , self)
        }
    }

    method sobrevivio() = cantidadDeSalud > 0
}

class Espia {

    method saludCritica() = 15

    method registrarMision(unaMision, unEmpleado){
        unEmpleado.aprender(unaMision.habilidadesRequeridas())

    }
}

object Oficinista {
   
    var cantidadDeEstrellas = 0


    method saludCritica() = 40 - 5 * cantidadDeEstrellas

    method registrarMision(unaMision, unEmpleado){
        self.agregarEstrella(unEmpleado)
    }

    method agregarEstrella(unEmpleado){
        cantidadDeEstrellas += 1
        self.verificarSiPasaAEspia(unEmpleado)
    }

    method verificarSiPasaAEspia(unEmpleado){
        if(cantidadDeEstrellas == 3){
            unEmpleado.ascenderAEspia()
        }
    }
    
}

class Jefe inherits Empleado{
    const empleadosACargo = []

    override method posee(unaHabilidad) = super(unaHabilidad) or self.algunoDeSusEmpleadosPosee(unaHabilidad) 

    method algunoDeSusEmpleadosPosee(unaHabilidad) = empleadosACargo.any({empleado => empleado.posee(unaHabilidad)})
    
 }