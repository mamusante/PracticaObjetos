class Mision{

    const property habilidadesRequeridas = []
    const peligrosidad

    method cumpleRequerimientos(personaOGrupo) = habilidadesRequeridas.all({habilidadRequerida => personaOGrupo.puedeUsar(habilidadRequerida)})
    
    method afectar(personaOGrupo){
        personaOGrupo.bajarSalud(peligrosidad)
    }

    method serCumplidaPor(personaOGrupo)
    {
        self.validarRequerimientos(personaOGrupo)
        personaOGrupo.recibirDanio(peligrosidad)
        personaOGrupo.registrarMision(self)
        
    }

    method validarRequerimientos(personaOGrupo){
        if(!self.cumpleRequerimientos(personaOGrupo)){
            throw new Exception(message = "La mision no puede ser cumplida")
        }
    }
}