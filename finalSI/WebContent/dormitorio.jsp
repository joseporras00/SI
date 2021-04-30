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

input[type=text],input[type=search],input[type=number], select, textarea {
  width: 25%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

h1,h3,h2{
text-align: center;
color: #e04b11;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}


input[type=submit] {
  background-color: #e04b11;
  color: white;
  padding: 8px 16px;
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

<div class="Page" id="dormitorio_page">
	<h2>Dormitorio</h2>
	<div class="ImageContainer">
		<img src="pages\dormitorio.png" width="551" height="353" usemap="#map_dormitorio" style="width: 551px; height: 353px;">
		<div class="Links">
			<a href="#eliminardispositivo_page" style="left: 305px; top: 219px; width: 84px; height: 18px;"></a>
			<a href="#aadir_dispositivo_page" style="left: 322px; top: 18px; width: 68px; height: 11px;"></a>
			<a href="#aadir_dispositivo_page" style="left: 306px; top: 17px; width: 14px; height: 13px;"></a>
			<a href="#home_page" style="left: 23px; top: 18px; width: 23px; height: 14px;"></a>
			<a href="#msica_page" style="left: 299px; top: 142px; width: 96px; height: 63px;"></a>
			<a href="#asistente_page" style="left: 45px; top: 142px; width: 95px; height: 63px;"></a>
			<a href="#ventilador_page" style="left: 173px; top: 142px; width: 95px; height: 63px;"></a>
			<a href="#puerta_page" style="left: 299px; top: 44px; width: 96px; height: 63px;"></a>
			<a href="#luz_page" style="left: 173px; top: 44px; width: 95px; height: 63px;"></a>
			<a href="#cortina_page" style="left: 45px; top: 44px; width: 95px; height: 63px;"></a>
		</div>
	</div>
	
	<map name="map_dormitorio">
		<area shape="rect" coords="305,219,389,237" href="#eliminardispositivo_page" title="Go to page 'Eliminar_dispositivo'">
		<area shape="rect" coords="322,18,390,29" href="#aadir_dispositivo_page" title="Go to page 'Añadir dispositivo'">
		<area shape="rect" coords="306,17,320,30" href="#aadir_dispositivo_page" title="Go to page 'Añadir dispositivo'">
		<area shape="rect" coords="23,18,46,32" href="#home_page" title="Go to page 'Home'">
		<area shape="rect" coords="299,142,395,205" href="#msica_page" title="Go to page 'Música'">
		<area shape="rect" coords="45,142,140,205" href="#asistente_page" title="Go to page 'Asistente'">
		<area shape="rect" coords="173,142,268,205" href="#ventilador_page" title="Go to page 'Ventilador'">
		<area shape="rect" coords="299,44,395,107" href="#puerta_page" title="Go to page 'Puerta'">
		<area shape="rect" coords="173,44,268,107" href="#luz_page" title="Go to page 'Luz'">
		<area shape="rect" coords="45,44,140,107" href="#cortina_page" title="Go to page 'Cortina'">
	</map>
</div>
	

</body>
</html>