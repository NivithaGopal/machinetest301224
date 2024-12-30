<%@ page import="java.sql.*, dbconnection.dbconnection" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        dbconnection dbConn = new dbconnection();
        conn = dbConn.getConnection(); 
        String sql = "INSERT INTO students (name, age, major, year) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, request.getParameter("name"));
        ps.setInt(2, Integer.parseInt(request.getParameter("age")));
        ps.setString(3, request.getParameter("major"));
        ps.setString(4, request.getParameter("year"));

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
        	out.print("<script type='text/javascript'>");
            out.print("alert('service added Successfully');");
            out.print("window.location.href = 'index.jsp';");
            out.print("</script>"); 
        }else{
        	out.print("<script type='text/javascript'>");
            out.print("alert('Failed to add service. Service name may already exist.');");
            out.print("window.location.href = 'add.jsp';");
            out.print("</script>");

        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
%>
