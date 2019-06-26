<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Insertar Libros</title>
</head>
<body>
<%@include file="include/header.jsp" %>
<h2>Ingresar la Siguiente Información</h2>
								
		
							<form action="Biblioteca" method="POST" class="form-horizontal">
								<input type="hidden" name="accion" value="INS" />


									<label for="nombres" class="control-label col-md-4">Nombre de Libro</label>
									
										<input type="text" class="form-control" name="nomlib"
											value="${biblioteca.nomlib}" placeholder="Nombre de Libro"
											required="" maxlength="30" />
									

								
									<label for="cantlib" class="control-label col-md-4">Cantidad de Libros</label>
										<input type="text" class="form-control" name="cantlib"
											value="${biblioteca.cantlib}" placeholder="Cantidad de libros"
											required="" maxlength="9" />
							

				
									<label for="autor" class="control-label col-md-4">Autor</label>
				
										<input type="text" class="form-control" name="autor"
											value="${biblioteca.autor}" placeholder="Autor" required=""
											maxlength="30" />
							


								<hr />
						
										<button type="submit" class="btn btn-info">Aceptar</button>
						
										<button type="button" id="btnCancelar" class="btn btn-warning">Cancelar</button>

							</form>
							<%@include file="include/header.jsp" %>
</body>

</html>