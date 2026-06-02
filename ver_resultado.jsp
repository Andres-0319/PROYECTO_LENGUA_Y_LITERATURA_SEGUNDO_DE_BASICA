<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.plataforma.conexion.ConexionBD" %>
<%
    // Control de acceso
    String rolUsuario = (session.getAttribute("usuarioTipo") != null) ? session.getAttribute("usuarioTipo").toString() : "";
    if (!"Alumno".equals(rolUsuario)) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
    
    // Obtener datos del alumno
    String nombreUsuario = (session.getAttribute("usuarioNombre") != null) ? session.getAttribute("usuarioNombre").toString() : "";
    String edadUsuario = (session.getAttribute("usuarioEdad") != null) ? session.getAttribute("usuarioEdad").toString() : "";
    String paisUsuario = (session.getAttribute("usuarioPais") != null) ? session.getAttribute("usuarioPais").toString() : "";
    String correoUsuario = (session.getAttribute("usuarioCorreo") != null) ? session.getAttribute("usuarioCorreo").toString() : "No registrado";
    
    String estrellasParam = request.getParameter("estrellas");
    String calificacionFinal = "0.0";
    String mensajeBD = "";

    if (estrellasParam != null && !estrellasParam.isEmpty()) {
        try {
            int estrellas = Integer.parseInt(estrellasParam);
            double nota = (estrellas * 10.0) / 36.0;
            calificacionFinal = String.format("%.1f", nota);
            
            ConexionBD db = new ConexionBD();
            Connection conn = db.getConexion();
            PreparedStatement ps = null;

            try {
                String sql = "INSERT INTO calificaciones (nombre_estudiante, edad, pais, calificacion_alcanzada) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, nombreUsuario);
                ps.setInt(2, Integer.parseInt(edadUsuario));
                ps.setString(3, paisUsuario);
                ps.setDouble(4, Double.parseDouble(calificacionFinal.replace(",", "."))); 
                
                ps.executeUpdate();
                mensajeBD = "Datos guardados correctamente.";
            } finally {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
            
        } catch (Exception e) {
            mensajeBD = "Error en el procesamiento: " + e.getMessage();
            e.printStackTrace();
        }
    }
%>
  
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Ver resultado - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
	
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
				<section class="container text-center my-5">
					<!-- TARJETA DE RESULTADOS -->
					<article class="card mx-auto p-5 shadow-sm bg-white border border-primary border-3 rounded-4" style="max-width: 850px;">
						
						<h2 class="fw-bold mb-4">Nota de la evaluación: <span class="text-success"><%= calificacionFinal %></span></h2>
						<h4 class="text-secondary mb-4">(Basado en <%= (estrellasParam != null ? estrellasParam : "0") %> estrellas obtenidas de 36)</h4>
						<p class="text-muted"><%= mensajeBD %></p>
						
						<h3 class="mb-4 fw-bold text-start">Nombre del usuario: <span class="fw-normal text-secondary"><%= nombreUsuario %></span></h3>
						
						<h3 class="mb-4 fw-bold text-start">Edad: <span class="fw-normal text-secondary"><%= edadUsuario %></span></h3>
						
						<h3 class="mb-4 fw-bold text-start">País: <span class="fw-normal text-secondary"><%= paisUsuario %></span></h3>
						
						<h3 class="mb-5 fw-bold text-start">Correo Electrónico: <span class="fw-normal text-secondary"><%= correoUsuario %></span></h3>
						
						<div class="d-flex justify-content-center gap-4">
							<a href="pagina_principal_lengua.jsp" class="btn btn-primary btn-lg px-4 rounded-3 fw-bold shadow-sm">
								Volver a la página principal
							</a>
							
							<a href="cuestionario.jsp" class="btn btn-primary btn-lg px-4 rounded-3 fw-bold shadow-sm">
								Reintentar Cuestionario
							</a>
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