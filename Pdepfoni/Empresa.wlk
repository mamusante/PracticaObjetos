class EmpresaDeTelefonia{
  const precioPorMB
  const precioFijo
  const precioPorSegundo
}

object pdepfoni inherits EmpresaDeTelefonia(precioPorMB = 0.1, precioFijo = 1, precioPorSegundo = 0.05){

    method precioPorMB() = precioPorMB

    method precioFijo() = precioFijo

    method precioPorSegundo() = precioPorSegundo
}