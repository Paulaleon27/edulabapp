<?php
session_start();
$usuario =$_POST['usuario'];
$contrasena =$_POST['contrasena'];
$pass = md5($contrasena);
include("Conectar.php");
 
$consulta = pg_query("SELECT nick_nino, contrasena_nino FROM tab_ninosedu WHERE nick_nino ='$usuario' AND contrasena_nino ='$pass';")
 or die("Error en la consulta.". pg_last_error());
$result = pg_affected_rows($consulta);
if ($result=1){
		
	 	$_SESSION['usuario']=$usuario;
  		header("Location:../menu.php");
}else {
 		echo '<script language="javascript">alert("Nombre de usuario o clave incorrecta");
			  window.location.href="../Iniciar.html";
		 	  </script>';
	  }
pg_close($con);


	/*
	//obtenemos los datos de inicio de sesion
	$usuario = $_POST['usuario'];
	$contrasena = $_POST['contrasena'];

	include 'Conectar.php';
	//hacemos una consulta y la almacenamos en una variable

	$consulta = ("SELECT alias_usuario, pass_usuario FROM tab_usuarios WHERE alias_usuario = '$usuario' and pass_usuario = '$contrasena'");

	//ejecutamos la Consulta
	$resultado = pg_query($con,$consulta);

	//obtenemos el numero de filas afectadas
	$filas = pg_num_rows($resultado);

	//si el numero de filas encontradas en la consulta es mayor que cero entonces se redirecciona a la pagina

	if ($filas>0){
		header("location:https://www.google.com.co/");
		// donde esta el # es donde se escribe el nombre de la pagina a la que queremos redireccionar
	} else{
		echo 'Nombre de usuario invalido1';
	}

	//liberamos el resultado para que no consuma espacio en memoria
	pg_free_result($resultado);

	//cerramos la conexion
	pg_close($con);*/
?>