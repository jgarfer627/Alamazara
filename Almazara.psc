Subproceso PedirCosecheros(datosCosecheros Por Referencia,numCosecheros,Localidades)
    Definir i como entero;
	Para i<-0 hasta numCosecheros-1 Hacer
		Escribir "Introduzca los datos del cosechero",i;
		Escribir Sin Saltar "NIF( 8 cifras mas una letra)";
		Leer datosCosecheros[i,0];
		Escribir "";
		Escribir Sin Saltar "Nombre y Apellidos";
		Leer datosCosecheros[i,1];
		datosCosecheros[i,2]<-localidades[mostrarLocalidades(Localidades,5)];
		datosCosecheros[i,3]<-"0";
		datosCosecheros[i,4]<-"0";
	FinPara
FinSubProceso

Funcion  localidad <- mostrarLocalidades(localidades_ ,num_localidades)
	Definir i Como Entero;
	Definir localidad Como Entero;
	Escribir Sin Saltar "Localidades: ";
	Para i<-0 hasta num_localidades-2 hacer
		Escribir Sin Saltar i,".-",localidades_[i],",";
	FinPara
	Escribir i,".-",localidades_[i];
	Escribir "Escriba un numero";
	Leer localidad;
FinSubProceso

Funcion DniCorrecto<-EncontradoDni(dni,datosCosecheros,numCosecheros)
	Definir i como entero;
	Definir DniCorrecto Como Logico;
	DniCorrecto<-falso;
	Para i<-0 hasta numCosecheros-1 Hacer
		Si(dni=datosCosecheros[i,0]) entonces
			DniCorrecto<-verdadero;
			i<-numCosecheros;
		FinSi
	FinPara
FinFuncion

SubProceso PedirAportaciones(datosCosecheros,numCosecheros,aportaciones Por Referencia,numAportaciones Por Referencia)
	Definir i Como Entero;
	Definir dni Como Caracter;
	Definir DniCorrecto Como Logico;
	Definir numaAportaciones como Entero;
	i<-0;
	Repetir
		DniCorrecto<-falso;
		Escribir "Introduzca el numero de Kg( Introduza un 0 para terminar el proceso de insercci?n de datos):";
		Leer aportaciones[i,1];
		Si (aportaciones[i,1]<>"0") Entonces
			Repetir 
				si (no DniCorrecto) Entonces
					Escribir "Introduzca de nuevo el DNI";
				sino	
					Escribir "Introduzca el DNI del Cosechero";
				FinSi
				Leer dni;
				DniCorrecto<-EncontradoDni(dni,datosCosecheros,numCosecheros);
			Hasta Que (DniCorrecto)
			aportaciones[i,0]<-dni;
			Escribir "Introduzca el rendimiento: ";
			Leer aportaciones[i,2];
		FinSi
		i<-i+1;
	Hasta Que ((aportaciones[i-1,1]="0") o i=100);
	Si (aportaciones[i-1,1]="0") Entonces
		i<-i-1;
	FinSi
	numAportaciones<-i;
FinSubProceso

Proceso Almazara
	Definir Localidades Como Caracter;
	Dimension Localidades(100);
	Definir numCosecheros,numAportaciones,i Como Entero;
	Definir datosCosecheros Como Caracter;
	Dimension datosCosecheros(100,5);//Dni,Nombre,localidad,TotalKg,TotalAceite
	Definir aportaciones Como Caracter;
	Dimension aportaciones(100,3);
	Definir DniCorrecto Como Logico;
	Definir dni Como Caracter;
	Definir Precio como Real;
	Definir Finalziar Como Caracter;
	
	Localidades[0]<-"Martos";
	Localidades[1]<-"Porcuna";
	Localidades[2]<-"Siles";
	Localidades[3]<-"Villacarrillo";
	Localidades[4]<-"Mancha Real";
	Localidades[5]<-"Torres";
	numAportaciones<-0;
	Escribir "                    Gestion de una Almazara";
	Escribir "============================================================";
		Escribir "Numero de cosecheros?(Introduzca un entero)";
	Leer numCosecheros;
	PedirCosecheros(datosCosecheros,numCosecheros,Localidades);
	PedirAportaciones(datosCosecheros,numCosecheros,aportaciones,numAportaciones);
	Escribir "Introduzca el precio del Aceite: ";
	Leer Precio;
	leer Finalziar;
FinProceso
