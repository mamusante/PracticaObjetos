import discusiones.*
import actividades.*

class Filosofo{
  const nombre
  var actividades = []
  var honorificos = []
  var nivelDeIluminacion
  var anios
  var diasVividosAntesDeCumpleanios

  method nombre() = nombre

  method presentarse() = self.nombre() + self.stringDeHonorificos()

  method stringDeHonorificos() = honorificos.join(" , ")

  method estaEnLoCorrecto() = self.nivelDeIluminacion() > 1000

  method nivelDeIluminacion() = nivelDeIluminacion

  method aumentarIluminacion(valorAAumentar) {
    nivelDeIluminacion += valorAAumentar
  }

  method disminuirIluminacion(valorADisminuir) {
    nivelDeIluminacion += valorADisminuir
  }

  method agregarHonorifico(nuevoHonorifico) {

    if(!self.tieneHonorifico(nuevoHonorifico)){
      honorificos.add(nuevoHonorifico)
    }

  }

  method tieneHonorifico(unHonorifico) = honorificos.contains(unHonorifico)

  method vivirUnDia(){
    self.realizarTodasLasActividades()
    self.pasarUnDia()
  }

  method realizarTodasLasActividades(){
    actividades.forEach({actividad => actividad.afectar(self)})
  }

  method pasarUnDia(){

    diasVividosAntesDeCumpleanios +=1

    if(diasVividosAntesDeCumpleanios == 365)
    {
      diasVividosAntesDeCumpleanios = 0
      self.cumplirAnios()
      
    }
  }

  method rejuvenecer(cantDeDias) {
    diasVividosAntesDeCumpleanios -= cantDeDias
  }

  method cumplirAnios(){
    anios += 1 
    self.aumentarIluminacion(10)
    
  }

  method chequearSiPasaASerSabio(){
    if(anios == 60){
      self.agregarHonorifico("el sabio")
    }
  }
}


class FilosofoContemporaneo inherits Filosofo{
  
  override method presentarse() = "hola"

  method amaAdmirarPaisaje() = actividades.contains(admirarElPaisaje)

  override method nivelDeIluminacion() = super() * self.coeficienteDeAmorAPaisaje()

  method coeficienteDeAmorAPaisaje() {
    if(self.amaAdmirarPaisaje()) {
      return 5
    }else return 1
  }



}



