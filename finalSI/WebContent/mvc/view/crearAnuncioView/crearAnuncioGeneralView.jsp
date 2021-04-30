<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}
input[type=text], select, textarea {
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
text-align:center;
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
<title>Crear Anuncio General</title>
<script type="text/javascript">
function validar(f) {
  var ok = true;
  var msg = validarTitulo(f.Titulo.value);
  msg += validarCuerpo(f.Cuerpo.value);
  function validarTitulo(inp){
	  if (inp == "")
		  ok=false;return “No se introdujo titulo del anuncio\n";
		  else if (inp.length < 5)
		  ok=false;return “titulo demasiado corto\n";
		  else return "";
  }
  function validarCuerpo(inp){
	  if (inp == "") ok=false;return “No se introdujo cuerpo del anuncio\n";
	  else if (inp.length < 5)
	  ok=false;return “Cuerpo de anuncio demasiado corto\n";
	  else return ""; 
  }
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
String nextPage = "/Practica3/index.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";

String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);

if (customerBean == null || customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "/Practica3/index.jsp";
} else {
	
	session.setAttribute("Tipo", "General");
%>
<div class="msg"><%= messageNextPage %></div>
<br/><br/>
<form method="post" action="/Practica3/crearAnuncio" onSubmit="return validar(this);">
	<h2>Crear Anuncio</h2>
	<label for="Titulo">Titulo: </label>
	<input type="text" name="Titulo" ><br/>
	<label for="Cuerpo">Cuerpo: </label>
	<textarea rows="20" cols="5" name="Cuerpo" ></textarea><br/>

	
	<input type="submit" name="submit"value="Aceptar" />
	<input type="reset" value="Restaurar Anuncio">
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
	

</form>

<%
}
%>

</body>
</html>