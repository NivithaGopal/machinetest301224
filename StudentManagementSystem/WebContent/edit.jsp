<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, dbconnection.dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student Details</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 800px;
}
form label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}
form input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}
form button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
}
form button:hover {
    background-color: #45a049;
}
</style>
<script type="text/javascript">
function validateform() {
	var name=document.getElementById("name").value;
	var age=document.getElementById("age").value;
	var major=document.getElementById("major").value;
	var year=document.getElementById("year").value;
	
	if (name=="") {
		alert("Student Name is Required!");
		document.getElementById("name").focus();
		return false;
	}
	if (age=="") {
		alert("Student age is Required!");
		document.getElementById("age").focus();
		return false;
	}
	if (major=="") {
		alert("Major is Required!");
		document.getElementById("major").focus();
		return false;
	}
	if (year=="") {
		alert("Year is Required!");
		document.getElementById("year").focus();
		return false;
	}
	
}

</script>
</head>
<body>
<%
    String id = request.getParameter("id");
    String name = "";
    int age = 0;
    String major = "";
    String year = "";

    try {
        dbconnection dbConn = new dbconnection();
        Connection conn = dbConn.getConnection();

        String sql = "SELECT * FROM students WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            age = rs.getInt("age");
            major = rs.getString("major");
            year = rs.getString("year");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<form action="editAction.jsp" method="post" onsubmit="return validateform()">
    <input type="hidden" name="id" value="<%= id %>">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" value="<%= name %>">

    <label for="age">Age</label>
    <input type="number" id="age" name="age" value="<%= age %>">

    <label for="major">Major</label>
    <input type="text" id="major" name="major" value="<%= major %>">

    <label for="year">Year</label>
    <input type="text" id="year" name="year" value="<%= year %>">

    <button type="submit">Update</button>
</form>
</body>
</html>
