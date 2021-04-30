<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="es.uco.pw.display.javaBean.CustomerBean"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log up</title>

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
  var msg = validarNombre(f.Nombre.value);
  msg += validarApellidos(f.Apellidos.value);
  msg += validarEmail(f.Email.value);
  msg += validarPassword(f.Password.value);
  msg += validarEdad(f.Edad.value);
  msg += validarTags(f.Tags.value);
  function validarNombre(inp){
	  if (inp == "")
		  return “No se introdujo nombre de usuario\n";
		  else if (inp.length < 5)
		  return “Nombre de usuario demasiado corto\n";
		  else return "";
  }
  function validarApellidos(inp){
	  if (inp == "")
		  return “No se introdujo apellidos de usuario\n";
		  else if (inp.length < 5)
		  return “Nombre de usuario demasiado corto\n";
		  else return "";
  }
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
  function validarEdad(inp){
	  if (inp == "") return “No se introdujo Edad\n";
	  else if (inp < 10)
	  return “Debes de tener mas de 10\n";
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
String nextPage = "/Practica3/logup";
String messageNextPage = (String) session.getAttribute("message");
if (messageNextPage == null) messageNextPage = "";

String ruta = application.getInitParameter("rutaSQL");
session.setAttribute("rutaSQL", ruta);

if (customerBean!= null && !customerBean.getEmailUser().equals("")) {
	%>
	<div class="msg"><%= messageNextPage %></div>
	<br/><br/>
	<form method="post" action="/Practica3/logup" name="actualizar" onsubmit="return validar(this);">
		<h2>Actualizar Usuario</h2>
		<label for="Password">Password: </label>
		<input type="password" name="Password" placeholder="Nueva contraseña"><br/>
		<label for="Nombre">Name: </label>
		<input type="text" name="Nombre" placeholder="Nombre"><br/>
		<label for="Apellidos">Apellidos: </label>
		<input type="text" name="Apellidos" placeholder="Apellidos"><br/>		
		<label for="Edad">Edad: </label>
		<input type="number" name="Edad" placeholder="22"><br/>
		<p>
    	<label for="Tags[]">Intereses:</label><br>
    	<label><input type="checkbox" name="Tags[]" value="Actualidad"> Actualidad</label>
    	<label><input type="checkbox" name="Tags[]" value="Alimentacion"> Alimentación</label>
    	<label><input type="checkbox" name="Tags[]" value="Deportes"> Deportes</label>
    	<label><input type="checkbox" name="Tags[]" value="Diversion"> Diversión</label>
    	<label><input type="checkbox" name="Tags[]" value="Moda"> Moda</label>
    	<label><input type="checkbox" name="Tags[]" value="Musica"> Música</label>
    	<label><input type="checkbox" name="Tags[]" value="Tecnologia"> Tecnología</label><br>
  		</p>
		<input type="submit" value="Aceptar">
		<input type="reset" value="Restaurar formulario">
	<br><div class="volver"><a href="/Practica3/index.jsp">Volver</a></div>
		
		
	</form>
	<%} else {
%><div class="msg"><%= messageNextPage %></div>
<br/><br/>
<form novalidate method="post" action="/Practica3/logup" name="logup_form" onsubmit="return validar(this);">
	<h2>Registrar Usuario</h2>
	<label for="Email">Email: </label>
	<input type="text" name="Email"placeholder="Tu Email" ><br/>
	<label for="Password">Password: </label>
	<input type="password" name="Password" placeholder="Tu contraseña"><br/>
	<label for="Nombre">Name: </label>
	<input type="text" name="Nombre" placeholder="Tu nombre"><br/>
	<label for="Apellidos">Apellidos: </label>
	<input type="text" name="Apellidos" placeholder="Tus apellidos"><br/>
	<label for="Edad">Edad: </label>
	<input type="text" name="Edad" placeholder="Tu edad"><br/>
	<p>
    	<label for="Tags[]">Intereses:</label><br>
    	<label><input type="checkbox" name="Tags[]"value="Acualidad"> Actualidad</label>
    	<label><input type="checkbox" name="Tags[]"value="Alimentacion"> Alimentación</label>
    	<label><input type="checkbox" name="Tags[]"value="Deportes"> Deportes</label>
    	<label><input type="checkbox" name="Tags[]"value="Diversion"> Diversion</label>
    	<label><input type="checkbox" name="Tags[]"value="Moda"> Moda</label>
    	<label><input type="checkbox" name="Tags[]"value="Musica"> Musica</label>
    	<label><input type="checkbox" name="Tags[]"value="Tecnologia"> Tecnologia</label>
  		</p>
	
	<input type="submit" value="Aceptar">
	<input type="reset" value="Restaurar formulario">
	<br><div class="volver"><a href="/Practica3/index.jsp">Volver</a></div>
	
	
</form>
<%
}
%>

</body>
</html>