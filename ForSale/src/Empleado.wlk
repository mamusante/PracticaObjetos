import Inmobiliaria.*
class Empleado{

    var operacionesCerradas = []
    var reservas = []
    var dineroPorComisiones

    method reservar(unaOperacion , unInteresado){
        unaOperacion.reservarInmueble(unInteresado)
        self.agregarReserva(unaOperacion)
    }

    method agregarReserva(unaOperacion){
        reservas.add(unaOperacion)
    }

    method concretarO(unaOperacion , unInteresado){
        unaOperacion.concretarOperacion(unInteresado)
        self.agregarOperacion(unaOperacion)
        self.cobrarComision(unaOperacion)
    }

    method agregarOperacion(unaOperacion) {
        operacionesCerradas.add(unaOperacion)
    }

    method cobrarComision(unaOperacion){
        dineroPorComisiones += unaOperacion.comision()
    }

    method totalDeComisiones() = dineroPorComisiones

    method cantidadDeOperacionesCerradas() = operacionesCerradas.size()

    method cantidadDeReservas() = reservas.size()

    method vaATenerProblemasCon(otroEmpleado) = self.cerroOperacionesEnLaMismaZonaQue(otroEmpleado) and self.concretoOperacionReservadaPor(otroEmpleado)

    method cerroOperacionesEnLaMismaZonaQue(otroEmpleado){
       return otroEmpleado.zonasDeOperacionesCerradas().any({zona => self.cerroOperacionEn(zona)})
    }

    method concretoOperacionReservadaPor(otroEmpleado){
        return operacionesCerradas.any({operacionConcretada => otroEmpleado.hizoReservaDe(operacionConcretada)})
    }

    method cerroOperacionEn(unaZona) = self.zonasDeOperacionesCerradas().contains(unaZona)
    

    method hizoReservaDe(unaOperacion) = reservas.contains(unaOperacion)
    

    method zonasDeOperacionesCerradas() = operacionesCerradas.map({operacion => operacion.zona()}).withoutDuplicates()

}