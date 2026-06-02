<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Inicio - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<main class="main-container">
		<header>
			<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma"/>
			<h1>Lengua y Literatura. Segundo de básica</h1>
			<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidadeslinguisticas a través de juegos e imágenes interactivas</h2>
		
			<nav>
				<a href="acerca_de_nosotros_lengua.jsp">Acerca de nosotros</a>
				<a href="login_lengua.jsp">Login</a>
			</nav>
		</header>
		
		<!-- CONTENIDO PRINCIPAL CON TARJETAS SIMÉTRICAS -->
		<div class="content">
			<section class="container my-5">
				<div class="row justify-content-center g-4">
				
					<!-- PRIMER SUBTÍTULO -->
					<article class="w-100 mb-4">
						<div class="card shadow-sm border-success border-3 rounded-4 bg-light overflow-hidden">
							<div class="row g-0 align-items-center">
								<div class="col-md-7 p-5 text-center d-flex flex-column justify-content-center">
									<h3 class="card-title text-success fw-bold fs-2 mb-3">Explora el maravilloso mundo de las letras.</h3>
									<p class="card-text text-muted fs-5">Aprende sobre el maravilloso mundo de la Lengua y Literatura de forma divertida, a través de imágenes interactivas pensadas para ti.</p>
								</div>
								<div class="col-md-5">
									<img src="imagenes/imagen_index_1.png" alt="Niños aprendiendo" class="img-fluid w-100 h-100 bg-secondary-subtle" style="object-fit: cover; min-height: 250px;">
								</div>
							</div>
						</div>
					</article>
					
					<!-- SEGUNDO SUBTÍTULO -->
					<article class="w-100 mb-4">
						<div class="card shadow-sm border-warning border-3 rounded-4 bg-light overflow-hidden">
							<div class="row g-0 align-items-center">
								<div class="col-md-7 p-5 text-center d-flex flex-column justify-content-center">
									<h3 class="fw-bold text-warning fs-2 mb-3">Diviértete con Juegos interactivos.</h3>
									<p class="text-muted fs-5">Pon a prueba tus conocimientos a través del desarrollo de divertidas actividades en H5P. Juega y aprende al mismo tiempo.</p>
								</div>
								<div class="col-md-5">
									<img src="imagenes/imagen_index_2.png" alt="Niña descubriendo" class="img-fluid w-100 h-100 bg-secondary-subtle" style="object-fit: cover; min-height: 250px;">
								</div>
							</div>
						</div>
					</article>
					
					<!-- TERCER SUBTÍTULO -->
					<article class="w-100 mb-4">
						<div class="card shadow-sm border-info border-3 rounded-4 bg-light overflow-hidden">
							<div class="row g-0 align-items-center">
								<div class="col-md-7 p-5 text-center d-flex flex-column justify-content-center">
									<h3 class="card-title text-info fw-bold fs-2 mb-3">Tu espacio digital ideal.</h3>
									<p class="card-text text-muted fs-5">Un entorno seguro y amigable diseñado especialmente para niños de segundo de básica.</p>
								</div>
								<div class="col-md-5">
									<img src="imagenes/imagen_index_3.png" alt="Niño en computadora" class="img-fluid w-100 h-100 bg-secondary-subtle" style="object-fit: cover; min-height: 250px;">
								</div>
							</div>
						</div>
					</article>
					
				</div>
			</section>
		</div>
		
		<!-- PIE DE PÁGINA -->
		<footer>
			<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
			<p>Todos los derechos reservados. 2026</p>
		</footer>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>