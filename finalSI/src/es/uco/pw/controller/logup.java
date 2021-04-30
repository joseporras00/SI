package es.uco.pw.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uco.pw.business.user.User;
import es.uco.pw.data.dao.UserDAO;
import es.uco.pw.display.javaBean.CustomerBean;

/**
 * Servlet implementation class logup
 */
@WebServlet("/logup")
public class logup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
		String mensajeNextPage = "";
		
		
		HttpSession session = request.getSession();
		CustomerBean customerBean = (CustomerBean) session.getAttribute("customerBean");

		if (customerBean == null || customerBean.getEmailUser().equals("")) {
			
				disp = request.getRequestDispatcher("/mvc/view/logupView.jsp");
		}
		else
		{
			String emailUser = customerBean.getEmailUser();
			disp = request.getRequestDispatcher("/mvc/view/logupView.jsp");
			mensajeNextPage = "Actualizar datos de "+ emailUser;
		}
		
		
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
		String mensajeNextPage = "";
		
		
		HttpSession session = request.getSession();
		CustomerBean customerBean = (CustomerBean) session.getAttribute("customerBean");
		String ruta = (String) session.getAttribute("rutaSQL");
		
		if (customerBean == null || customerBean.getEmailUser().equals(""))
		{
		String nameUser = request.getParameter("Nombre");
		String apellidosUser = request.getParameter("Apellidos");
		String passwordUser = request.getParameter("Password");
		String emailUser= request.getParameter("Email");
		String edadUser = request.getParameter("Edad");
		String[] tagsUser = request.getParameterValues("Tags[]");

		//Caso 2.a: Hay parámetros -> procede de la VISTA
		if (emailUser != null) {
			//Se accede a bases de datos para obtener el usuario
			if(!passwordUser.equals("") && !nameUser.equals("") && !edadUser.equals("") && !apellidosUser.equals(""))
			{
				User user = UserDAO.queryByEmail(emailUser,ruta);

				//Se realizan todas las comprobaciones necesarias del dominio
				//Aquí sólo comprobamos que exista el usuario
				if (user == null ) {
				// Usuario válido	

				customerBean.setNameUser(nameUser);
				customerBean.setApellidosUser(apellidosUser);
				customerBean.setPasswordUser(passwordUser);
				customerBean.setEmailUser(emailUser);
				customerBean.setEdadUser(Integer.parseInt(edadUser));
				customerBean.setTagsUser(tagsUser);
				customerBean.setAttemptsUser(3);
				
				User usuario_aux = new User(nameUser,apellidosUser,emailUser,passwordUser,Integer.parseInt(edadUser),tagsUser,3);
				UserDAO.save(usuario_aux,ruta);
				} 
				else
				{
					// Usuario no válido
					disp = request.getRequestDispatcher("/mvc/view/logupView.jsp");
					mensajeNextPage = "Ya existe una cuenta con ese email";
				}
			}
			else
				disp = request.getRequestDispatcher("/WEB-INF/errorPage.jsp");
		//Caso 2.b -> se debe ir a la vista por primera vez
		}
		}
		//Caso 3 -> Actualizar datos
		else
		{
			String nameUser = request.getParameter("Nombre");
			String apellidosUser = request.getParameter("Apellidos");
			String passwordUser = request.getParameter("Password");
			String edadUser = request.getParameter("Edad");
			String[] tagsUser = request.getParameterValues("Tags[]");
			
			if(!passwordUser.equals("") && !nameUser.equals("") && !edadUser.equals("") && !apellidosUser.equals(""))
			{
				User usuario_aux = new User(nameUser,apellidosUser,customerBean.getEmailUser(),passwordUser,Integer.parseInt(edadUser),tagsUser,3);
				UserDAO.update(usuario_aux,ruta);
				
				customerBean.setNameUser(nameUser);
				customerBean.setApellidosUser(apellidosUser);
				customerBean.setPasswordUser(passwordUser);
				customerBean.setEdadUser(Integer.parseInt(edadUser));
				customerBean.setTagsUser(tagsUser);
				customerBean.setAttemptsUser(3);
			}
			else
				disp = request.getRequestDispatcher("/WEB-INF/errorPage.jsp"); 
		}
		
		session.setAttribute("message", mensajeNextPage);
		disp.forward(request, response);
	}
}