class Deporte{
    const diasQueRejuvenece

    method diasQueRejuvenece() = diasQueRejuvenece
}

object futbol inherits Deporte(diasQueRejuvenece = 1){}
object polo inherits Deporte(diasQueRejuvenece = 2){}
object waterpolo inherits Deporte(diasQueRejuvenece = polo.diasQueRejuvenece() * 2){}