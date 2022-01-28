<?php 
	
	//Incluimos el archivo PHP donde se hace la conexion a la base de datos 
	
	include 'Conectar.php';

	//Se reciben los datos obtenidos en el formulario y se almacenan en las siguientes variables...
	$nombre = strtoupper($_POST["nombre"]);
	$apellido = strtoupper($_POST["apellido"]);
	$celular = $_POST["celular"];
	$telefono = $_POST["telefono"];
	$email = $_POST["email"];
	$usuario = $_POST["usuario"];
	$contrasena = $_POST["contrasena"];
	$pass = md5($contrasena);
	$contrasena2 = $_POST["concontrasena"];
    $pass2 = md5($contrasena2);
	//inserta los datos en la tabla
    
    $comprobar = "SELECT alias_usuario FROM tab_usuariosedu WHERE alias_usuario='$usuario'";
    $rescompro = pg_query($comprobar,$con);
    $total = pg_num_rows($rescompro);
    if($total>0){
    	echo "Nombre de usuario no disponible";
    	exit();
    }
    $comprobar = "SELECT email_usuario FROM tab_usuariosedu WHERE email_usuario='$email'";
    $rescompro = pg_query($comprobar,$con);
    $total = pg_num_rows($rescompro);
    if($total>0){
    	echo "Correo no disponible";
    	exit();
    }
     if($pass === $pass2)  { 
     	$insertar = "INSERT INTO tab_usuariosedu VALUES ('$usuario','$nombre','$apellido','$celular','$telefono','$email','$pass')";
}else{
 	 echo"<script>alert('Las contraseñas no coinciden');
          </script>";
	 }
	//ejecutamos la consulta
	$ins=pg_query($insertar);
	if (!$ins){
		echo 'Error en el registro';
	} else {
		echo ' Registro Exitoso, Bienvenido '.($nombre).' '.($apellido);
	}

	//Cerrar conexion
	pg_close($con);

 ?>