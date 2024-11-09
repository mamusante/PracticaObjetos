class Discusion{
    const partido1
    const partido2

    method esBuena() = partido1.esBueno() and partido2.esBueno()

}

class Partido{
    const filosofo
    const argumentos = []

    method filosofo() = filosofo

    method esBueno() = filosofo.estaEnLoCorrecto() and self.tieneBuenosArgumentos()

    method tieneBuenosArgumentos() = self.cantidadDeArgumentosEnriquecedores() > self.cantidadDeArgumentos() / 2

    
    method cantidadDeArgumentos() = argumentos.size()

    method cantidadDeArgumentosEnriquecedores() = argumentos.count({argumento => argumento.esEnriquecedor()})


    
}

class Argumento {
    const naturalezas = []
    const property descripcion 

    method esEnriquecedor(){
        naturalezas.all({naturaleza => naturaleza.esEnriquecedora(descripcion)})
    }
}

class Naturaleza{
    method esEnriquecedora(unaDescripcion)
}

object estoica inherits Naturaleza{
    override method esEnriquecedora(unaDescripcion) = true
}

object moralista inherits Naturaleza{

    override method esEnriquecedora(unaDescripcion) = self.tieneAlMenosDiezPalabras(unaDescripcion)
    

    method tieneAlMenosDiezPalabras(unaDescripcion) = unaDescripcion.words() >= 10
    
}

object esceptica inherits Naturaleza {
    override method esEnriquecedora(unaDescripcion) = self.terminaEnSignoDePregunta(unaDescripcion)

    method terminaEnSignoDePregunta(texto) = texto.endsWith("?")
    
}

object cinica inherits Naturaleza {
    override method esEnriquecedora(unaDescripcion) = 30 > (1.randomUpTo(100))
}