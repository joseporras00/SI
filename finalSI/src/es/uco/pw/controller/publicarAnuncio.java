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

/**
 * Servlet implementation class publicarAnuncio
 */
@WebServlet("/publicarAnuncio")
public class publicarAnuncio extends HttpServlet {
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
		
		int id = Integer.parseInt(request.getParameter("Id"));
		
		Anuncio aux = AnuncioDAO.queryById(id, ruta);
		
		if(aux != null)
		{
			if(aux.getFase().equals("editado") || aux.getFase().equals("archivado"))
				aux.setFase("publicado");
			
			AnuncioDAO.update(aux, ruta);
			mensajeNextPage = "Anuncio publicado con éxito";
		}
		
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}

}
