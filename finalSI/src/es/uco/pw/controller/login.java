package es.uco.pw.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import es.uco.pw.business.user.User;
import es.uco.pw.data.dao.UserDAO;
import es.uco.pw.display.javaBean.*;

@WebServlet("/login")

public class login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
	String mensajeNextPage = "";
	
	
	HttpSession session = request.getSession();
	CustomerBean customerBean = (CustomerBean) session.getAttribute("customerBean");

	if (customerBean == null || customerBean.getEmailUser().equals("")) {
		
			disp = request.getRequestDispatcher("/mvc/view/loginView.jsp");
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

			String emailUser = request.getParameter("Email");
			String passwordUser = request.getParameter("Password");
			
			if (emailUser != null) {
				//Se accede a bases de datos para obtener el usuario
				
				User user = UserDAO.queryByEmail(emailUser, ruta);

				//Se realizan todas las comprobaciones necesarias del dominio
				//Aquí sólo comprobamos que exista el usuario
				if (user != null && user.getPassword().equalsIgnoreCase(passwordUser)) {
					// Usuario válido
					user.setAttemps(3);
					UserDAO.update(user, ruta);
					
					customerBean.setEmailUser(emailUser);
					customerBean.setPasswordUser(passwordUser);
					customerBean.setNameUser(user.getNombre());
					customerBean.setEdadUser(user.getEdad());
					customerBean.setApellidosUser(user.getApellidos());
					customerBean.setTagUser(user.getTag());
					customerBean.setAttemptsUser(user.getAttemps());
				}
				else if(user != null && !user.getPassword().equalsIgnoreCase(passwordUser))
				{
					int n = user.getAttemps()-1;
					
					if(n==1 || n==2)
					{
						mensajeNextPage = "Al usuario que ha indicado le quedan " + n + " intentos para acceder.";
						disp = request.getRequestDispatcher("/mvc/view/loginView.jsp");
					}
					else if(n==0)
					{
						disp = request.getRequestDispatcher("/ucoRedirect.jsp");
					}
					
					user.setAttemps(n);
					UserDAO.update(user, ruta);
				}
				else {
					// Usuario no válido
					disp = request.getRequestDispatcher("/mvc/view/loginView.jsp");
					mensajeNextPage = "El usuario que ha indicado no existe o no es valido";
				}
				
				session.setAttribute("message", mensajeNextPage);
				disp.forward(request, response);
	}
	}}
