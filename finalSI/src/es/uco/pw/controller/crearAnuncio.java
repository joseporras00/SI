package es.uco.pw.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uco.pw.business.anuncio.Anuncio;
import es.uco.pw.data.dao.AnuncioDAO;
import es.uco.pw.data.dao.UserDAO;
import es.uco.pw.display.javaBean.CustomerBean;

/**
 * Servlet implementation class crearAnuncio
 */
@WebServlet("/crearAnuncio")
public class crearAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher disp = request.getRequestDispatcher("/opcionesTablon.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
		String mensajeNextPage = "";
		
		
		HttpSession session = request.getSession();
		CustomerBean customerBean = (CustomerBean) session.getAttribute("customerBean");
		String ruta = (String) session.getAttribute("rutaSQL");
		String tipoAnuncio = (String) session.getAttribute("Tipo");
		String propietario = customerBean.getEmailUser();
		
		if(tipoAnuncio != null && UserDAO.queryByEmail(propietario, ruta) != null)
		{
			Anuncio aux = new Anuncio();
			
			mensajeNextPage = "Anuncio creado con éxito\n";
			
			if(tipoAnuncio.equals("General"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setPropietario(propietario);
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setTipo(tipoAnuncio);
				aux.setFase("editado");
				
				AnuncioDAO.save(aux, ruta);
			}
			else if(tipoAnuncio.equals("Tematico"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setPropietario(propietario);
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setTipo(tipoAnuncio);
				aux.setFase("editado");
				aux.setTag(request.getParameter("Tema"));
				
				AnuncioDAO.save(aux, ruta);
			}
			else if(tipoAnuncio.equals("Individualizado"))
			{
				String destinatario = request.getParameter("Destinatario");
				
				if(UserDAO.queryByEmail(destinatario, ruta) != null)
				{
					aux.setTitulo(request.getParameter("Titulo"));
					aux.setPropietario(propietario);
					aux.setDestinatario(destinatario);
					aux.setCuerpo(request.getParameter("Cuerpo"));
					aux.setTipo(tipoAnuncio);
					aux.setFase("editado");
					
					AnuncioDAO.save(aux, ruta);
				}
				else
					mensajeNextPage = "Error, el destinatario introducido no existe.";
				
				
				
			}
			else if(tipoAnuncio.equals("Flash"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setPropietario(propietario);
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setTipo(tipoAnuncio);
				aux.setFechaComienzo(request.getParameter("F.comienzo"));
				aux.setFechaFin(request.getParameter("F.fin"));
				if(Anuncio.comprobarFechas(aux.getFechaComienzo(), aux.getFechaFin()))
					aux.setFase("publicado");
				else
					aux.setFase("en_espera");
				
				AnuncioDAO.save(aux, ruta);
			}
			else
				mensajeNextPage = "Error al crear el anuncio.";
		}
		else
			mensajeNextPage = "El propietario introducido no existe en la base de datos.";
			
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}

}
