<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    // CONTROL DE ACCESO: Valida que solo los estudiantes que iniciaron sesión puedan ingresar
    String rolUsuario = (String) session.getAttribute("usuarioTipo");
    if (rolUsuario == null || !rolUsuario.equalsIgnoreCase("alumno")) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
    String nombreAlumno = (session.getAttribute("usuarioNombre") != null) ? session.getAttribute("usuarioNombre").toString() : "Invitado";
%>    

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Contenido de la materia - Lengua y Literatura (Segundo de básica)</title>
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
				<a href="pagina_principal_lengua.jsp">Volver a la página principal</a>
				<a href="login_lengua.jsp">Cerrar sesión</a>
			</nav>
		</header>
		
		<div class="content">
			<section class="container text-center my-4">
			
				<h2 class="fw-bold my-3">Bienvenido, Alumno <%= nombreAlumno %></h2>
				
				<div class="d-flex justify-content-center mb-5">
					<div class="border p-2 bg-white rounded shadow-sm" style="width: 250px; height: 250px; border-style: dashed !important;">
						<img src="imagenes/bienvenida_materia.gif" alt="GIF de bienvenida" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
					</div>
				</div>
			
				<!-- UNIDAD 1 -->
				<article class="p-4 border rounded bg-white shadow-sm mb-4 mx-auto text-start" style="max-width: 1000px;">
					<div class="row align-items-center">
						<div class="col-md-7">
							<h3 class="fw-bold text-primary mb-3 text-center">UNIDAD 1: El verbo. Palabras que indican acciones.</h3>
							<ul class="list-unstyled ms-3">
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 1:</strong> ¿Qué es una acción?</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 2:</strong> Verbos que terminan en "-AR"</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 3:</strong> ¿Qué realiza la acción?</span></li>
							</ul>
						</div>
						<div class="col-md-5 d-flex justify-content-center">
							<div class="border p-2 bg-light w-100 text-center rounded" style="height: 180px; border-style: dashed !important;">
								<img src="imagenes/unidad_1.gif" alt="GIF Unidad 1" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
							</div>
						</div>
					</div>
				</article>
				
				<!-- UNIDAD 2 -->
				<article class="p-4 border rounded bg-white shadow-sm mb-4 mx-auto text-start" style="max-width: 1000px;">
					<div class="row align-items-center">
						<div class="col-md-5 d-flex justify-content-center">
							<div class="border p-2 bg-light w-100 text-center rounded" style="height: 180px; border-style: dashed !important;">
								<img src="imagenes/unidad_2.gif" alt="GIF Unidad 2" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
							</div>
						</div>
						<div class="col-md-7 ps-md-5">
							<h3 class="fw-bold text-primary mb-3 text-center">UNIDAD 2: Aprendiendo a conjugar los verbos en presente.</h3>
							<ul class="list-unstyled ms-3">
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 1:</strong> Yo, Tú, Él, Ella.</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 2:</strong> Nosotros, Vosotros, Ellos.</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 3:</strong> Jugando con las terminaciones.</span></li>
							</ul>
						</div>
					</div>
				</article>
				
				<!-- UNIDAD 3 -->
				<article class="p-4 border rounded bg-white shadow-sm mb-5 mx-auto text-start" style="max-width: 1000px;">
					<div class="row align-items-center">
						<div class="col-md-7">
							<h3 class="fw-bold text-primary mb-3 text-center">UNIDAD 3: Construyendo frases divertidas.</h3>
							<ul class="list-unstyled ms-3">
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 1:</strong> Mis acciones en la escuela.</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 2:</strong> Lo que hacemos en familia y con amigos.</span></li>
								<li class="h5 mb-2"><span class="fw-normal">* <strong>TEMA 3:</strong> Completando nuestras propias historias.</span></li>
							</ul>
						</div>
						<div class="col-md-5 d-flex justify-content-center">
							<div class="border p-2 bg-light w-100 text-center rounded" style="height: 180px; border-style: dashed !important;">
								<img src="imagenes/unidad_3.gif" alt="GIF Unidad 3" class="w-100 h-100 object-fit-contain" onerror="this.style.display='none';">
							</div>
						</div>
					</div>
				</article>
				
				<div class="mb-5">
					<a href="unidad_1.jsp" class="btn btn-primary btn-lg px-5 fw-bold shadow-sm">
						Empezar
					</a>
				</div>
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