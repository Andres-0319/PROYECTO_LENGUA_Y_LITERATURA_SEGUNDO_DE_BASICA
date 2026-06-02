<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.plataforma.conexion.ConexionBD" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // LÓGICA DE PROCESAMIENTO DE LOGIN
    // Si llegan datos por POST, intentamos validar contra la base de datos
    if(request.getParameter("txt_correo") != null && request.getParameter("txt_clave") != null){
        String correo = request.getParameter("txt_correo");
        String clave = request.getParameter("txt_clave");
        
        ConexionBD con = new ConexionBD();
        String sql = "SELECT * FROM usuarios WHERE correo = '" + correo + "' AND clave = '" + clave + "'";
        ResultSet rs = con.Consulta(sql);
        
        if(rs != null && rs.next()){
            String estadoUsuario = rs.getString("estado");
            
            if ("bloqueado".equals(estadoUsuario)) {
                response.sendRedirect("login_lengua.jsp?error=bloqueado");
                return;
            }

            ConexionBD conEstado = new ConexionBD();
            conEstado.Ejecutar("UPDATE usuarios SET estado = 'activo' WHERE correo = '" + correo + "'");
            
            session.setAttribute("usuario", correo); 
            session.setAttribute("usuarioNombre", rs.getString("nombre") + " " + rs.getString("apellido"));
            session.setAttribute("usuarioEdad", rs.getString("edad"));
            session.setAttribute("usuarioPais", rs.getString("pais"));
            session.setAttribute("usuarioTipo", rs.getString("rol"));
            session.setAttribute("usuarioCorreo", rs.getString("correo"));
            
        } else {
            response.sendRedirect("login_lengua.jsp?error=datos_incorrectos");
            return;
        }
    }

    // Recuperamos los datos de la sesión (funcionará tanto para Registro como para Login)
    String nombreUsuario = (session.getAttribute("usuarioNombre") != null) ? session.getAttribute("usuarioNombre").toString() : "Usuario";
    String edadUsuario = (session.getAttribute("usuarioEdad") != null) ? session.getAttribute("usuarioEdad").toString() : "N/A";
    String paisUsuario = (session.getAttribute("usuarioPais") != null) ? session.getAttribute("usuarioPais").toString() : "N/A";
    String tipoUsuario = (session.getAttribute("usuarioTipo") != null) ? session.getAttribute("usuarioTipo").toString() : "N/A";
    String correoIngresado = (session.getAttribute("usuarioCorreo") != null) ? session.getAttribute("usuarioCorreo").toString() : "Sin correo";
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Validación - Lengua y Literatura (Segundo de básica)</title>
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
					<a href="index_lengua.jsp">Volver al inicio</a>
					<a href="acerca_de_nosotros_lengua.jsp">Acerca de nosotros</a>
				</nav>
			</header>
			
			<div class="content">
				<section class="container my-5 d-flex justify-content-center">		
					<!-- TARJETA QUE MUESTRA EL INGRESO DEL NUEVO USUARIO -->
					<article class="card p-5 shadow-sm border-primary border-3 rounded-4 bg-light text-center" style="max-width: 750px; width: 100%;">
						<h3 class="fw-bold text-success mb-3 fs-1">¡¡¡¡Ingreso Exitoso!!!!</h3>
						
						<!-- PARA LA BIENVENIDA -->
						<h3 class="fw-bold text-secondary mb-4 fs-3">
							Bienvenido, <%= nombreUsuario %>
						</h3>
						
						<!-- PARA LA EDAD -->
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">Edad:</span> <%= edadUsuario %> años
						</h4>
						
						<!-- PARA EL PAÍS -->
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">País:</span> <%= paisUsuario %>
						</h4>
						
						<!-- PARA EL TIPO DE USUARIO -->
						<h4 class="mb-3 fs-4 text-dark fw-medium">
							<span class="fw-bold">Tipo de usuario:</span> <%= tipoUsuario %>
						</h4>
						
						<!-- PARA EL CORREO ELECTRÓNICO -->
						<h4 class="mb-4 fs-4 text-dark fw-medium">
							<span class="fw-bold">Correo Electrónico:</span> <%= correoIngresado %>
						</h4>
						
						<!-- ME DEBE MANDAR A LA VENTANA DE pagina_principal_lengua.jsp -->
						<div class="mt-3">
							<a href="pagina_principal_lengua.jsp" class="btn btn-primary btn-lg fw-bold px-4 rounded-3 shadow-sm" style="min-width: 280px;">Continuar a la página principal</a>
						</div>
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