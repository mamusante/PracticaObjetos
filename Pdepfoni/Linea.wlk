class Linea{
  const numeroDeTelefono
  const empresa
  const packs = []
  const consumos = []
  var tipoDeLinea
  const hoy = new Date()

  method costoPromedio(fechaInicial , fechaFinal){

   return self.consumosEntre(fechaInicial , fechaFinal).sum({consumo => consumo.costo()}) / consumos.size()

  }

  method consumosEntre(fechaInicial , fechaFinal) = consumos.filter({consumo => consumo.fechaEntre(fechaInicial , fechaFinal)})

  method agregarUnPack(packAAgregar){
    packs.add(packAAgregar)
  }

  method gastoTotal() = self.consumosUltimos30Dias().sum({consumo => consumo.costo()})

  method consumosUltimos30Dias() = self.consumosEntre(hoy , hoy.minusDays(30))

  method puedeHacer(unConsumo)
  {
    return self.packsActivos().any({pack => pack.satisface(unConsumo)})
  }

  method packsActivos() = packs.filter({pack => pack.estaVigente()})


  method realizarUnConsumo(consumo){

    if(self.puedeHacer(consumo)){
      self.registrarConsumo(consumo)
      self.consumir(consumo)
    }else { 
      tipoDeLinea.accionAnteNoPoderHacerUnConsumo(self, consumo)
    }
    
  }

  method permitirConsumo(consumo){
    self.registrarConsumo(consumo)
  }

  method registrarConsumo(consumo){
    consumos.add(consumo)

  }

  method consumir(consumo)
  {
    self.packQueSirve(consumo).registrarConsumo(consumo)
  }

  method packQueSirve(unConsumo) = self.packsActivos().reverse().find({pack => pack.satisface(unConsumo)})


  method limpiarPacks()
  {
    packs.removeAllSuchThat({pack => pack.estaAcabado() or !pack.estaVigente()})
  }
}


object comun{
  method accionAnteNoPoderHacerUnConsumo(linea , consumo){
    throw new Exception(message = "Sory pero no podes hacer este consumo man")
  }

}

object platinium{

  method accionAnteNoPoderHacerUnConsumo(linea , consumo){
    linea.permitirConsumo(consumo)
  }
}

object black{

  method accionAnteNoPoderHacerUnConsumo(linea , consumo){
      linea.agregarARegistroDeDeudas(consumo)
  }

}