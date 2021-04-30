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
import es.uco.pw.display.javaBean.CustomerBean;

/**
 * Servlet implementation class editarAnuncio
 */
@WebServlet("/editarAnuncio")
public class editarAnuncio extends HttpServlet {
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

		int id = Integer.parseInt(request.getParameter("Id"));

		Anuncio aux = AnuncioDAO.queryById(id, ruta);
		
		if(aux != null && customerBean != null)
		{
			if(aux.getTipo().equals("General"))
			{
				System.out.print("\nhey");
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setCuerpo(request.getParameter("Cuerpo"));
			}
			else if(aux.getTipo().equals("Tematico"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setTag(request.getParameter("Tema"));
			}
			else if(aux.getTipo().equals("Individualizado"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setDestinatario(request.getParameter("Destinatario"));
			}
			else if(aux.getTipo().equals("Flash"))
			{
				aux.setTitulo(request.getParameter("Titulo"));
				aux.setCuerpo(request.getParameter("Cuerpo"));
				aux.setFechaComienzo(request.getParameter("F.comienzo"));
				aux.setFechaFin(request.getParameter("F.fin"));
				
				if(Anuncio.comprobarFechas(aux.getFechaComienzo(), aux.getFechaFin()))
					aux.setFase("publicado");
				else
					aux.setFase("en_espera");
			}
			else
				mensajeNextPage = "Error en el tipo de anuncio";
			
			
			AnuncioDAO.update(aux, ruta);
			mensajeNextPage = "Anuncio actualizado con exito";
		}
			
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}

}
