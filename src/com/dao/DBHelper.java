package com.dao;


import java.sql.*;

public class DBHelper {

    public static Connection getConn() {


//        String DRIVER = "com.mysql.jdbc.Driver";
//        String URL = "jdbc:mysql://localhost:3306/labelprinter?useUnicode=true&characterEncoding=utf-8";
//        String USER = "root";
//        String PASSWORD = "12345678";
        String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String URL = "jdbc:sqlserver://epszacc:1433;DatabaseName=AIS20100918093112";
        String USER = "sa";
        String PASSWORD = "sa";
        Connection conn = null;
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("连接成功！");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("连接失败！");
        }
        return conn;
    }

    public static Statement createStmt(Connection conn) {
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public static ResultSet executeQuery(Statement stmt, String sql) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static ResultSet executeQuery(PreparedStatement preparedstmt) {
        ResultSet rs = null;
        try {
            rs = preparedstmt.executeQuery();
        } catch (SQLException e) {

            e.printStackTrace();
        }

        return rs;
    }

    public static PreparedStatement prepareStmt(Connection conn, String sql) {
        PreparedStatement pstmt = null;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pstmt;
    }

    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
