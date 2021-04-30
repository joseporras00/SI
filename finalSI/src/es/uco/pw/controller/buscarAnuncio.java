package es.uco.pw.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uco.pw.business.anuncio.Anuncio;
import es.uco.pw.data.dao.AnuncioDAO;

/**
 * Servlet implementation class buscarAnuncio
 */
@WebServlet("/buscarAnuncio")
public class buscarAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
		String mensajeNextPage = "";
		
		
		HttpSession session = request.getSession();
		String ruta = (String) session.getAttribute("rutaSQL");
		String busqueda = request.getParameter("busqueda");
		ArrayList<Anuncio> anunciosLista = null;
		
		if(busqueda != null)
		{
			
			if(busqueda.equals("Todos"))
			{
				anunciosLista = AnuncioDAO.viewALL(ruta);
			}
			else if(busqueda.equals("editado") || busqueda.equals("en_espera") || busqueda.equals("publicado") || busqueda.equals("archivado"))
			{
				anunciosLista = AnuncioDAO.queryByFase(busqueda, ruta);
			}
			else if(busqueda.equals("General") || busqueda.equals("Tematico") || busqueda.equals("Individualizado") || busqueda.equals("Flash"))
			{
				anunciosLista = AnuncioDAO.queryByTipo(busqueda, ruta);
			}
			else if(busqueda.equals("Actualidad") || busqueda.equals("Alimentacion") || busqueda.equals("Deportes") || busqueda.equals("Diversion") || busqueda.equals("Moda") || busqueda.equals("Musica") || busqueda.equals("Tecnologia"))
			{
				anunciosLista = AnuncioDAO.queryByTema(busqueda, ruta);
			}
			else
				mensajeNextPage = "Error al introducir un parámetro";
		}
		
		if(anunciosLista != null)
			disp = request.getRequestDispatcher("/mvc/view/paginacionView.jsp");
		
		
		session.setAttribute("anunciosLista", anunciosLista);
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}

}
