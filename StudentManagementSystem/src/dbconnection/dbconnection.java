package dbconnection;

import java.sql.*;

public class dbconnection {
    public static final String host_address = "localhost";
    public static final String port_number = "3306";
    public static final String username = "root";
    public static final String password = "";
    public static final String database = "student_managementsystem";

    private static final String URL = "jdbc:mysql://" + host_address + ":" + port_number + "/" + database;

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("DriverNotFound:" + e.getMessage());
        }
        return DriverManager.getConnection(URL, username, password);
    }
}
