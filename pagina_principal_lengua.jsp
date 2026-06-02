<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. RECOGEMOS EL ROL CORRECTO QUE DEFINIMOS EN EL REGISTRO
    String rol = (String) session.getAttribute("usuarioTipo");
    
    // 2. SEGURIDAD: SI EL USUARIO NO HA INICIADO SESIÓN, LO MANDAMOS AL LOGIN
    if (rol == null) {
        response.sendRedirect("login_lengua.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Página Principal - Lengua y Literatura (Segundo de básica)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <main class="main-container">
        <header>
            <img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma"/>
            <h1>Lengua y Literatura. Segundo de básica</h1>
            <h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidades linguisticas a través de juegos e imágenes interactivas</h2>
            
            <nav>
                <%
                if (rol != null && rol.equalsIgnoreCase("administrador")) { %>
                    <a href="pagina_administrador.jsp" class="active">Página del administrador</a>
                    <a href="gestion_usuarios.jsp">Gestión de usuarios</a>
                    <a href="bitacora.jsp">Bitácoras</a>
                <% } else { %>
                    <a href="contenido_materia.jsp" class="active">Contenido de la materia</a>
                <% } %>
                <a href="gestion_usuarios.jsp?accion=cerrar_sesion">Cerrar sesión</a>
            </nav>
        </header>
        
        <div class="content container my-5">
            <section class="container my-5 text-center">
                <h2 class="display-4 fw-bold text-primary mb-4">Sea bienvenido a esta página</h2>
                
                <div class="mb-5 d-flex justify-content-center">
                    <img src="imagenes/bienvenida_pagina_principal.jpg" class="img-fluid rounded-4 shadow-sm" style="max-width: 800px; width: 100%; height: auto;" alt="Ilustración infantil de bienvenida" />
                </div>
                
                <div class="row g-4 mt-5 text-start">
                    <article class="col-md-6">
                        <div class="card h-100 p-4 border-success border-2 shadow-sm rounded-4 bg-light d-flex flex-column justify-content-between">
                            <h3 class="fw-bold text-success mb-3 fs-3 text-center">¿Qué pueden hacer los administradores?</h3>
                            <p class="fs-5 text-muted text-center">
                                Los administradores podrán controlar la seguridad y el buen funcionamiento del espacio digital, gestionando las cuentas de los 
                                usuarios registrados, supervisar la bitácora del sistema de manera detallada y validar o aprobar los movimientos que realizan 
                                los estudiantes en las actividades lúdicas.
                            </p>
                            <div class="text-center mt-4">
                                <img src="imagenes/panel_administrador.jpg" class="img-fluid" style="max-height: 250px; height: 250px; width: auto; object-fit: contain;" alt="Administrador" />
                            </div>
                        </div>
                    </article>
                    
                    <article class="col-md-6">
                        <div class="card h-100 p-4 border-info border-2 shadow-sm rounded-4 bg-light d-flex flex-column justify-content-between">
                            <h3 class="fw-bold text-info mb-3 fs-3 text-center">¿Qué pueden hacer los estudiantes?</h3>
                            <p class="fs-5 text-muted text-center">
                                Los estudiantes podrán explorar el maravilloso mundo del lenguaje de forma muy divertida, a través del acceso a 
                                lecciones interactivas, audios interactivos y divertidos juegos desarrollados en H5P para aprender a leer y escribir jugando
                                en nuestro entorno interactivo.
                            </p>
                            <div class="text-center mt-4">
                                <img src="imagenes/panel_estudiante.png" class="img-fluid" style="max-height: 250px; height: 250px; width: auto; object-fit: contain;" alt="Estudiante" />
                            </div>
                        </div>
                    </article>
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