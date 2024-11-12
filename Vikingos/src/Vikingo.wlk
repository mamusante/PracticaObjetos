
class Vikingo{

  var castaSocial
  var oro

  method reclamarBotin(unasMoneditas){
    oro += unasMoneditas
  }

  method puedeIrAUnaExpedicion() = castaSocial.puedeIr(self) and self.esProductivo()

  method ascenderSocialmente(){
    castaSocial.ascenderSocialmente(self)
  }

  method esProductivo()

  method subirseA(unaExpedicion){
    self.verificarQuePuedeSubirse()
    unaExpedicion.sumarVikingo(self)
  }

  method verificarQuePuedeSubirse(){
    
    if(not self.puedeIrAUnaExpedicion()){
      throw new DomainException(message = "Este vikingo no puede ir a la expedicion sorry")
    }
  }

  method ascenderA(unaCasta){
    castaSocial = unaCasta
  }

  method bonificarAscenso()
}

class Granjero inherits Vikingo{
  var cantidadDeHijos 
  var hectareasDesignadas

  override method esProductivo() = self.hectareasPuedenAlimentarASusHijos()

  method hectareasPuedenAlimentarASusHijos() = hectareasDesignadas / 2 >= cantidadDeHijos

  method ganarHectareas(cantHectareas){
    hectareasDesignadas += cantHectareas
  }

  method ganarHijos(cantHijos){
    cantidadDeHijos += cantHijos
  }

  override method bonificarAscenso(){
    self.ganarHectareas(2)
    self.ganarHijos(2)
  }
}

class Soldado inherits Vikingo{

  var vidasCobradas
  var cantidadDeArmas 

  override method esProductivo() = vidasCobradas > 20 and self.tieneArmas()

  method tieneArmas() = cantidadDeArmas > 0


  method ganarArmas(cantArmasAGanar){
    cantidadDeArmas += cantArmasAGanar
  }

  method cobrarVida(){
    vidasCobradas += 1
  }

  override method bonificarAscenso(){
    self.ganarArmas(10)
  }
}