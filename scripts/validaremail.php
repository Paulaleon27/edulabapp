<?php
include("Conectar.php");

	function generarLinkTemporal($email){

		$contrasena = sha1($email);
		
 		
		$sql = "INSERT INTO tab_usuariosedu (email_email VALUES($email,'$contrasena',NOW());";

		$consulta = $conexion->query($sql);
		if($consulta){
			$enlace = $_SERVER["SERVER_NAME"].'/pass/restablecer.php?email='.sha1($email).'&token='.$token;
			return $enlace;
		}
		else
			return FALSE;
	}

	function enviarEmail( $email, $link ){

		$mensaje = '<html>
		<head>
 			<title>Restablece tu contraseña</title>
		</head>
		<body>
 			<p>Hemos recibido una petición para restablecer la contraseña de tu cuenta.</p>
 			<p>Si hiciste esta petición, haz clic en el siguiente enlace, si no hiciste esta petición puedes ignorar este correo.</p>
 			<p>
 				<strong>Enlace para restablecer tu contraseña</strong><br>
 				<a href="'.$link.'"> Restablecer contraseña </a>
 			</p>
		</body>
		</html>';

		$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
		$cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		$cabeceras .= 'From: Codedrinks <mimail@codedrinks.com>' . "\r\n";
		
		mail($email, "Recuperar contraseña", $mensaje, $cabeceras);
	}
	
	$email = $_POST['email'];
	$respuesta = new stdClass();

	if( $email != "" ){   
   		include("Conectar.php");

   		$sql = " SELECT * FROM users WHERE email = '$email' ";
   		$consulta = $conexion->query($sql);

   		if($consulta->num_rows > 0){
      		$email = $consulta->fetch_assoc();
			$linkTemporal = generarLinkTemporal( $email['id'], $email['username'] );
      		if($linkTemporal){
        		enviarEmail( $email, $linkTemporal );
        		$respuesta->mensaje = '<div class="alert alert-info"> Un correo ha sido enviado a su cuenta de email con las instrucciones para restablecer la contraseña </div>';
      		}
   		}
   		else
   			$respuesta->mensaje = '<div class="alert alert-warning"> No existe una cuenta asociada a ese correo. </div>';
	}
	else
   		$respuesta->mensaje= "Debes introducir el email de la cuenta";
 	echo json_encode( $respuesta );

 	?>