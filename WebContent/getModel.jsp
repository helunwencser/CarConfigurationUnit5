<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"></link>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Car Configuration</title>
</head>
<body class="bg-primary">
<h3 align="center">
	Available models
</h3>
<%@ page import="java.net.*, java.util.*, java.io.*" %>
<%
	Socket socket = new Socket("localhost", 8888);
	ObjectOutputStream writer = new ObjectOutputStream(socket.getOutputStream());
	ObjectInputStream reader = new ObjectInputStream(socket.getInputStream());
	writer.writeObject("get list");
	HashSet<String> models = (HashSet<String>)reader.readObject();
	writer.writeObject("close");
	socket.close();
%>
<div align="center" class="form-group">
	<label for="selectModel">Select A Model:</label>
	<form action="configModel" method="get">
		<select class="form-control" id="selectModel" name="model">
  			<%for(String model : models){ %>
  				<option value="<%=model%>"><%=model%></option>
  			<%} %>
  		</select>
  		<br>
  		<input type="submit" class="btn btn-success" value="Get Model">
	</form>
</div>
</body>
</html>