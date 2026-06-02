<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Acerca de nosotros - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
	
	</head>
	<body>
		<main class="main-container">
			<header>
				<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma interactiva de Lengua y Literatura para segundo de básica"/>
				<h1>Lengua y Literatura. Segundo de básica</h1>
				<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidadeslinguisticas a través de juegos e imágenes interactivas</h2>
				<nav aria-label="Menú de navegación secundario">
					<a href="index_lengua.jsp">Volver al inicio</a>
					<a href="login_lengua.jsp">Login</a>
				</nav>
			</header>
			
			<div class="content">
				<section class="container my-5" style="max-width: 900px;">
					<article class="card p-4 shadow-sm border-primary border-3 rounded-4 bg-light text-center mb-4">
						<h3 class="fw-bold text-primary mb-3 fs-2">Acerca de nosotros</h3>
						<div id="carouselExample" class="carousel slide rounded-3 overflow-hidden" data-bs-ride="carousel">
						    <div class="carousel-inner">
						        <div class="carousel-item active">
						            <img src="imagenes/imagen_nosotros_1.png" class="d-block w-100" style="height: 480px; object-fit: cover;" alt="Niño en una computadora">
						        </div>
						        <div class="carousel-item">
						            <img src="imagenes/imagen_nosotros_2.png" class="d-block w-100" style="height: 480px; object-fit: cover;" alt="Niñas aprendiendo a escribir">
						        </div>
						        <div class="carousel-item">
						            <img src="imagenes/imagen_nosotros_3.png" class="d-block w-100" style="height: 480px; object-fit: cover;" alt="Niño aprendiendo a escribir">
						        </div>
						    </div>
						    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
						        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						        <span class="visually-hidden">Previous</span>
						    </button>
						    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
						        <span class="carousel-control-next-icon" aria-hidden="true"></span>
						        <span class="visually-hidden">Next</span>
						    </button>
						</div>
					</article>
					
					<article class="card p-4 shadow-sm border-success border-3 rounded-4 bg-light text-center mb-4">
						<h3 class="fw-bold text-success fs-3 mb-2">Misión</h3>
						<p class="text-muted fs-5 m-0">La misión de esta página web es brindar a los niños de segundo de básica un entorno digital amigable e interactivo 
						que despierte su amor por las letras, la lectura y la escritura, a través del uso de herramientas dinámicas que refuercen 
						su aprendizaje de forma amigable.</p>
					</article>
					
					<article class="card p-4 shadow-sm border-warning border-3 rounded-4 bg-light text-center mb-4">
						<h3 class="fw-bold text-success fs-3 mb-2">Visión</h3>
						<p class="text-muted fs-5 m-0">Convertirnos en una plataforma digital que brinde apoyo escolar en el área de Lengua y Literatura, para que sea reconocida 
						por transformar el estudio en una aventura lúdica e inolvidable para los estudiantes más pequeños.</p>
					</article>
					
					<article class="card p-4 shadow-sm border-info border-3 rounded-4 bg-light text-center">
						<h3 class="fw-bold text-success fs-3 mb-2">Valores</h3>
						<p class="text-muted fs-5 m-0">Nos fundamentamos en la alegría en el aprendizaje, el respeto mutuo, la seguridad digital, la creatividad compartida y el 
						fomento de la curiosidad innata en cada niño y niña.</p>
					</article>
				</section>
			</div>
			
			<!-- PIE DE LA PÁGINA -->
			<footer>
				<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
				<p>Todos los derechos reservados. 2026</p>
			</footer>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>