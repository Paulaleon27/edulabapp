function validar(){
	var nombre, apellido, celular, telefono, email, usuario, contrasena, concontrasena, expresion;
	nombre = document.getElementById("nombre").value;
	apellido = document.getElementById("apellido").value;
	celular = document.getElementById("celular").value;
	telefono = document.getElementById("telefono").value;
	email = document.getElementById("email").value;
	usuario = document.getElementById("usuario").value;
	contrasena = document.getElementById("contrasena").value;
	concontrasena = document.getElementById("concontrasena").value;

	expresion = /\w+@\w+\.+[a-z]/;

	if (nombre ==="" || apellido === "" || celular == "" || telefono === "" || email === "" || 
		usuario === "" || contrasena === "" || concontrasena === "") {
		alert("Todos los campos son obligatorios");
		return false;
	}
	else if (nombre.length>50){
		alert ("Tu nombre supera el numero de caracteres permitidos");
		return false;
	}

	else if (apellido.length>50){
		alert ("Tu apellido supera el numero de caracteres permitidos");
		return false;
	}

	else if (celular.length>10 || celular.length < 10){
		alert ("Numero invalido");
		return false;
	}
	else if (telefono.length>7){
		alert ("Teléfono invalido");
		return false;
	}

	else if (email.length>70){
		alert ("Tu email supera el número de caracteres permitidos");
		return false;
	}

	else if (usuario.length>30){
		alert ("Elige un nombre de usuario más corto");
		return false;
	}
	else if (isNaN(celular)){
		alert ("Número de celular invalido");
		return false;
	}
	else if (isNaN(telefono)){
		alert ("Número de teléfono invalido");
		return false;
	}
	else if (expresion.test(correo)){
		alert ("Correo invalido");
		return false;
	}
	/*if ((contrasena) !== (concontrasena)){
		alert ("Las Contrasenas no coinciden");
		return false;
	}*/


}