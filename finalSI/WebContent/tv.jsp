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

<div class="Page" id="tv_page">
	<h2>TV</h2>
	<div class="ImageContainer">
		<img src="pages\tv.png" width="551" height="353" usemap="#map_tv" style="width: 551px; height: 353px;">
		<div class="Links">
			<a href="#home_page" style="left: 23px; top: 23px; width: 23px; height: 14px;"></a>
		</div>
	</div>
	
	<map name="map_tv">
		<area shape="rect" coords="23,23,46,37" href="#home_page" title="Go to page 'Home'">
	</map>
</div>

</body>
</html>