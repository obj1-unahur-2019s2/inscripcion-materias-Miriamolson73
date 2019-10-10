/** First Wollok example */
class Estudiantes{
	var property nombre 
	var property carrera
	var property aprobaciones=[]
	method registrarAprobacion(materia,nota){
		if (self.estaAprobada(materia)){self.error("YA TIENE REGISTRADA LA APROBACION DE LA MATERIA")}
		else {
		aprobaciones.add(new Aprobacion(materia=materia,nota=nota))
		}	
	}
	method materiasAprobadas(){
		return aprobaciones.map({alu=>alu.materia()})
	}	
	method notasDeMaterias(){
		return aprobaciones.map({alu=>alu.nota()})
	}
	method estaAprobada(materia){return 
		self.materiasAprobadas().any({alu=>alu.materia()==(materia)})
	}	
	method promedioDeMateriasAprobadas(){
		return self.sumaDeNotas()/self.notasDeMaterias().size()
	}	
	method sumaDeNotas(){return self.notasDeMaterias().sum({alu=>alu.nota()})}
	
	method cantidadDeMateriasAprobadas(){return self.materiasAprobadas().size()}
}
class Aprobacion{
	var property materia
	var property nota	
	
}



