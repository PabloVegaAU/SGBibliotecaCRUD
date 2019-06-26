package pe.autonoma.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.autonoma.model.ServiceBibliotecalmpl;
import pe.autonoma.entity.Biblioteca;
import pe.autonoma.service.ServiceBiblioteca;
import pe.autonoma.tools.Convierte;


/**
 * Class Bibiloteca, sera el que resiva y redirija las instrucciones de la Lista.jsp
 *
 * @version 1.0 26 Jun 2019
 * @author SGrupo2
 * @Integrantes:
 * Joel Fretel
 * Brayan Ramirez
 * Manuel Zuta
 * David Perez
 * Pablo Vgea
 */

@WebServlet({"/Biblioteca","/view/Biblioteca"})
public class ServletBiblioteca extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/* Aqu llamamos a la accion la cual resivira la accion que el usuario desea realizar, previamente de la lista.jsp al Service  */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion"); //Requerir parametros del form
		String mensaje = null;
		String direccionar = null;
		
		ServiceBiblioteca service = new ServiceBibliotecalmpl();
	/*Una vez resivida la accion se realizara segun que halla sido seleccionado*/
		//Switch
switch (accion) {
		//Lista de Libros
		case "QRY":
			List<Biblioteca> lista = service.bibliotecaQry();
			
			if (lista != null) {
                request.setAttribute("lista", lista);
            } else {
                mensaje = service.getMensaje();
            }
            direccionar = "lista.jsp";
			
			break;
		//Insertar	Libro
		case "INS":
			Biblioteca biblioteca = new Biblioteca();
            mensaje = verificar(request, biblioteca);
            
            if (mensaje == null) {
            	service.bibliotecaIns(biblioteca);
                mensaje = service.getMensaje();
                
                if (mensaje != null) {
                    request.setAttribute("biblioteca", biblioteca);
                    direccionar = "Insertar.jsp";
                } else {
                	direccionar = "Biblioteca?accion=QRY";
                }
                
            } else {
                request.setAttribute("biblioteca", biblioteca);
                direccionar = "Insertar.jsp";
            }
			break;
		//Buscar Libro
		case "FND":
			biblioteca = null;
			Integer codlib = Convierte.aInteger(request.getParameter("codlib"));

            if (codlib != null) {
            	biblioteca = service.bibliotecaFnd(codlib);

                if (biblioteca != null) {
                    
                    request.setAttribute("biblioteca", biblioteca);
                    
                    direccionar = "actualizar.jsp";
                } else {
                    mensaje = service.getMensaje();
                    direccionar = "Biblioteca?accion=QRY";
                }

            } else {
                mensaje = "No se ha recibido el Codigo de Biblioteca.";
                direccionar = "Biblioteca?accion=QRY";
            }
			break;
		//Actualizar/Modificar Libro	
		case "UPD":
			biblioteca = new Biblioteca();
            mensaje = verificar(request, biblioteca);

            if (mensaje == null) {
            	service.bibliotecaUpd(biblioteca);
                mensaje = service.getMensaje();
                
                if (mensaje != null) {
                    request.setAttribute("biblioteca", biblioteca);
                    direccionar = "actualizar.jsp";
                } else {
                	direccionar = "Biblioteca?accion=QRY";
                }
                
            } else {
                request.setAttribute("biblioteca", biblioteca);
                direccionar = "actualizar.jsp";
            }
			break;
	    //Borrar libro		
		case "DEL":
			codlib = Convierte.aInteger(request.getParameter("codlib"));

            if (codlib != null) {
            	service.bibliotecaDel(codlib);
            	mensaje = service.getMensaje();                   

            } else {
                mensaje = "No se ha recibido el codigo de la biblioteca.";
                direccionar = "Biblioteca?accion=QRY";
            }

            direccionar = "Biblioteca?accion=QRY";
			break;
		//En caso de que la accion no sea reconocida
		default:
			mensaje = "Accion no reconicida";
			
		}
		
		if (mensaje != null) {
			String msg = "Imposibleeee";
			msg += "<div class=\"alert alert-danger\">";
			msg += "<button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button>";
			msg += "<strong>Alerta!!</strong><br/>";
			msg += mensaje;
			msg += "</div></div>";
			request.setAttribute("mensaje", msg);
		}
		
		RequestDispatcher despachador = request.getRequestDispatcher(direccionar);
		despachador.forward(request, response);
		
	}
//Vefica que sea correcto lo que el Usuario ingrese

	protected String verificar(HttpServletRequest request, Biblioteca biblioteca) { 
		String mensaje = "<ul>";
		Integer codlib = Convierte.aInteger(request.getParameter("codlib"));
		String nomlib = request.getParameter("nomlib");
		Integer cantlib = Convierte.aInteger(request.getParameter("cantlib"));
		String autor = request.getParameter("autor");
		        
		        if ((nomlib == null) || (nomlib.trim().length() == 0)) {
		            mensaje += "<li>Verifique que halla ingresado correctamente el nombre del libro</li>";
		        }
		        if ((cantlib == null) || (cantlib == 0)) {
		            mensaje += "<li>Verifique que halla ingresado una cantidad estable para los libros</li>";
		        }
		        if ((autor == null) || (autor.trim().length() == 0)) {
		            mensaje += "<li>Verifique que halla ingresado correctamente el autor</li>";
		        }
		        biblioteca.setCodlib(codlib);
		        biblioteca.setNomlib(nomlib);
		        biblioteca.setCantlib(cantlib);
		        biblioteca.setAutor(autor);
		        
		        if (mensaje.equals("<ul>")) {
		            mensaje = null;
		        } else {
		            mensaje += "</ul>";
		        }
		
		        return mensaje;
		    }
}
