import nave.*
import tarea.*
import item.*

class Jugador {
  const color
  var mochila = []

  var nivelDeSospecha = 40

  var tareasARealizar = []

  method sospechoso() = nivelDeSospecha > 50

  method buscarItem(unItem){
    mochila.add(unItem)
  }

  method realizarTarea(unaTarea) {
    if(!impostor){
      if(self.tieneQueRealizar(unaTarea))
      {
        if(unaTarea.cumpleRequisitos(self))
        {
          unaTarea.realizar(self)
          tareasARealizar.delete(unaTarea)
          laNaveUnica.tareaRealizada()

        }
      }
    }
    
  }

  method tieneQueRealizar(unaTarea) = tareasARealizar.contains(unaTarea)

  method completoTodasSusTareas() 
  {
    if(!impostor){
      return tareasARealizar.length() == 0
    }else return true
  } 
}

class Impostor inherits Jugador{

}

class Tripulante inherits Jugador{

}

