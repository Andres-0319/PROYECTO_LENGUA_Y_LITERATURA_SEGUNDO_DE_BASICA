<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // CONTROL DE ACCESO: Solo alumnos pueden acceder
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
	<title>Unidad 2 - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
	<script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>
	
	</head>
	<body>
		<main class="main-container">
			<header>
				<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma"/>
				<h1>Lengua y Literatura. Segundo de básica</h1>
				<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidadeslinguisticas a través de juegos e imágenes interactivas</h2>
			
				<nav>
					<a href="pagina_principal_lengua.jsp">Volver a la página principal</a>
					<a href="unidad_1.jsp">Unidad 1</a>
					<a href="contenido_materia.jsp">Contenidos de la materia</a>
					<a href="login_lengua.jsp">Cerrar sesión</a>
				</nav>
			</header>
			
			<div class="content">
				<section class="container text-center my-4">
				
					<h2 class="fw-bold text-primary my-3">Unidad 2: Aprendiendo a conjugar los verbos en presente.</h2>
					
					<div class="d-flex justify-content-center mb-5">
						<div class="border p-2 bg-white rounded shadow-sm" style="width: 320px; height: 200px; border-style: dashed !important;">
							<img src="imagenes/unidad_2.gif" alt="GIF decorativo de la unidad" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
						</div>
					</div>
				
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema1" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-7">
								<h4 class="fw-bold text-success mb-3 text-center">Tema 1: Yo, Tú, Él, Ella.</h4>
								<p class="parrafo-interactivo fs-5">¡Es hora de hablar de nosotros mismos y de nuestros amigos! Cuando hacemos algo en este momento, usamos 
								palabras especiales. Por ejemplo, <strong class="verbo-dinamico">YO</strong> juego con la pelota, <strong class="verbo-dinamico">
								TÚ</strong> corres muy rápido en el patio, y <strong class="verbo-dinamico">ÉL</strong> o <strong class="verbo-dinamico">ELLA
								</strong> salta de felicidad.</p>
							</div>
							<div class="col-md-5 d-flex justify-content-center">
								<div class="border p-2 bg-light w-100 text-center rounded" style="height: 240px; border-style: dashed !important;">
									<video src="videos/video_unidad_2.mp4" controls class="w-100 h-100 object-fit-contain" style="outline: none;" onerror="this.style.display='none';">
									</video>
								</div>
							</div>
						</div>
					</article>
					
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema2" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-5 d-flex justify-content-center align-items-center">
								<div class="border p-2 bg-light w-100 text-center rounded d-flex justify-content-center align-items-center" style="height: 240px; border-style: dashed !important;">
									<model-viewer src="3d/3d_unidad_2.glb" 
									              class="w-100 h-100 object-fit-contain" 
									              camera-controls 
									              autoplay 
									              animation-name="jump"
									              scale="0.05 0.05 0.05"
									              camera-target="0% 120% 0%"
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
								<h4 class="fw-bold text-success mb-3 text-center">Tema 2: Nosotros, Vosotros, Ellos.</h4>
								<p class="parrafo-interactivo fs-5">¡Cuando somos muchos amigos, las palabras cambian mágicamente! Si nos unimos, decimos: 
								¡<strong class="verbo-dinamico">NOSOTROS</strong> cantamos a coro! Si hablas con tus compañeros dices 
								<strong class="verbo-dinamico">VOSOTROS</strong>, y si miras a un grupo jugar a lo lejos dirás <strong class="verbo-dinamico">
								ELLOS</strong> ríen a carcajadas.</p>
							</div>
						</div>
					</article>
					
					<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start tarjeta-tema3" style="max-width: 1000px;">
						<div class="row align-items-center">
							<div class="col-md-7">
								<h4 class="fw-bold text-success mb-3 text-center">Tema 3: Jugando con las terminaciones.</h4>
								<p class="parrafo-interactivo fs-5">¿Te has fijado en cómo terminan las palabras cuando cambias de amiguito? Es un juego divertido de 
								sonidos. Yo cant<strong class="verbo-dinamico">-O</strong> en el salón, tú cant<strong class="verbo-dinamico">-AS</strong> 
								muy bonito, y nosotros cant<strong class="verbo-dinamico">-AMOS</strong> juntos. ¡Las terminaciones son como pistas musicales!</p>
							</div>
							<div class="col-md-5 d-flex justify-content-center align-items-center">
								<div class="border p-4 bg-light w-100 d-flex flex-column justify-content-center align-items-center rounded" style="height: 240px; border-style: dashed !important;">
									<audio src="audio/audio_unidad_2.mp3" controls class="w-100" style="outline: none;" onerror="this.style.display='none';">
									</audio>
									
								</div>
							</div>
						</div>
					</article>
					
					<div class="mb-5">
						<a href="unidad_3.jsp" class="btn btn-primary btn-lg px-5 fw-bold shadow-sm">
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