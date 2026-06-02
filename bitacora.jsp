<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.plataforma.conexion.ConexionBD" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // CONTROL DE ACCESO ACTIVO: Valida que solo el administrador pueda ver esta pantalla
    String rolUsuario = (String) session.getAttribute("usuarioTipo");
	if (rolUsuario == null || !rolUsuario.equalsIgnoreCase("administrador")) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
%>

<%
    if ("true".equals(request.getParameter("ajax"))) {
        ConexionBD bd = new ConexionBD();
        ResultSet rs = bd.Consulta("SELECT fecha_hora, nombre_usuario, accion FROM public.bitacora ORDER BY fecha_hora DESC");
        while (rs != null && rs.next()) {
%>
            <tr>
                <td><%= rs.getString("fecha_hora") %></td>
                <td class="fw-bold text-primary"><%= rs.getString("nombre_usuario") %></td>
                <td class="text-start ps-3"><%= rs.getString("accion") %></td>
            </tr>
<%
        }
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
				<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma interactiva de Lengua y Literatura para segundo de básica"/>
				<h1>Lengua y Literatura. Segundo de básica</h1>
				<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidadeslinguisticas a través de juegos e imágenes interactivas</h2>
			
				<nav aria-label="Menú de control del Admin">
					<a href="pagina_principal_lengua.jsp">Volver a la pagina principal</a>
					<a href="gestion_usuarios.jsp">Gestion de usuarios</a>
					<a href="gestion_usuarios.jsp?accion=cerrar_sesion">Cerrar sesión</a>
				</nav>
			</header>
			
			<div class="content">
				<section>
					<article>
						<h3>Bitacora del administrador</h3>
						<div class="table-responsive my-4">
							<table class="table table-striped table-bordered align-middle text-center">
								<thead class="table-dark">
									<tr>
										<th scope="col" style="width: 30%;">Fecha y hora</th>
										<th scope="col" style="width: 30%;">Usuario</th>
										<th scope="col" style="width: 40%;">Acción realizada</th>
									</tr>
								</thead>
								<tbody id="tablaBitacoraDatos">
									<%
										try {
											ConexionBD bd = new ConexionBD();
											String sql = "SELECT fecha_hora, nombre_usuario, accion FROM public.bitacora ORDER BY fecha_hora DESC";
											ResultSet rs = bd.Consulta(sql);
											
											boolean tieneRegistros = false;
											if (rs != null) {
												while (rs.next()) {
													tieneRegistros = true;
													String fecha = rs.getString("fecha_hora");
													String usuario = rs.getString("nombre_usuario");
													String accion = rs.getString("accion");
									%>
													<tr>
														<td><%= fecha %></td>
														<td class="fw-bold text-primary"><%= usuario %></td>
														<td class="text-start ps-3"><%= accion %></td>
													</tr>
									<%
												}
												rs.close();
											}
											
											if (!tieneRegistros) {
									%>
												<tr>
													<td colspan="3" class="text-muted">No se han registrado interacciones en la bitácora todavía.</td>
												</tr>
									<%
											}
										} catch (Exception e) {
									%>
											<tr>
												<td colspan="3" class="text-danger fw-bold">Error en la conexión: <%= e.getMessage() %></td>
											</tr>
									<%
										}
									%>
								</tbody>
							</table>
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
	    <script>
	        function actualizarTabla() {
	            fetch('bitacora.jsp?ajax=true') 
	                .then(response => response.text())
	                .then(data => {
	                    document.getElementById('tablaBitacoraDatos').innerHTML = data;
	                })
	                .catch(error => console.error('Error al actualizar:', error));
	        }
	        // Esta línea es la que hace que la función se ejecute cada 5 segundos
	        setInterval(actualizarTabla, 5000); 
	    </script>
	</body>
</html>