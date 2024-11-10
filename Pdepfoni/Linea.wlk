class Linea{
  const numeroDeTelefono
  const empresa
  const packsActivos = []
  const consumos = []
  const hoy = new Date()

  method costoPromedio(fechaInicial , fechaFinal){

   return self.consumosEntre(fechaInicial , fechaFinal).sum({consumo => consumo.costo()}) / consumos.size()
   
  }

  method consumosEntre(fechaInicial , fechaFinal) = consumos.filter({consumo => consumo.fechaEntre(fechaInicial , fechaFinal)})

  

  method gastoTotal() = self.consumosUltimos30Dias().sum({consumo => consumo.costo()})

  method consumosUltimos30Dias() = self.consumosEntre(hoy , hoy.minusDays(30))
}

