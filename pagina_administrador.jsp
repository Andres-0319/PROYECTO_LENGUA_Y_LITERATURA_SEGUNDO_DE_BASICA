<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.plataforma.conexion.ConexionBD" %>
<%@ page import="java.sql.ResultSet" %>
<%
    // 1. Verificamos que exista una sesión activa
    String rol = (String) session.getAttribute("usuarioTipo");
    
    // 2. Si no hay sesión o no es administrador, bloqueamos el acceso
    if (rol == null || !rol.equalsIgnoreCase("administrador")) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Página del administrador - Lengua y Literatura (Segundo de básica)</title>
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
				<a href="gestion_usuarios.jsp">Gestión de usuarios</a>
				<a href="bitacora.jsp">Bitácoras</a>
				<a href="gestion_usuarios.jsp?accion=cerrar_sesion">Cerrar sesión</a>
			</nav>
		</header>
		
		<div class="content container text-center my-5">
			<section class="w-100">
			<h2 class="display-5 fw-bold text-primary mb-4">Bienvenido, Administrador</h2>
			<div class="mb-5 d-flex justify-content-center">
				<img src="imagenes/bienvenida_administrador.png" class="img-fluid rounded-4 shadow-sm" style="max-width: 750px; width: 100%; height: auto;" alt="Banner de control y monitoreo administrativo" />
			</div>
				<article class="card p-4 shadow-sm border-primary border-2 rounded-4 bg-light">
					
					<h3 class="fw-bold text-primary mb-4 text-center">Reporte de los 5 mejores puntajes</h3>
					
					<div class="table-responsive">
						<table class="table table-hover align-middle">
							
							<thead class="table-primary text-center">
								<tr>
									<th>Nombre del Estudiante</th>
									<th>Edad</th>
									<th>País</th>
									<th>Calificación alcanzada</th>
								</tr>
							</thead>
							<tbody class="text-center text-muted fs-5">
                                <%
                                    try {
                                        ConexionBD bd = new ConexionBD();
                                        // Consulta a la tabla calificaciones con los nombres de columnas actualizados
                                        String sql = "SELECT nombre_estudiante, edad, pais, calificacion_alcanzada FROM calificaciones ORDER BY calificacion_alcanzada DESC LIMIT 5";
                                        ResultSet rs = bd.Consulta(sql);
                                        
                                        boolean hayDatos = false;
                                        while (rs != null && rs.next()) {
                                            hayDatos = true;
                                %>
                                            <tr>
                                                <td><%= rs.getString("nombre_estudiante") %></td>
                                                <td><%= rs.getInt("edad") %></td>
                                                <td><%= rs.getString("pais") %></td>
                                                <td><%= rs.getDouble("calificacion_alcanzada") %></td>
                                            </tr>
                                <%
                                        }
                                        if (!hayDatos) {
                                            out.println("<tr><td colspan='4'>No hay calificaciones registradas aún.</td></tr>");
                                        }
                                        rs.close();
                                    } catch (Exception e) {
                                        out.println("<tr><td colspan='4' class='text-danger'>Error al cargar los datos: " + e.getMessage() + "</td></tr>");
                                    }
                                %>
                            </tbody>
						</table>							
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