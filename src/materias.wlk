import example.*

class Materia{
	var property nombre
	var property requisitos=[]
	var property cupos
	var property alumnosEspera=[]
	var property alumnosCursando=[]
	method inscribirAlumno(alumno){
		if(cupos<self.alumnosCursando().size()){alumnosCursando.add(alumno)}
		else{alumnosEspera.add(alumno)			}
	}
			
	method darDeBaja(alumno){
	    alumnosCursando.remove(alumno)
	    alumnosCursando.add(alumnosEspera.first())
	    alumnosEspera.remove(alumnosEspera.first()) 
	    }
	    
	    	
	    
	method   estudiantesInscriptos(){
		return self.alumnosCursando()	}
		
		 
	method estudiantesListaEspera(){return self.alumnosEspera()}
		
	method estaEnListaDeEspera(alumno){return
		alumnosEspera.any({alu=>alu.nombre()==alumno.nombre()})
	}
    method estaCursando(alumno){return
    	alumnosCursando.any({alu=>alu.nombre()==alumno.nombre()})
    }
	
} 
	


object eleDeProg{}
object mate1{}
object obj1{}
object obj2{
	method requisitos(){return [obj1,mate1]}
	
}
object obj3{}
object trabFinal{}
object baseDeDatos{}
object quimica{}
object bio1{}
object bio2{}
object anaGral{}
object latin{}
object derechoRomano{}
object derArgentino{}
object penal1{}
object penal2{}
