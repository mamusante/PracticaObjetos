class Inmobiliaria{

    const empleados = []

    method mejorEmpleadoSegun(criterio){
        empleados.max({empleado => criterio.valorParaElEmpleado(empleado)})
    }
}

class Criterio{

    method valorParaElEmpleado(unEmpleado)
}

object totalDeComisiones inherits Criterio{

    override method valorParaElEmpleado(unEmpleado) = unEmpleado.totalDeComisiones()
}

object cantidadDeOperacionesCerradas inherits Criterio{

    override method valorParaElEmpleado(unEmpleado) = unEmpleado.cantidadDeOperacionesCerradas()
}

object cantidadDeReservas inherits Criterio{

    override method valorParaElEmpleado(unEmpleado) = unEmpleado.cantidadDeReservas()
}