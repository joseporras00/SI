<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="es.uco.pw.business.anuncio.Anuncio, java.util.ArrayList, es.uco.pw.data.dao.AnuncioDAO"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar anuncio</title>
<style type="text/css">
* {
  box-sizing: border-box;
}

input[type=text],input[type=number], select, textarea {
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
<script type="text/javascript">
function validar(f) {
  var ok = true;
  var msg = validaId(f.Id.value);
  msg += validarTitulo(f.Titulo.value);
  msg += validarCuerpo(f.Cuerpo.value);
  function validarId(inp){
	  if (inp == "")
		  return "No se introdujo Id\n";
		  else return "";
  }
  function validarTitulo(inp){
	  if (inp == "")
		  return “No se introdujo Titulo\n";
		  else if (inp.length < 3)
		  return “Titulo demasiado corto\n";
		  else return "";
  }
  function validarCuerpo(inp){
	  if (inp == "") return “No se introdujo cuerpo\n";
	  else if (inp.length < 5)
		  return "Cuerpo demasiado corto\n";
		  else return "
  }
  
  if(ok == false)
    alert(msg);
  return ok;
}
</script>
</head>


<body>
<%
String nextPage = "/Practica3/index.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";
String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);
if (customerBean == null || customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "/Practica3/index.jsp";
} else {
	
	String tipo=request.getParameter("Tipo");
	session.setAttribute("Tipo", tipo);
	ArrayList<Anuncio> listaAnuncios = AnuncioDAO.queryByTipo(tipo,ruta);
%>
<div class="msg"><%= messageNextPage %></div>
<br/><br/>
<h2>Editar Anuncio</h2>
<h4>Anuncios</h4>

<%
	if(listaAnuncios != null){
	for(Anuncio a: listaAnuncios)
	{%><ul>
		<li>Id: <%=a.getId()%><br>
		Titulo: <%=a.getTitulo()%></li>
	</ul><br>
	<%}}
%>

<br><br><br>
<h4>Datos a actualizar</h4>
<%	if(tipo.equals("General"))
	{ %>
	<form novalidate method="post" action="/Practica3/editarAnuncio" onsubmit="return validar(this);">
	<label for="Id">Id de anuncio a actualizar: </label>
	<input type="number" name="Id" ><br/>
	<label for="Titulo">Titulo: </label>
	<input type="text" name="Titulo" ><br/>
	<label for="Cuerpo">Cuerpo: </label>
	<textarea rows="20" cols="20" name="Cuerpo" ></textarea><br/><br>
	
	
	<input type="reset" value="Restaurar Anuncio">
	<input type="submit" value="Aceptar">
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
</form>

	
	<%}if(tipo.equals("Tematico"))
	{ %>
<form novalidate method="post" action="/Practica3/editarAnuncio" onsubmit="return validar(this);">
	<label for="Id">Id de anuncio a actualizar: </label>
	<input type="number" name="Id" ><br/>
	<label for="Titulo">Titulo: </label>
	<input type="text" name="Titulo" required><br/>
	<label for="Cuerpo">Cuerpo: </label>
	<textarea rows="5" cols="20" name="Cuerpo" required></textarea><br/>
	<label for="Tema">Tema: </label>
	<select name="Tema">
		<option value="Actualidad">Actualidad</option>
		<option value="Alimentacion">Alimentacion</option>
		<option value="Deportes">Deportes</option>
		<option value="Diversion">Diversion</option>
		<option value="Moda">Moda</option>
		<option value="Musica">Musica</option>
		<option value="Tecnologias">Tecnologias</option>
	</select><br/><br>
	
	<input type="reset" value="Restaurar Anuncio">
	<input type="submit" value="Aceptar">
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
</form>
	
	<%	}if(tipo.equals("Individualizado"))
	{ %>
<form novalidate method="post" action="/Practica3/editarAnuncio"onsubmit="return validar(this);">
	<label for="Id">Id de anuncio a actualizar: </label>
	<input type="number" name="Id" ><br/>
	<label for="Titulo">Titulo: </label>
	<input type="text" name="Titulo" ><br/>
	<label for="Destinatario">Destinatario: </label>
	<input type="text" name="Destinatario" ><br/>
	<label for="Cuerpo">Cuerpo: </label>
	<textarea rows="20" cols="20" name="Cuerpo" ></textarea><br/>
	<br>
    
	
	<input type="reset" value="Restaurar Anuncio">
	<input type="submit" value="Aceptar">
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
</form>
	
	<%	}if(tipo.equals("Flash"))
	{ %>
<form novalidate method="post" action="/Practica3/editarAnuncio" onsubmit="return validar(this);">

	<label for="Id">Id de anuncio a actualizar: </label>
	<input type="number" name="Id" ><br/>
	<label for="Titulo">Titulo: </label>
	<input type="text" name="Titulo" ><br/>
	<label for="Cuerpo">Cuerpo: </label>
	<textarea rows="20" cols="20" name="Cuerpo" ></textarea><br/>
	
  	<label for="F.Comienzo">F.comienzo: </label>
	<input type="date" name="F.comienzo" placeholder="2021-01-08"><br/>
	<label for="F.fin">F.fin: </label>
	<input type="date" name="F.fin" placeholder="2021-01-08"><br/><br>
	
	<input type="reset" value="Restaurar Anuncio">
	<input type="submit" value="Aceptar">
	
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
</form>
<% }}%>
</body>
</html>