<?php 
	
	//Incluimos el archivo PHP donde se hace la conexion a la base de datos 
	
	include 'Conectar.php';


	//Se reciben los datos obtenidos en el formulario y se almacenan en las siguientes variables...
	$cedula = $_POST["cedula"];
	$nombre = $_POST["nombre"];
	$apellido = $_POST["apellido"];
	$edad = $_POST["check1"];
	$edad = $_POST["edad"];
	$celular = $_POST["celular"];
	$email = $_POST["email"];
	
	//inserta los datos en la tabla
    
    $comprobar = "SELECT id_acudiente FROM tab_acudientesedu WHERE id_acudiente='$cedula'";
    $rescompro = pg_query($comprobar,$con);
    $total = pg_num_rows($rescompro);
    if($total>0){
    	echo "el acudiente ya esta registrado";
    	exit();
    }

    $comprobar = "SELECT id_acudiente FROM tab_acudientesedu WHERE id_acudiente='$cedula'";
    $rescompro = pg_query($comprobar,$con);
    $total = pg_num_rows($rescompro);
    if($total>0){
    	echo "Correo no disponible";
    	exit();
    }
    
    $insertar = pg_query ("INSERT INTO tab_acudientesedu VALUES ('$cedula','$nombre','$apellido','$check1','$edad','$celular','$email')");

	//ejecutamos la consulta
	if (!$insertar){
		echo 'Error en el Registro';
	} else {
		echo "Registro Exitoso, Bienvenido ";
	}

	//Cerrar conexion
	pg_close($con);

 ?>