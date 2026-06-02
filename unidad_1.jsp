<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // CONTROL DE ACCESO: Solo alumnos pueden ver esta página
    String rolUsuario = (String) session.getAttribute("usuarioTipo");
    if (rolUsuario == null || !rolUsuario.equalsIgnoreCase("alumno")) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Unidad 1 - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
	<script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>
	
</head>
	<body>
		<main class="main-container">
			<header>
				<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma"/>
				<h1>Lengua y Literatura. Segundo de básica</h1>
				<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidades lingüísticas a través de juegos e imágenes interactivas</h2>
			
				<nav>
					<a href="pagina_principal_lengua.jsp">Volver a la página principal</a>
					<a href="contenido_materia.jsp">Contenidos de la materia</a>
					<a href="login_lengua.jsp">Cerrar sesión</a>
				</nav>
			</header>
			
			<div class="content">
				<section class="container text-center my-4">
				
					<h2 class="fw-bold text-primary my-3">Unidad 1: El verbo. Palabras que indican acciones.</h2>
					
					<div class="d-flex justify-content-center mb-5">
						<div class="border p-2 bg-white rounded shadow-sm" style="width: 320px; height: 200px; border-style: dashed !important;">
							<img src="imagenes/unidad_1.gif" alt="GIF decorativo de la unidad" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
						</div>
					</div>
				
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema1" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-7">
								<h4 class="fw-bold text-success mb-3 text-center">Tema 1: ¿Qué es una acción?</h4>
								<p class="parrafo-interactivo fs-5">¡Hola amiguito! Una <strong class="verbo-dinamico">acción</strong> es todo lo que podemos 
								hacer con nuestro cuerpo. Por ejemplo, cuando usas tus piernas para moverte rápido estás haciendo una acción divertida: ¡el 
								verbo <strong class="verbo-dinamico">BAILAR</strong>! Todas las cosas que haces en el día son acciones.</p>
							</div>
							<div class="col-md-5 d-flex justify-content-center">
								<div class="border p-2 bg-light w-100 text-center rounded" style="height: 240px; border-style: dashed !important;">
									<video src="videos/video_unidad_1.mp4" controls class="w-100 h-100 object-fit-contain" style="outline: none;" onerror="this.style.display='none';">
									</video>
								</div>
							</div>
						</div>
					</article>
					
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema2" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-5 d-flex justify-content-center">
								<div class="border p-2 bg-light w-100 text-center rounded" style="height: 240px; border-style: dashed !important;">
									<model-viewer src="3d/3d_unidad_1.glb" 
									              class="w-100 h-100 object-fit-contain" 
									              camera-controls 
									              autoplay 
									              animation-name="jump"
									              scale="0.05 0.05 0.05"
									              camera-target="0% 50% 0%"
									              camera-orbit="0deg 75deg auto"
									              min-camera-orbit="auto auto auto" 
									              max-camera-orbit="auto auto auto"
									              disable-pan
									              shadow-intensity="1" 
									              alt="Modelo 3D Interactivo - Verbos -AR" 
									              onerror="this.style.display='none';">
									</model-viewer>
								</div>
							</div>
							<div class="col-md-7 ps-md-5">
								<h4 class="fw-bold text-success mb-3 text-center">Tema 2: Verbos que terminan en "-AR"</h4>
								<p class="parrafo-interactivo fs-5">¿Sabías que a muchas acciones les gusta terminar con las letras <strong class="verbo-dinamico">
								-AR</strong>? ¡Es como un secreto musical! Mira estos ejemplos mágicos: Juguemos a <strong class="verbo-dinamico">
								CANTAR</strong> una linda canción, o vayamos a <strong class="verbo-dinamico">CAMINAR</strong> al parque.</p>
							</div>
						</div>
					</article>
					
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema3" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-7">
								<h4 class="fw-bold text-success mb-3 text-center">Tema 3: ¿Qué realiza la acción?</h4>
								<p class="parrafo-interactivo fs-5">Cada acción necesita un amiguito especial que la haga realidad. Las personas, los animales y 
								las cosas pueden realizar acciones. Si vemos a un lindo perrito en su habitación, la acción divertida que realiza es 
								<strong class="verbo-dinamico">ESTUDIAR</strong> su libro favorito.</p>
							</div>
							<div class="col-md-5 d-flex justify-content-center align-items-center">
								<div class="border p-4 bg-light w-100 d-flex flex-column justify-content-center align-items-center rounded" style="height: 240px; border-style: dashed !important;">
									<audio src="audio/audio_unidad_1.mp3" controls class="w-100" style="outline: none;" onerror="this.style.display='none';">
									</audio>
									
								</div>
							</div>
						</div>
					</article>
					
					<div class="mb-5">
						<a href="unidad_2.jsp" class="btn btn-primary btn-lg px-5 fw-bold shadow-sm">
							Siguiente >>
						</a>
					</div>
				</section>
			</div>
			
			<footer>
				<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
				<p>Todos los derechos reservados. 2026</p>
			</footer>
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>