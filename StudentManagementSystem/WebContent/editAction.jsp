<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, dbconnection.dbconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student Details</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String major = request.getParameter("major");
    String year = request.getParameter("year");

    try {
        dbconnection dbConn = new dbconnection();
        Connection conn = dbConn.getConnection();

        String sql = "UPDATE students SET name = ?, age = ?, major = ?, year = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, major);
        ps.setString(4, year);
        ps.setInt(5, Integer.parseInt(id));

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
%>
            <script>
                alert("Student details updated successfully!");
                window.location.href = "index.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to update student details!");
                window.location.href = "edit.jsp?id=<%= id %>";
            </script>
<%
        }

        ps.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
%>
        <script>
            alert("An error occurred. Please try again.");
            window.location.href = "edit.jsp?id=<%= id %>";
        </script>
<%
    }
%>

</body>
</html>