<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
  box-sizing: border-box;
}

input[type=text],input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
h1,h3,h2{
text-align: center;
color: #e04b11;

}

.msg{
text-align: center;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
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

<meta charset="UTF-8">
<title>Log in</title>

<script type="text/javascript">
function validar(f) {
  var ok = true;
  var msg = validarEmail(f.Email.value);
  msg += validarPassword(f.Password.value);
  
  function validarEmail(inp){
	  if (inp == "") return “No se introdujo email\n";
	  else if (!((inp.indexOf("@") > 0)) ||
	  /[^a-zA-Z0-9\.\@\_\-]/.test(inp))
	  return “Caracteres inválidos en email\n";
	  else return "";  
  }
  function validarPassword(inp){
	  if (inp == "") return “No se introdujo Password\n";
	  else if (inp.length < 5)
	  return “Nombre de usuario demasiado corto\n";
	  else return ""; 
  }

  if(ok == false)
    alert(msg);
  return ok;
}
</script>
</head>
<body>
<%
/* Posibles flujos:
	1) customerBean está logado (!= null && != "") -> Se redirige al index.jsp (no debería estar aquí pero hay que comprobarlo)
	2) customerBean no está logado:
		a) Hay parámetros en el request  -> procede del controlador /con mensaje 
		b) No hay parámetros en el request -> procede del controlador /sin mensaje
	*/
String nextPage = "/Practica3/login";
String messageNextPage = (String) session.getAttribute("message");
if (messageNextPage == null) messageNextPage = "";

String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);

if (customerBean!= null && !customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "/Practica3/index.jsp";
} else {
%>
<div class="msg"><%= messageNextPage %></div>
<br/><br/>
<form method="post" action="/Practica3/login" onSubmit="return validar(this);">
	<h2>Validación de usuario</h2>
	<label for="Email">Email: </label>
	<input type="text" name="Email" placeholder="Tu nombre"><br/>
	<label for="Password">Password: </label>
	<input type="password" name="Password" placeholder="Tu contraseña"><br/>
	<br>
	
	<input type="submit" value="Aceptar">
	<input type="reset" value="Restaurar formulario">
	<br><div class="volver"><a href="/Practica3/index.jsp">Volver</a></div>
	

</form>
<%
}
%>

</body>
</html>


