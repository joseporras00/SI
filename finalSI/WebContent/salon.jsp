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

<div class="Page" id="salon_page">
	<h2>Salon</h2>
	<div class="ImageContainer"><img src="pages\salon.png" width="551" height="353" usemap="#map_salon" style="width: 551px; height: 353px;">
	<div class="Links"><a href="#eliminardispositivo_page" style="left: 304px; top: 213px; width: 85px; height: 18px;"></a>
		<a href="#msica_page" style="left: 171px; top: 136px; width: 95px; height: 63px;"></a>
		<a href="#aadir_dispositivo_page" style="left: 305px; top: 18px; width: 14px; height: 13px;"></a>
		<a href="#aadir_dispositivo_page" style="left: 322px; top: 18px; width: 68px; height: 12px;"></a>
		<a href="#home_page" style="left: 23px; top: 12px; width: 23px; height: 14px;"></a>
		<a href="#cortina_page" style="left: 299px; top: 136px; width: 96px; height: 63px;"></a>
		<a href="#temperatura_page" style="left: 45px; top: 136px; width: 95px; height: 63px;"></a>
		<a href="#puerta_page" style="left: 299px; top: 46px; width: 96px; height: 63px;"></a>
		<a href="#luz_page" style="left: 173px; top: 46px; width: 95px; height: 63px;"></a>
		<a href="#asistente_page" style="left: 45px; top: 46px; width: 95px; height: 63px;"></a>
	</div></div>
	
	<map name="map_salon"><area shape="rect" coords="304,213,389,231" href="#eliminardispositivo_page" title="Go to page 'Eliminar_dispositivo'">
		<area shape="rect" coords="171,136,266,199" href="#msica_page" title="Go to page 'Música'">
		<area shape="rect" coords="305,18,319,31" href="#aadir_dispositivo_page" title="Go to page 'Añadir dispositivo'">
		<area shape="rect" coords="322,18,390,30" href="#aadir_dispositivo_page" title="Go to page 'Añadir dispositivo'">
		<area shape="rect" coords="23,12,46,26" href="#home_page" title="Go to page 'Home'">
		<area shape="rect" coords="299,136,395,199" href="#cortina_page" title="Go to page 'Cortina'">
		<area shape="rect" coords="45,136,140,199" href="#temperatura_page" title="Go to page 'Temperatura'">
		<area shape="rect" coords="299,46,395,109" href="#puerta_page" title="Go to page 'Puerta'">
		<area shape="rect" coords="173,46,268,109" href="#luz_page" title="Go to page 'Luz'">
		<area shape="rect" coords="45,46,140,109" href="#asistente_page" title="Go to page 'Asistente'">
	</map>
</div>

</body>
</html>