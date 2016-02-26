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
	<%@ page import="java.net.*, java.util.*, java.io.*, org.cmu.edu.model.Automobile" %>
	<%
		String model = request.getParameter("model");
		Socket socket = new Socket("localhost", 8888);
		ObjectOutputStream writer = new ObjectOutputStream(socket.getOutputStream());
		ObjectInputStream reader = new ObjectInputStream(socket.getInputStream());
		writer.writeObject("getAuto_" + model);
		Automobile automobile = (Automobile)reader.readObject();
		writer.writeObject("close");
		socket.close();
	%>
	<h3 align="center"> Available option set </h3>
	<div align="center">
		<form action="getResult.jsp" method="get">
			<table style="width:50%" class="table table-bordered table-hover  table-condensed">
				<tr>
	    			<td>Model Name: </td>
	    			<td><%=automobile.getName() %>
	    				<input type="hidden" name="name" value="<%=automobile.getName() %>" />
	    			</td> 
	  			</tr>
	  			<tr>
	  				<td>Make:</td>
	  				<td><%=automobile.getMake() %></td>
	  			</tr>
	  			<tr>
	  				<td>Base price:</td>
	  				<td><%=automobile.getBasePrice() %></td>
	  			</tr>
	  			<% Set<String> optionSets = automobile.getOptionSetsName(); %>
	  			<% for(String optionSet : optionSets){ %>
	  				<tr>
	  					<td><%=optionSet %></td>
	  					<td>
	  						<select class="form-control" name=<%=optionSet %>>
	  							<%Set<String> options = automobile.getOptions(optionSet); %>
	  							<%for(String option : options){ %>
	  								<option value="<%=option %>"><%=option %></option>
	  							<%} %>
	  						</select>
	  					</td>
	  				</tr>
	  			<%} %>
	  			<tr>
	  				<td>
	  				</td>
	  				<td>
	  					<input type="submit" class="btn btn-success" value="Done">
	  				</td>
	  			</tr>
			</table>
		</form>
	</div>
</body>
</html>