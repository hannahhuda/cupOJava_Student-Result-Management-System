<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Course Offered</title>

</head>

<body>

	<div align=center>

		<h1>Course Details</h1>

	

	<form action="CourseOffer" method="post">

		<table cellspacing="1" cellpadding="1" border="0" width="600" bgcolor="#F4F6F7">

		<colgroup>

       		<col span="1" style="width: 10%;">

       		<col span="1" style="width: 10%;">

       		<col span="1" align="left" style="width: 30%;">

       		<col span="1" style="width: 10%;">

       		<col span="1" align="left" style="width: 30%;">

    	</colgroup>

		<tr bgcolor="#EEEEEE">

			<td align="center">Course Id</td>

			<td align="center">Course Code</td>

			<td align="center">Course Name</td>

			<td align="center">Credit Hour</td>

			<td align="center">Lecturer</td>

		</tr>

<%

int count=0;

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

String sql="SELECT * FROM course";

Statement statement = con.createStatement(); //for retrieving data from db

ResultSet resultSet = statement.executeQuery(sql);

		

while(resultSet.next()){

	count++;

	int id = resultSet.getInt("courseid");

	String course_code = resultSet.getString("course_code");

	String course_name = resultSet.getString("course_name");

	int credit_hour = resultSet.getInt("credit_hour");

	String lect_name = resultSet.getString("lect_name");

%>

		<tr bgcolor="#FFFFFF">

			<td align="center"><%= id %></td>

			<td align="center"><%= course_code %></td>

			<td align="left"><%= course_name %></td>	

			<td align="center"><%= credit_hour %></td>

			<td align="left"><%= lect_name %></td>
			<td align="left"><input type="checkbox" id="courseCheck" name="courseCheck" value="<%= course_name %>"></td>

			
		</tr>

<%}

statement.close();

con.close();

%>
       <tr><td></td><td></td><td></td><td><center><input type="submit" value="Submit"/></center></td></tr>
  
       

		</table>

	</form>

	</div>

<br>

<br>

<div align="center"><form>


</form></div>



<%

String msg = request.getParameter("msg");

if(msg!=null && msg.equals("1")){%>

There is an error! Please check !	

<%	

}

%>



</body>

</html>