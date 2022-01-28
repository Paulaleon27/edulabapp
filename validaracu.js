function validar(){
	var id_acudiente, nom_acudiente, ape_acudiente, sexo_acudiente, edad_acudiente, cel_acudiente, email_acudiente,expresion ,seleccionado ;
	var seleccionado = false;

	id_acudiente = document.getElementById("cedula").value;
	nom_acudiente = document.getElementById("nombre").value;
	ape_acudiente = document.getElementById("apellido").value;
	sexo_acudiente = document.getElementById("check1").value;
	edad_acudiente = document.getElementById("edad").value;
	cel_acudiente = document.getElementById("celular").value;
	email_acudiente = document.getElementById("email").value;
	
	expresion = /\w+@\w+\.+[a-z]/;
	

	if (cedula ==="" || nombre === "" || apellido == "" || check1 === "" || edad === "" || 
		celular === "" || email === "" ) {
		alert("Todos los campos son obligatorios");
		return false;
	}
    else if (cedula.length>12){
		alert ("cedula invalido");
		return false;
	}	
	else if (isNaN(cedula)){
		alert ("Numero de cedula invalido");
		return false;

	else if (nombre.length>50){
		alert ("Tu nombre supera el numero de caracteres permitidos");
		return false;
	}
	else if (apellido.length>50){
		alert ("Tu apellido supera el numero de caracteres permitidos");
		return false;
	}
    var seleccionado = false;
        for(var i=0; i<check1.length; i++) {    
        if(check1[i].checked) {
        seleccionado = true;
        break;
    }
    }
    if(!seleccionado) {
    return false;
    }

    else if (edad.length>2 && edad.length < 2){
		alert ("Numero invalido");
		return false;
	}
	
    else if (isNaN(edad)){
		alert ("edad invalido");
		return false;
	}
	else if (celular.length>10 && celular.length < 10){
		alert ("Numero de celular invalido");
		return false;
	}
	
    else if (isNaN(celular)){
		alert ("Numero de celular invalido");
		return false;
	}

    else if (email.length>70){
		alert ("Tu email supera el numero de caracteres permitidos");
		return false;
	}
	}
    else if (expresion.test(correo)){
		alert ("correo invalido");
		return false;
	}
	if
}