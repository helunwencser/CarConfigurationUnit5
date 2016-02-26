<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"></link>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Car detail</title>
</head>
<body class="bg-primary">
<h3 align="center">The detailed information of your configuration</h3>
<%@ page import="java.net.*, java.util.*, java.io.*, org.cmu.edu.model.Automobile" %>
<%	
	Map<String, String> parameters = request.getParameterMap();
	Set<String> keys = parameters.keySet();
	keys.remove("name");
	String name = request.getParameter("name");
	Socket socket = new Socket("localhost", 8888);
	ObjectOutputStream writer = new ObjectOutputStream(socket.getOutputStream());
	ObjectInputStream reader = new ObjectInputStream(socket.getInputStream());
	writer.writeObject("getAuto_" + name);
	Automobile automobile = (Automobile)reader.readObject();
	writer.writeObject("close");
	socket.close();
	for(String key : keys){
		automobile.setOptionChoice(key, request.getParameter(key));
	}
%>
	<div align="center">
		<table style="width:50%" class="table table-bordered table-hover  table-condensed">
			<tr>
    			<td>Model Name: </td>
    			<td><%=automobile.getName() %></td> 
  			</tr>
  			<tr>
  				<td>Make:</td>
  				<td><%=automobile.getMake() %></td>
  			</tr>
  			<tr>
  				<td>Base price:</td>
  				<td><%=automobile.getBasePrice() %></td>
  			</tr>
  			<%for(String key : keys){ %>
  				<tr>
  					<td><%=key %></td>
  					<td><%=request.getParameter(key) %></td>
  				</tr>
  			<%} %>
  			<tr>
  				<td>Total Price</td>
  				<td><%=automobile.getTotalPrice() %></td>
  			</tr>
		</table>
	</div>
</body>
</html>