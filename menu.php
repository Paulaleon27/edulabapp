<?php
session_start();
if(!isset($_SESSION['usuario'])){ 
    header("Location:index.html");
}
?>
<!DOCTYPE html>
<html lang="es" class="no-js">

	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Prototipo | Edulab</title>
		<meta name="description" content="Responsive Retina-Friendly Menu with different, size-dependent layouts" />
		<meta name="keywords" content="responsive menu, retina-ready, icon font, media queries, css3, transition, mobile" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
		<link rel="shortcut icon" href="images/eduLab1.png" width="1000" height="1000">
	</head>
	<body>
		<div class="container">	
			<header>

				<h1>¡BIENVENIDO 

				<?php
					session_start();
					if(isset($_SESSION['usuario'])){ 
						echo $_SESSION['usuario']."!";
					}
				?>
				
				<span>Re-evolucionando la educación </span></h1>	
			</header>
			<div class="main clearfix">
				<nav id="menu" class="nav">					
					<ul>
						<li>
							<a href="#">
								<span class="icon">
									<i aria-hidden="true" class="icon-home"></i>
								</span>
								<span>Inicio</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="icon"> 
									<i aria-hidden="true" class="icon-services"></i>
								</span>
								<span>Tablas</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="icon">
									<i aria-hidden="true" class="icon-portfolio"></i>
								</span>
								<span>Estadísticas</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="icon">
									<i aria-hidden="true" class="icon-blog"></i>
								</span>
								<span>Configuración</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="icon">
									<i aria-hidden="true" class="icon-team"></i>
								</span>
								<span>Perfil</span>
							</a>
						</li>
						<li>
							<?php
								session_start();
								session_destroy();
							?>
							<a href="index.html">
								<span class="icon">
									<i aria-hidden="true" class="icon-contact"></i>
								</span>
								<span>Salir</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div><!-- /container -->
		<script>
			//  The function to change the class
			var changeClass = function (r,className1,className2) {
				var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
				if( regex.test(r.className) ) {
					r.className = r.className.replace(regex,' '+className2+' ');
			    }
			    else{
					r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"),' '+className1+' ');
			    }
			    return r.className;
			};	

			//  Creating our button in JS for smaller screens
			var menuElements = document.getElementById('menu');
			menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>');

			//  Toggle the class on click to show / hide the menu
			document.getElementById('menutoggle').onclick = function() {
				changeClass(this, 'navtoogle active', 'navtoogle');
			}

			// http://tympanus.net/codrops/2013/05/08/responsive-retina-ready-menu/comment-page-2/#comment-438918
			document.onclick = function(e) {
				var mobileButton = document.getElementById('menutoggle'),
					buttonStyle =  mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

				if(buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
					changeClass(mobileButton, 'navtoogle active', 'navtoogle');
				}
			}
		</script>
	</body>
</html>