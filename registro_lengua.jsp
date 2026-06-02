<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.plataforma.conexion.ConexionBD" %>

<% 
    String mensaje_alerta = ""; String tipo_alerta = ""; 
    String nombre = ""; String apellido = ""; 
    
    if(request.getParameter("btn_registrar") != null){
        String nombreCompleto = request.getParameter("txt_nombre") != null ? request.getParameter("txt_nombre").trim() : "";
        String edadStr = request.getParameter("txt_edad");
        String pais = request.getParameter("txt_pais");
        String tipo_usuario = request.getParameter("rd_tipo_usuario");
        String correo = request.getParameter("txt_correo");
        String clave = request.getParameter("txt_clave");
        
        // Procesamiento de nombre y apellido
        if(!nombreCompleto.isEmpty()){
            int primerEspacio = nombreCompleto.indexOf(" ");
            if(primerEspacio != -1){
                nombre = nombreCompleto.substring(0, primerEspacio).trim();
                apellido = nombreCompleto.substring(primerEspacio).trim();
            } else { nombre = nombreCompleto; apellido = "S/A"; }
        }
        
        // Validaciones
        if(correo == null || !correo.contains("@")){
            mensaje_alerta = "Por favor, ingrese un correo válido";
            tipo_alerta = "danger";
        } else if (clave == null || clave.length() < 8){
            mensaje_alerta = "La contraseña debe tener un mínimo de 8 caracteres";
            tipo_alerta = "danger";
        } else {
            try {
                int edad = Integer.parseInt(edadStr);
                boolean edad_valida = true;
                
                if(tipo_usuario.equals("administrador") && edad < 18){
                    mensaje_alerta = "Lo sentimos. El administrador debe ser mayor a 18 años";
                    tipo_alerta = "danger";
                    edad_valida = false;
                }
                
                if(edad_valida){
                    ConexionBD con = new ConexionBD();
                    String sqlUsuario = "INSERT INTO usuarios (nombre, apellido, edad, pais, correo, clave, rol, estado) " +
                                        "VALUES ('" + nombre + "', '" + apellido + "', " + edad + ", '" + pais + "', '" + correo + "', '" + clave + "', '" + tipo_usuario + "', 'activo')";
                    
                    String resUsuario = con.Ejecutar(sqlUsuario);
                    
                    if(resUsuario != null && (resUsuario.contains("exito") || resUsuario.contains("éxito"))){
                        // GUARDAR EN SESIÓN PARA VALIDACION.JSP
                        session.setAttribute("usuarioNombre", nombre + " " + apellido);
                        session.setAttribute("usuarioEdad", edadStr);
                        session.setAttribute("usuarioPais", pais);
                        session.setAttribute("usuarioCorreo", correo);
                        session.setAttribute("usuarioTipo", tipo_usuario);
                        
                        // REDIRECCIÓN AUTOMÁTICA
                        response.sendRedirect("validacion.jsp");
                        return; 
                    } else {
                        mensaje_alerta = "Error al guardar en la base de datos: " + resUsuario;
                        tipo_alerta = "danger";
                    }
                }
            } catch (Exception e) {
                mensaje_alerta = "Por favor, ingrese una edad numérica válida";
                tipo_alerta = "danger";
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Registro - Lengua y Literatura (Segundo de básica)</title>
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
                <article class="card p-5 shadow-sm border-primary border-3 rounded-4 bg-light" style="max-width: 750px; width: 100%;">
                    <h3 class="fw-bold text-primary mb-4 fs-2 text-center">Registro de nuevos usuarios</h3>
                    
                    <% if(!mensaje_alerta.equals("")){ %>
                        <div class="alert alert-<%= tipo_alerta %> text-center fw-bold">
                            <%= mensaje_alerta %>
                        </div>
                    <% } %>
                    
                    <form action="registro_lengua.jsp" method="POST" style="display: block;">
                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">Nombre:</label>
                            <div class="col-sm-8"><input type="text" name="txt_nombre" class="form-control form-control-lg border-2" required></div>
                        </div>
                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">Edad:</label>
                            <div class="col-sm-8"><input type="number" name="txt_edad" class="form-control form-control-lg border-2" required></div>
                        </div>
                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">País:</label>
                            <div class="col-sm-8"><input type="text" name="txt_pais" class="form-control form-control-lg border-2" required></div>
                        </div>
                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">Tipo de usuario:</label>
                            <div class="col-sm-8 d-flex gap-4">
                                <input class="form-check-input border-2" type="radio" name="rd_tipo_usuario" value="estudiante" checked> Estudiante
                                <input class="form-check-input border-2" type="radio" name="rd_tipo_usuario" value="administrador"> Administrador
                            </div>
                        </div>
                        <div class="row mb-3 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">Correo Electrónico:</label>
                            <div class="col-sm-8"><input type="email" name="txt_correo" class="form-control form-control-lg border-2" required></div>
                        </div>
                        <div class="row mb-4 align-items-center">
                            <label class="col-sm-4 h4 fw-bold text-secondary text-end">Contraseña:</label>
                            <div class="col-sm-8"><input type="password" name="txt_clave" class="form-control form-control-lg border-2" required></div>
                        </div>
                        
                        <div class="mt-5 d-flex justify-content-center gap-3">
						    <button type="submit" name="btn_registrar" class="btn btn-info text-white btn-lg fw-bold px-5">Registrarse</button>
						    <button type="reset" class="btn btn-warning text-white btn-lg fw-bold px-5">Limpiar Campos</button>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>