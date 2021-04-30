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

<div class="Page" id="home_page">
	<h2>Home</h2>
	<div class="ImageContainer"><img src="/Practica3/WebContent/WEB-INF/img/home.png" width="551" height="353" usemap="#map_home" style="width: 551px; height: 353px;">
	<div class="Links"><a href="#configuracion_page" style="left: 356px; top: 36px; width: 42px; height: 42px;"></a>
	<a href="#bienvenido_page" style="left: 23px; top: 28px; width: 23px; height: 14px;"></a>
	<a href="#salon_page" style="left: 261px; top: 197px; width: 46px; height: 22px;"></a>
	<a href="#cocina_page" style="left: 184px; top: 197px; width: 46px; height: 22px;"></a>
	<a href="#garaje_y_jardn_page" style="left: 109px; top: 191px; width: 56px; height: 34px;"></a>
	<a href="#bao_page" style="left: 272px; top: 139px; width: 46px; height: 23px;"></a>
	<a href="#dormitorio_page" style="left: 119px; top: 149px; width: 46px; height: 22px;"></a>
	<a href="#dormitorio_page" style="left: 197px; top: 139px; width: 46px; height: 23px;"></a>
	<a href="#dormitorio_page" style="left: 246px; top: 74px; width: 46px; height: 22px;"></a>
	</div>
	</div>
	<map name="map_home"><area shape="rect" coords="356,36,398,78" href="#configuracion_page" title="Go to page 'Configuracion'">
	<area shape="rect" coords="23,28,46,42" href="#bienvenido_page" title="Go to page 'Bienvenido'"><area shape="rect" coords="261,197,307,219" href="#salon_page" title="Go to page 'Salon'">
	<area shape="rect" coords="184,197,230,219" href="#cocina_page" title="Go to page 'Cocina'">
	<area shape="rect" coords="109,191,165,225" href="#garaje_y_jardn_page" title="Go to page 'Garaje y Jardín'">
	<area shape="rect" coords="272,139,318,162" href="#bao_page" title="Go to page 'Baño'">
	<area shape="rect" coords="119,149,165,171" href="#dormitorio_page" title="Go to page 'Dormitorio'">
	<area shape="rect" coords="197,139,243,162" href="#dormitorio_page" title="Go to page 'Dormitorio'">
	<area shape="rect" coords="246,74,292,96" href="#dormitorio_page" title="Go to page 'Dormitorio'"></map>
	</div>
	

</body>
</html>