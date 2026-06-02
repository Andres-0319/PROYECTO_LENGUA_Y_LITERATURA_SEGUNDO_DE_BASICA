<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // REQUERIMIENTO DOCENTE: Control de acceso para que solo alumnos accedan al examen
    String rolUsuario = (String) session.getAttribute("usuarioTipo");
	if (rolUsuario == null || !rolUsuario.equalsIgnoreCase("alumno")) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
    
    // Extracción dinámica del nombre del estudiante para personalizar la bienvenida
    String nombreAlumno = (session.getAttribute("usuarioNombre") != null) ? session.getAttribute("usuarioNombre").toString() : "Estudiante";
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Cuestionario - Lengua y Literatura (Segundo de básica)</title>
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
				<a href="unidad_1.jsp">Unidad 1</a>
				<a href="unidad_2.jsp">Unidad 2</a>
				<a href="unidad_3.jsp">Unidad 3</a>
				<a href="contenido_materia.jsp">Contenidos de la materia</a>
				<a href="login_lengua.jsp">Cerrar sesión</a>
			</nav>
		</header>
		
		<div class="content">
			<section class="container text-center my-4">
				<h2 class="fw-bold my-4">¡A jugar y aprender, <%= nombreAlumno %>!</h2>
				
				<!-- GIF para entorno amigable infantil -->
				<div class="d-flex justify-content-center mb-4">
					<div class="border p-2 bg-white shadow-sm" style="max-width: 320px;">
						<img src="imagenes/bienvenida_cuestionario.gif" alt="Animación de saludo para niños" class="img-fluid">
					</div>
				</div>
				
				<div class="alert alert-info border border-primary shadow-sm mx-auto" style="max-width: 800px;">
				    <h4 class="alert-heading">Instrucciones:</h4>
				    <p>1. Completa las actividades hasta ver tu número total de estrellas (Ej: 36/36).</p>
				    <p>2. Presiona el botón <strong>"¡Ya terminé!"</strong> y registra tus estrellas.</p>
				</div>
				
				<!-- Bloque de actividad interactiva H5P -->
				<article class="p-3 border rounded bg-white shadow-sm mx-auto mb-4" style="max-width: 1120px;">
					<h4 class="text-muted mb-3">Complete la siguiente actividad. Recuerda todo lo que viste a lo largo de las clases de la asignatura.</h4>
					<div class="d-flex justify-content-center" style="overflow-x: auto;">
						<iframe src="https://h5p.org/h5p/embed/753653" width="1091" height="1372" frameborder="0" allowfullscreen="allowfullscreen" allow="geolocation *; microphone *; camera *; 
						midi *; encrypted-media *" title="CURSO ONLIVE A1-1 U3 verbos en AR"></iframe>
					</div>
					<script src="https://h5p.org/sites/all/modules/h5p/library/js/h5p-resizer.js" charset="UTF-8"></script>
				</article>
				
				<div class="text-center my-4">
				    <button type="button" class="btn btn-warning btn-lg" onclick="mostrarFormulario()">
				        ¡Ya terminé mis dos actividades!
				    </button>
				</div>
				
				<section id="seccionFinal" class="container text-center my-4" style="display:none;">
				    <div class="alert alert-warning border border-warning shadow-sm mx-auto" style="max-width: 800px;">
				        <h4 class="alert-heading">¡Muy bien!</h4>
				        <p>Ahora, escribe el número de estrellas (de 0 a 36) que obtuviste:</p>
				    </div>
				
				    <form id="formFinalizar" action="ver_resultado.jsp" method="GET" class="pb-5 mt-4">
				        <div class="mb-3">
				            <label for="estrellas" class="form-label fw-bold">Número de estrellas:</label>
				            <input type="number" id="estrellas" name="estrellas" class="form-control mx-auto text-center" 
				                   style="max-width: 200px; font-size: 1.5rem;" required min="0" max="36" placeholder="0">
				        </div>
				        <button type="submit" class="btn btn-primary btn-lg px-5 rounded-pill shadow">Enviar resultados</button>
				    </form>
				</section>
			</section>
		</div>
		
		<!-- PIE DE LA PÁGINA -->
		<footer>
			<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
			<p>Todos los derechos reservados. 2026</p>
		</footer>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>
	    function mostrarFormulario() {
	        document.getElementById('seccionFinal').style.display = 'block';
	        // Esto hace un pequeño scroll automático hacia el formulario
	        document.getElementById('seccionFinal').scrollIntoView({ behavior: 'smooth' });
	    }
	</script>
	
</body>
</html>