<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Respuesta - Lengua y Literatura (Segundo de básica)</title>
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
					<a href="index_lengua.jsp">Volver al inicio</a>
					<a href="acerca_de_nosotros_lengua.jsp">Acerca de nosotros</a>
				</nav>
			</header>
			
			<div class="content">
				<section class="container my-5 d-flex justify-content-center">					
					<article class="card p-5 shadow-sm border-primary border-3 rounded-4 bg-light text-center" style="max-width: 750px; width: 100%;">
						
						<h3 class="fw-bold text-success mb-3 fs-1">¡¡¡¡Registro Exitoso!!!!</h3>
						
						<h3 class="fw-bold text-secondary mb-4 fs-3">
							Gracias por registrarte, <%= request.getParameter("txt_nombre") != null ? request.getParameter("txt_nombre") : "" %>
						</h3>
						
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">Edad:</span> <%= request.getParameter("txt_edad") != null ? request.getParameter("txt_edad") : "" %> años
						</h4>
						
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">País:</span> <%= request.getParameter("txt_pais") != null ? request.getParameter("txt_pais") : "" %>
						</h4>
						
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">Tipo de usuario:</span> 
							<% 
								String rol = request.getParameter("rd_tipo_usuario");
								if(rol != null && rol.equals("estudiante")) { out.print("Alumno"); }
								else if(rol != null) { out.print("Administrador"); }
							%>
						</h4>
						
						<h4 class="mb-4 fs-4 text-dark fw-medium">
							<span class="fw-bold">Correo Electrónico:</span> <%= request.getParameter("txt_correo") != null ? request.getParameter("txt_correo") : "" %>
						</h4>
						
						<div class="mt-3">
							<a href="login_lengua.jsp" class="btn btn-primary btn-lg fw-bold px-4 rounded-3 shadow-sm" style="min-width: 260px;">Volver al ingreso de sesión</a>
						</div>
					</article>
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