<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Login - Lengua y Literatura (Segundo de básica)</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/estilos_lengua_y_literatura.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<main class="main-container">
		<!-- CABECERA PRINCIPAL -->
		<header>
			<img src="imagenes/logo_lengua_y_literatura.png" width="175" height="150" alt="Logo de la plataforma"/>
			<h1>Lengua y Literatura. Segundo de básica</h1>
			<h2>Un espacio digital amigable donde los niños puedan desarrollar sus habilidadeslinguisticas a través de juegos e imágenes interactivas</h2>
		
			<nav>
				<a href="index_lengua.jsp">Volver al inicio</a>
				<a href="acerca_de_nosotros_lengua.jsp">Acerca de nosotros</a>
			</nav>
		</header>
		
		<div class="content d-block">
			<section class="container my-5 d-flex justify-content-center align-items-center">
				<article class="card p-5 shadow-sm border-primary border-3 rounded-4 bg-light" style="max-width: 750px; width: 100%; display: block !important;">
					<h3 class="fw-bold text-primary mb-5 fs-2 text-center w-100" style="display: block;">Ingreso a la página</h3>
					
					<form action="validacion.jsp" method="POST" class="w-100 d-block" style="display: block !important;">
						
						<!-- FILA DEL CORREO ELECTRÓNICO -->
						<div class="row mb-4 align-items-center justify-content-center text-start g-3" style="display: flex !important;">
							<label for="correo" class="col-sm-5 col-form-label fs-4 fw-bold text-secondary text-end m-0">Correo electrónico:</label>
							<div class="col-sm-7">
								<input type="email" class="form-control form-control-lg border-2 rounded-3 w-100" id="correo" name="txt_correo" required placeholder="ejemplo@correo.com">
							</div>
						</div>
						
						<!-- FILA DE LA CONTRASEÑA -->
						<div class="row mb-5 align-items-center justify-content-center text-start g-3" style="display: flex !important;">
							<label for="contrasenia" class="col-sm-5 col-form-label fs-4 fw-bold text-secondary text-end m-0">Contraseña:</label>
							<div class="col-sm-7">
								<input type="password" class="form-control form-control-lg border-2 rounded-3 w-100" id="contrasenia" name="txt_clave" required placeholder="********">
							</div>
						</div>
						
						<!-- CONTENEDOR DE BOTONES -->
						<div class="d-flex justify-content-center align-items-center flex-wrap gap-4 mt-5 w-100" style="display: flex !important; clear: both;">
							<button type="submit" class="btn btn-success btn-lg fw-bold rounded-3 shadow-sm py-2 px-4" style="min-width: 180px;">Iniciar sesión</button>
							<button type="reset" class="btn btn-warning text-white btn-lg fw-bold rounded-3 shadow-sm py-2 px-4" style="min-width: 180px;">Limpiar campos</button>
							<a href="registro_lengua.jsp" class="btn btn-info text-white btn-lg fw-bold rounded-3 shadow-sm py-2 px-4" style="min-width: 180px; text-decoration: none; text-align: center;">Registrarse</a>
						</div>
						
					</form>
				</article>
			</section>
		</div>
		
		<!-- PIE DE LA PÁGINA -->
		<footer>
			<p>&copy; Desarrollado por Jorge Andrés Burgos Galarza</p>
			<p>Todos los derechos reservados. 2026</p>
		</footer>
	</main>
	
	<div class="modal fade" id="modalErrorLogin" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-2 border-danger rounded-4">
                <div class="modal-header bg-danger text-white rounded-top-3">
                    <h5 class="modal-title fw-bold">Acceso Denegado</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 text-center">
                    <div class="mb-3 text-danger" style="font-size: 3rem;">🚫</div>
                    <p class="fs-5 text-dark fw-semibold mb-0" id="mensajeError"></p>
                </div>
                <div class="modal-footer bg-light justify-content-center">
                    <button type="button" class="btn btn-danger fw-bold px-4 rounded-3" data-bs-dismiss="modal">Entendido</button>
                </div>
            </div>
        </div>
    </div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>
        document.addEventListener("DOMContentLoaded", function() {
            // Obtenemos el parámetro 'error' de la URL (ej: login_lengua.jsp?error=bloqueado)
            const urlParams = new URLSearchParams(window.location.search);
            const error = urlParams.get('error');
            
            if (error) {
                const modal = new bootstrap.Modal(document.getElementById('modalErrorLogin'));
                const mensaje = document.getElementById('mensajeError');
                
                if (error === 'bloqueado') {
                    mensaje.innerText = "¡Tu cuenta se encuentra bloqueada! Por favor, contacta con el administrador.";
                } else if (error === 'datos_incorrectos') {
                    mensaje.innerText = "Correo o contraseña incorrectos. Inténtalo de nuevo.";
                }
                
                modal.show();
            }
        });
    </script>
	
</body>
</html>