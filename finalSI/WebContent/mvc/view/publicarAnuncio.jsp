<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="es.uco.pw.business.anuncio.Anuncio, java.util.ArrayList, es.uco.pw.data.dao.AnuncioDAO"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Publicar anuncio</title>

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


<script type="text/javascript">
function validar(f) {
  var ok = true;
  var msg = validarId(f.Id.value);
  
  function validarId(inp){
	  if (inp == "") return “No se introdujo id\n";
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
String nextPage = "/Practica3/index.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";
String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);
if (customerBean == null || customerBean.getEmailUser().equals("")) {
	//No debería estar aquí -> flujo salta a index.jsp
	nextPage = "/Practica3/index.jsp";
} else {
	
	ArrayList<Anuncio> listaAnunciosEd = AnuncioDAO.queryByFase("editado",ruta);
	ArrayList<Anuncio> listaAnunciosArch = AnuncioDAO.queryByFase("archivado",ruta);
%>
<div class="msg"><%= messageNextPage %></div>
<br/><br/>
<h2>Publicar Anuncio</h2>
<h4>Anuncios</h4>

<%
	if(listaAnunciosEd != null){
	for(Anuncio a: listaAnunciosEd)
	{%>
		<div class="an">
			<ul>
			<li>Id: <%=a.getId()%><br>
			Titulo: <%=a.getTitulo()%><br>
			Fase: <%=a.getFase()%></li>		
			</ul>			
		</div><br>	
	<%}}
%>
<%
	if(listaAnunciosArch != null){
	for(Anuncio a: listaAnunciosArch)
	{%>
		<div class="an">
			<ul>
			<li>Id: <%=a.getId()%><br>
			Titulo: <%=a.getTitulo()%><br>
			Fase: <%=a.getFase()%></li>		
			</ul>			
		</div><br>	
	<%}}%>

<br><br><br>

	<form novalidate method="post" action="/Practica3/publicarAnuncio" onsubmit="return validar(this)">
	<label for="Id">Id: </label>
	<input type="number" name="Id" ><br/>
	
	<input type="submit" value="Aceptar">
	<input type="reset" value="Borrar">
	
	<br><div class="volver"><a href="/Practica3/opcionesTablon.jsp">Volver</a></div>
</form>
<%}%>
</body>
</html>