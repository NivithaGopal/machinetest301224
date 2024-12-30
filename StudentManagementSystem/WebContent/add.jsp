<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Student Management System-Add Details</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	align-items: center;
	height: 100vh;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

nav {
	background-color: #4CAF50;
	color: white;
	padding: 15px 30px;
	text-align: center;
}

nav h1 {
	margin: 0;
	font-size: 28px;
	font-weight: bold;
	letter-spacing: 1px;
	text-transform: uppercase;
}

nav ul {
	list-style: none;
	padding: 0;
	margin: 15px 0 0;
	text-align: center;
}

nav ul li {
	display: inline-block;
	margin: 0 15px;
}

nav ul li a {
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: 500;
	padding: 10px 20px;
	border-radius: 25px;
}

nav ul li a:hover {
	background-color: #45a049;
	transform: translateY(-2px);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
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
	<!-- Navbar Starts -->
	<nav>
		<h1>
			<strong>Online Student Management System</strong>
		</h1>

		<div>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="add.jsp" aria-current="page">Add</a></li>
				<li><a href="#">Delete</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navbar Ends -->
	<center>
	<div class="form-div">

		<h2>Enter Student Details</h2>
		<form action="addDetailsAction.jsp" method="post" onsubmit="return validateform()" >
            <label>Name :</label>
            <input type="text" id="name" name="name" placeholder="Enter student name">      
            <label>Age :</label>
            <input type="text" id="age" name="age" placeholder="Enter age of student">
            <label>Major :</label>
            <input type="text" id="major" name="major" placeholder="Enter the major field of student">
            <label>Year :</label>
            <input type="text" id="year" name="year" placeholder="Enter the year of student">
            <input type="submit" value="Save">

    </form>
</div>
</center>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

