<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.plataforma.conexion.ConexionBD" %>
<%@ page import="java.sql.ResultSet" %>

<%! 
    public void registrarBitacora(ConexionBD bd, String usuario, String accion) {
        String sql = "INSERT INTO bitacora (fecha_hora, nombre_usuario, accion) VALUES (NOW(), '" + usuario + "', '" + accion + "')";
        bd.Ejecutar(sql);
    }
%>

<%
    String mensajeResultado = (request.getAttribute("resultado") != null) ? request.getAttribute("resultado").toString() : "";
	String accion = request.getParameter("accion");
	boolean esCerrarSesion = "cerrar_sesion".equals(accion);
	
	if (esCerrarSesion) {
        ConexionBD bdCierre = new ConexionBD();
        // Obtenemos el correo del usuario (asegúrate de que en el login guardes session.setAttribute("usuario", correo))
        String correoActual = (session.getAttribute("usuario") != null) ? session.getAttribute("usuario").toString() : null;

        if (correoActual != null) {
            bdCierre.Ejecutar("UPDATE usuarios SET estado = 'inactivo' WHERE correo = '" + correoActual + "'");
            
            registrarBitacora(bdCierre, correoActual, "Cierre de sesión");
        }
        
        session.invalidate();
        
        out.clear();
        response.sendRedirect("login_lengua.jsp");
        return; 
    }
	
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        ConexionBD bd = new ConexionBD();
        String sql = "";

        if ("registrar".equals(accion)) {
            String nombreCompleto = request.getParameter("txt_nombre");
            String edad = request.getParameter("txt_edad");
            String pais = request.getParameter("txt_pais");
            String tipo = request.getParameter("rd_tipo");
            String correo = request.getParameter("txt_correo");
            String clave = request.getParameter("txt_clave");

            String nombre = "";
            String apellido = "";
            if (nombreCompleto != null && nombreCompleto.contains(" ")) {
                nombre = nombreCompleto.substring(0, nombreCompleto.indexOf(" "));
                apellido = nombreCompleto.substring(nombreCompleto.indexOf(" ") + 1);
            } else {
                nombre = nombreCompleto;
                apellido = " ";
            }
            
            sql = "INSERT INTO usuarios (nombre, apellido, edad, pais, correo, clave, rol, estado) " +
                  "VALUES ('" + nombre + "', '" + apellido + "', " + edad + ", '" + pais + "', '" + correo + "', '" + clave + "', '" + tipo + "', 'activo')";
            
            if (bd.Ejecutar(sql).contains("exito")) {
                registrarBitacora(bd, "admin_jorge", "Registro de nuevo usuario");
                mensajeResultado = "registro_ok";
            }
        } 
        else if ("actualizar".equals(accion)) {
            String correo = request.getParameter("txt_correo");
            String nombreCompleto = request.getParameter("txt_nombre");
            String edad = request.getParameter("txt_edad");
            String pais = request.getParameter("txt_pais");
            String tipo = request.getParameter("rd_tipo");
            
            String nombre = "";
            String apellido = "";
            if (nombreCompleto != null && nombreCompleto.contains(" ")) {
                nombre = nombreCompleto.substring(0, nombreCompleto.indexOf(" "));
                apellido = nombreCompleto.substring(nombreCompleto.indexOf(" ") + 1);
            } else {
                nombre = nombreCompleto;
                apellido = " ";
            }

            sql = "UPDATE usuarios SET nombre = '" + nombre + "', apellido = '" + apellido + "', " +
                  "edad = " + edad + ", pais = '" + pais + "', rol = '" + tipo + "' " +
                  "WHERE correo = '" + correo + "'";
            
            if (bd.Ejecutar(sql).contains("exito")) {
                registrarBitacora(bd, "admin_jorge", "Actualizar usuario");
                mensajeResultado = "actualizar_ok";
            }
        }
        else if ("bloquear".equals(accion)) {
            sql = "UPDATE usuarios SET estado = 'bloqueado' WHERE correo = '" + request.getParameter("txt_correo") + "'";
            if (bd.Ejecutar(sql).contains("exito")) {
                registrarBitacora(bd, "admin_jorge", "Bloquear usuario");
                mensajeResultado = "bloquear_ok";
            }
        }
        else if ("desbloquear".equals(accion)) {
            sql = "UPDATE usuarios SET estado = 'activo' WHERE correo = '" + request.getParameter("txt_correo") + "'";
            if (bd.Ejecutar(sql).contains("exito")) {
                registrarBitacora(bd, "admin_jorge", "Desbloquear usuario");
                mensajeResultado = "desbloquear_ok";
            }
        }
        else if ("buscar".equals(accion)) {
            String correo = request.getParameter("txt_buscar_correo");
            sql = "SELECT * FROM usuarios WHERE correo = '" + correo + "'";
            ResultSet rs = bd.Consulta(sql);
            
            if (rs != null && rs.next()) {
                request.setAttribute("nombre_encontrado", rs.getString("nombre") + " " + rs.getString("apellido"));
                request.setAttribute("edad_encontrado", rs.getString("edad"));
                request.setAttribute("pais_encontrado", rs.getString("pais"));
                request.setAttribute("tipo_encontrado", rs.getString("rol"));
                request.setAttribute("correo_encontrado", rs.getString("correo"));
                
                registrarBitacora(bd, "admin_jorge", "Buscar usuario");
                mensajeResultado = "buscar_ok";
            } else {
                mensajeResultado = "buscar_error";
            }
        }
        else if ("consultar".equals(accion)) {
            sql = "SELECT estado FROM usuarios WHERE correo = '" + request.getParameter("txt_consultar_correo") + "'";
            ResultSet rs = bd.Consulta(sql);
            if (rs != null && rs.next()) {
                request.setAttribute("estado_consultado", rs.getString("estado"));
                registrarBitacora(bd, "admin_jorge", "Consultar usuario");
                mensajeResultado = "consultar_ok";
            } else {
                mensajeResultado = "consulta_error";
            }
        }
        else if ("limpiar".equals(accion)) {
            registrarBitacora(bd, "admin_jorge", "Limpiar campos");
        }
        
        request.setAttribute("resultado", mensajeResultado);
    }
%>

<% if (!esCerrarSesion) { %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Gestion de usuarios - Lengua y Literatura (Segundo de básica)</title>
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
				<a href="pagina_administrador.jsp">Página del administrador</a>
				<a href="pagina_principal_lengua.jsp">Volver a la página principal</a>
				<a href="bitacora.jsp">Bitácoras</a>
				<a href="gestion_usuarios.jsp?accion=cerrar_sesion">Cerrar sesión</a>
			</nav>
		</header>
		
		<div class="content container my-5 d-flex justify-content-center">
			<section class="w-100" style="max-width: 1150px;">					
				<article class="card p-5 shadow-sm border-primary border-2 rounded-4 bg-light">
					<h3 class="fw-bold text-dark text-center mb-5 display-6">Registro de nuevos usuarios</h3>
					
					<form id="formGestionUsuarios" action="gestion_usuarios.jsp" method="POST" class="px-md-4">
						
						<input type="hidden" id="inputAccion" name="accion" value="">
					
						<div class="row mb-4 align-items-center">
							<label for="txt_nombre" class="col-sm-4 col-form-label fs-4 fw-bold text-end">Nombre:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-lg border-2 rounded-3" id="txt_nombre" name="txt_nombre" value="<%= (request.getAttribute("nombre_encontrado") != null) ? request.getAttribute("nombre_encontrado") : "" %>" placeholder="Ingrese nombre completo">
							</div>
						</div>
						
						<div class="row mb-4 align-items-center">
							<label for="txt_edad" class="col-sm-4 col-form-label fs-4 fw-bold text-end">Edad:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-lg border-2 rounded-3" id="txt_edad" name="txt_edad" value="<%= (request.getAttribute("edad_encontrado") != null) ? request.getAttribute("edad_encontrado") : "" %>" placeholder="(número) años">
							</div>
						</div>
						
						<div class="row mb-4 align-items-center">
							<label for="txt_pais" class="col-sm-4 col-form-label fs-4 fw-bold text-end">País:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control form-control-lg border-2 rounded-3" id="txt_pais" name="txt_pais" value="<%= (request.getAttribute("pais_encontrado") != null) ? request.getAttribute("pais_encontrado") : "" %>" placeholder="Ingrese el país">
							</div>
						</div>
						
						<div class="row mb-4 align-items-center">
							<span class="col-sm-4 fs-4 fw-bold text-end">Tipo de usuario:</span>
							<div class="col-sm-8 d-flex gap-4">
								<div class="form-check fs-5">
									<input class="form-check-input border-2" type="radio" name="rd_tipo" id="us_alumno" value="Alumno" <%= "Alumno".equals(request.getAttribute("tipo_encontrado")) ? "checked" : "" %>>
									<label class="form-check-label text-muted" for="us_alumno">Alumno</label>
								</div>
								<div class="form-check fs-5">
									<input class="form-check-input border-2" type="radio" name="rd_tipo" id="us_administrador" value="Administrador" <%= "Administrador".equals(request.getAttribute("tipo_encontrado")) ? "checked" : "" %>>
									<label class="form-check-label text-muted" for="us_administrador">Administrador</label>
								</div>
							</div>
						</div>
						
						<div class="row mb-4 align-items-center">
							<label for="txt_correo" class="col-sm-4 col-form-label fs-4 fw-bold text-end">Correo Electrónico:</label>
							<div class="col-sm-8">
								<input type="email" class="form-control form-control-lg border-2 rounded-3" id="txt_correo" name="txt_correo" value="<%= (request.getAttribute("correo_encontrado") != null) ? request.getAttribute("correo_encontrado") : "" %>" placeholder="ejemplo@correo.com">
							</div>
						</div>
						
						<div class="row mb-5 align-items-center">
							<label for="txt_clave" class="col-sm-4 col-form-label fs-4 fw-bold text-end">Contraseña:</label>
							<div class="col-sm-8">
								<input type="password" class="form-control form-control-lg border-2 rounded-3" id="txt_clave" name="txt_clave" placeholder="********">
							</div>
						</div>
						
						<div class="d-flex flex-row gap-2 justify-content-between align-items-center mt-2 pb-2" style="overflow-x: auto; white-space: nowrap;">
							<button type="button" onclick="ejecutarAccion('registrar')" class="btn btn-primary fw-bold px-3 py-2 rounded-3 shadow-sm">Ingresar nuevo usuario</button>
							<button type="button" data-bs-toggle="modal" data-bs-target="#modalBuscar" class="btn btn-info text-white fw-bold px-3 py-2 rounded-3 shadow-sm">Buscar usuario</button>
							<button type="button" onclick="ejecutarAccion('actualizar')" class="btn btn-primary fw-bold px-3 py-2 rounded-3 shadow-sm">Actualizar usuario</button>
							<button type="button" data-bs-toggle="modal" data-bs-target="#modalConsultar" class="btn btn-info text-white fw-bold px-3 py-2 rounded-3 shadow-sm">Consultar usuario</button>
							<button type="button" onclick="ejecutarAccion('bloquear')" class="btn btn-secondary fw-bold px-3 py-2 rounded-3 shadow-sm">Bloquear usuario</button>
							<button type="button" onclick="ejecutarAccion('desbloquear')" class="btn btn-secondary fw-bold px-3 py-2 rounded-3 shadow-sm">Desbloquear usuario</button>
							<button type="button" onclick="limpiarFormulario()" class="btn btn-outline-secondary fw-bold px-3 py-2 rounded-3 shadow-sm">Limpiar campos</button>
						</div>
					</form>
				</article>
			</section>
		</div>
		
		<footer>
			<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
			<p>Todos los derechos reservados. 2026</p>
		</footer>
	</main>
	
	<div class="modal fade" id="modalBuscar" tabindex="-1" aria-labelledby="modalBuscarLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-info rounded-4">
				<div class="modal-header bg-info text-white rounded-top-3">
					<h5 class="modal-title fw-bold" id="modalBuscarLabel">Buscar Usuario por Correo</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="gestion_usuarios.jsp" method="POST">
					<input type="hidden" name="accion" value="buscar">
					<div class="modal-body p-4">
						<p class="text-muted">Ingrese el correo electrónico del usuario que desea buscar en el sistema:</p>
						<input type="email" id="txt_buscar_correo" name="txt_buscar_correo" class="form-control border-2 form-control-lg" placeholder="ejemplo@correo.com" required>
					</div>
					<div class="modal-footer bg-light">
						<button type="button" class="btn btn-secondary rounded-3" data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-info text-white fw-bold rounded-3">Buscar</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalConsultar" tabindex="-1" aria-labelledby="modalConsultarLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content border-2 border-info rounded-4">
	            <div class="modal-header bg-info text-white rounded-top-3">
	                <h5 class="modal-title fw-bold" id="modalConsultarLabel">Consultar Estado de Usuario</h5>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <form action="gestion_usuarios.jsp" method="POST">
	                <input type="hidden" name="accion" value="consultar">
	                
	                <div class="modal-body p-4">
	                    <p class="text-muted">Estado actual de la cuenta:</p>
	                    <div class="alert alert-primary">
	                        <strong><%= (request.getAttribute("estado_consultado") != null) ? request.getAttribute("estado_consultado") : "No consultado" %></strong>
	                    </div>
	                    <hr>
	                    <p class="text-muted">Ingrese el correo electrónico para verificar el estado de conexión actual:</p>
	                    <input type="email" id="txt_consultar_correo" name="txt_consultar_correo" class="form-control border-2 form-control-lg" placeholder="ejemplo@correo.com" required>
	                </div>
	
	                <div class="modal-footer bg-light">
	                    <button type="button" class="btn btn-secondary rounded-3" data-bs-dismiss="modal">Cerrar</button>
	                    <button type="submit" class="btn btn-info text-white fw-bold rounded-3">Consultar Estado</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>

	<div class="modal fade" id="modalIngresoExitoso" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-success rounded-4">
				<div class="modal-header bg-success text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Registro Completado</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-success" style="font-size: 3rem;">✓</div>
					<p class="fs-5 text-dark fw-semibold mb-0">¡El usuario se registró con éxito! El usuario recién ingresado también se ve reflejado en la base de datos correspondiente.</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-success fw-bold px-4 rounded-3" data-bs-dismiss="modal">Entendido</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalActualizarExitoso" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-success rounded-4">
				<div class="modal-header bg-success text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Actualización Exitosa</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-success" style="font-size: 3rem;">✓</div>
					<p class="fs-5 text-dark fw-semibold mb-0">¡El usuario se actualizó con éxito! También se ven reflejados los cambios en la base de datos correspondiente.</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-success fw-bold px-4 rounded-3" data-bs-dismiss="modal">Entendido</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalBloquearExitoso" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-secondary rounded-4">
				<div class="modal-header bg-secondary text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Cuenta Inactiva</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-secondary" style="font-size: 3rem;">🛈</div>
					<p class="fs-5 text-dark fw-semibold mb-0">¡El usuario se bloqueó con éxito!</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-secondary fw-bold px-4 rounded-3" data-bs-dismiss="modal">Entendido</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalDesbloquearExitoso" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-secondary rounded-4">
				<div class="modal-header bg-secondary text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Cuenta Restaurada</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-secondary" style="font-size: 3rem;">🛈</div>
					<p class="fs-5 text-dark fw-semibold mb-0">¡El usuario se desbloqueó con éxito!</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-secondary fw-bold px-4 rounded-3" data-bs-dismiss="modal">Entendido</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalBuscarError" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-danger rounded-4">
				<div class="modal-header bg-danger text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Búsqueda Sin Resultados</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-danger" style="font-size: 3rem;">✕</div>
					<p class="fs-5 text-dark fw-semibold mb-0">El correo electrónico ingresado no se encuentra registrado en el sistema. Verifique e intente nuevamente.</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-danger fw-bold px-4 rounded-3" data-bs-dismiss="modal">Regresar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalConsultaError" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-2 border-danger rounded-4">
				<div class="modal-header bg-danger text-white rounded-top-3">
					<h5 class="modal-title fw-bold">Error de Consulta</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4 text-center">
					<div class="mb-3 text-danger" style="font-size: 3rem;">✕</div>
					<p class="fs-5 text-dark fw-semibold mb-0">No se pudo obtener el estado del usuario solicitado. La cuenta podría no existir o encontrarse suspendida temporalmente.</p>
				</div>
				<div class="modal-footer bg-light justify-content-center">
					<button type="button" class="btn btn-danger fw-bold px-4 rounded-3" data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>
        function ejecutarAccion(tipoAccion) {
            document.getElementById('inputAccion').value = tipoAccion;
            document.getElementById('formGestionUsuarios').submit();
        }

        function limpiarFormulario() {
            // Limpiar campos visuales
            document.getElementById('txt_nombre').value = '';
            document.getElementById('txt_edad').value = '';
            document.getElementById('txt_pais').value = '';
            document.getElementById('txt_correo').value = '';
            document.getElementById('txt_clave').value = '';
            document.getElementById('us_alumno').checked = false;
            document.getElementById('us_administrador').checked = false;
            document.getElementById('txt_nombre').focus();

            // Enviar la acción 'limpiar' al servidor para bitácora
            document.getElementById('inputAccion').value = 'limpiar';
            document.getElementById('formGestionUsuarios').submit();
        }

        document.addEventListener("DOMContentLoaded", function() {
            var resultado = "<%= mensajeResultado %>";
            if(resultado !== "") {
                var modalId = "";
                if(resultado === "registro_ok") modalId = "#modalIngresoExitoso";
                else if(resultado === "actualizar_ok") modalId = "#modalActualizarExitoso";
                else if(resultado === "bloquear_ok") modalId = "#modalBloquearExitoso";
                else if(resultado === "desbloquear_ok") modalId = "#modalDesbloquearExitoso";
                else if(resultado === "buscar_error") modalId = "#modalBuscarError";
                else if(resultado === "consulta_error") modalId = "#modalConsultaError";
                else if(resultado === "consultar_ok") modalId = "#modalConsultar";
                
                if(modalId !== "") {
                    var miModal = new bootstrap.Modal(document.querySelector(modalId));
                    miModal.show();
                }
            }
        });
    </script>
</body>
</html>
<% } %>