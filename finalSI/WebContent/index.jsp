<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
* {
  box-sizing: border-box;
}

input[type=text],input[type=password],input[type=number], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

h1,h3,h2,.bienvenida{
text-align: center;
}
 .a{
padding: 1em 3em;
 margin: 1em 25%;
 text-align: center;
}

.a {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<%String rutaIMG = application.getInitParameter("rutaProyecto") + "/WebContent/WEB-INF/vid/yourhome.mp4";%>


<div align="center" ><img src=<%=rutaIMG%> width="300" height="300" ></div>
<%
String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);
String message = (String) session.getAttribute("message");

if (customerBean == null || customerBean.getEmailUser()=="") {
	// Usuario no logado -> Se invoca al controlador de la funcionalidad
%>
<form method="post" action="/Practica3/login" onSubmit="return validar(this);">
	<label for="Email"></label>
	<input type="text" name="Email" placeholder="Nombre de usuario o Email"><br/>
	<label for="Password"></label>
	<input type="password" name="Password" placeholder="Contraseña"><br/>
	<br>
	
	<div class="a"><a href="/Practica3/login">Iniciar Sesion</a></div>
	<div class="a"><a href="/Practica3/logup">Registrarse</a></div>

</form>

<% } else { %>
	<div class="bienvenida">¡¡BIENVENIDO A CASA!!<br></div>
			
	<div class="a"><a href="/Practica3/logup">Entrar</a></div><br>
	<div class="a"><a href="/Practica3/logout.jsp">Desconectar</a></div>
<% } %>

</body>
</html>