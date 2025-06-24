class Actividad{
  const property idiomas = #{}
  method implicaEsfuerzo() = false
  method sirveParaBroncearse() = false
  method diasDeActividad()
  method esInteresante() = idiomas.size() > 1
}

class ViajeDePlaya inherits Actividad{
  const largo
  override method diasDeActividad() = largo / 500
  override method sirveParaBroncearse() = true
  override method implicaEsfuerzo() = largo > 1200
}
class ExcursionACiudad inherits Actividad{
  const atracciones 
  override method diasDeActividad() = atracciones / 2
  override method implicaEsfuerzo() = atracciones.between(5, 8)
  override method esInteresante() = super() || atracciones == 5
}
class ExcursionACuidadTropical inherits ExcursionACiudad{
  override method sirveParaBroncearse() = true
  override method diasDeActividad() = super() + 1
}
class SalidaDeTrekking inherits Actividad{
  const kilometros 
  const diasDeSol
  override method diasDeActividad() = kilometros / 50
  override method implicaEsfuerzo() = kilometros > 80
  override method sirveParaBroncearse () {
    return diasDeSol > 200 || (diasDeSol.between(100, 200) && kilometros > 120)
  }
  override method esInteresante() = super() && diasDeSol > 140
}
class ClaseDeGimnasia inherits Actividad{
  method initialize(){
    idiomas.clear()
    idiomas.add("español")
  }
  override method implicaEsfuerzo() = true
  override method diasDeActividad() = 1
}

class Socio{
  const property actividadesRealizadas = []
  const maximoDeActividades
  method initialize(){
    actividadesRealizadas.clear()
  }
  method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
  method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})
  method realizarActividad(unaActividad){
    if(maximoDeActividades == actividadesRealizadas.size()){
      self.error("el socio ya realizo el maximo de actividades")
    }
    actividadesRealizadas.add(unaActividad)
  }
}

