import materias.*

class Estudiantes{
	var property nombre 
	var carreras=[]
	var property aprobaciones=[]
	var materiasInscriptas=[]
	method inscripcionAMaterias(materia){materiasInscriptas.add(materia)}
	method inscripcionACarrera(carrera){ carreras.add(carrera)}
	method puedeInscribirse(materia){return 
		not self.estaAprobada(materia) and self.materiaCorrespondeALaCarrera(materia) 
			and self.noEstaInscriptoAEsaMateria(materia) and self.tieneAprobadasLasMateriasRequisito(materia)
		
	}
	method inscribirAUnEstudiante(materia){
		if(self.puedeInscribirse(materia)){self.inscribir(materia)}
		else {self.error("NO SE PUEDE INSCRIBIR")}
	}
	method inscribir(materia){
		materia.inscribirAlumno(self)
	}
	method darDeBajaAUnaMateria(materia){
		materia.darDeBaja(self)
	}
	

		

/*Determinar si un estudiante puede inscribirse a una materia. Para esto se deben cumplir cuatro condiciones:*/
 	method materiaCorrespondeALaCarrera(materia){
   		return self.materiasDeLaCarreraInscripto().any({mate=>mate==materia}) }
   		
    //la materia debe corresponder a alguna de las carreras que esté cursando el estudiante,
    
    method noEstaInscriptoAEsaMateria(materia){
    	return materiasInscriptas.any({mat=>mat.materia()==materia})
    } 
    
    /*el estudiante no puede haber aprobado la materia previamente,
    el estudiante no debe estar estar ya inscripto en esa materia,*/
    method  tieneAprobadasLasMateriasRequisito(materia){
    	return materia.requisito().all({mat=>self.materiasAprobadas().contains(mat)})
    	
    }
  /*  el estudiante debe tener aprobadas todas las materias que se declaran como requisitos de la materia a la que se quiere inscribir.
    P.ej., para que un estudiante pueda inscribirse a Objetos 2, es necesario tener aprobadas Objetos 1 y Matemática 1.
*/
	method materiasEnListaDeEspera(){return
		self.materiasDeLaCarreraInscripto().filter({mat=>mat.estaEnLaListaDeEspera(self)})
		
	}	
	method materiasEnLasQueQuedoInscripto(){return
		self.materiasDeLaCarreraInscripto().filter({mat=>mat.estaCursando(self)})
	}
	
	
	
	method registrarAprobacion(materia,nota){
		if (self.estaAprobada(materia)){self.error("YA TIENE REGISTRADA LA APROBACION DE LA MATERIA")}
		else {
		aprobaciones.add(new Aprobacion(materia=materia,nota=nota))
		}	
	}
	method materiasDeLaCarreraInscripto(){ 
	//	return carreras.map({car=>car.materias()}).flatten
		return carreras.flatMap({car=>car.materias()})
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



object programacion{
	//Programación incluye, entre otras, estas materias: Elementos de Programación, Matemática 1, Objetos 1, Objetos 2, Objetos 3, Trabajo Final, Bases de Datos. 
	var property materias=[new Materia(nombre=eleDeProg),new Materia(nombre=mate1),new Materia(nombre=obj1),new Materia(nombre=obj2),new Materia(nombre=obj3),
		new Materia(nombre=trabFinal),new Materia(nombre=baseDeDatos)]
}
object medicina{
	//Medicina incluye Química, Biología 1, Biología 2, Anatomía General.
	var property materias=[new Materia(nombre=quimica),new Materia(nombre=bio1),new Materia(nombre=bio2),new Materia(nombre=anaGral)]
}
object derecho{
	//- Derecho incluye Latín, Derecho Romano, Historia del Derecho Argentino, Derecho Penal 1, Derecho Penal 2.
	var property materias=[new Materia(nombre=latin),new Materia(nombre=derechoRomano),new Materia(nombre=derArgentino),new Materia(nombre=penal1),new Materia (nombre=penal2)]
}

//Registrar una materia aprobada por un estudiante indicando la nota obtenida. Si el estudiante ya tiene registrada la aprobación de la materia, se debe lanzar un error.

//Saber para un estudiante: si tiene o no aprobada una materia, la cantidad de materias aprobadas, el promedio.

//Saber para un estudiante: la colección de materias de todas las carreras a las que está inscripto. P.ej. para Roque debe incluir todas las de programación y también todas las de medicina.
//Sugerencia: mirar el método flatten, p.ej. probar [[3,4],[6,8,2]].flatten().





