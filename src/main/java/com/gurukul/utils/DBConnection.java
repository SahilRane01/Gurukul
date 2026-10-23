/**
 * File: DBConnection.java
 *
 * OVERVIEW:
 * - WHAT IT DOES: It is like a magic key that opens the big toy box (database) where all school info is saved.
 * - WHY IT IS USED: Without this key, the computer cannot read or save any student names, marks, or homework.
 */

package com.gurukul.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import jakarta.servlet.ServletContext;

public class DBConnection {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection(ServletContext context) throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://" + context.getInitParameter("DB_URL") + ":3306/gurukul";
        String user = context.getInitParameter("DB_USERNAME");
        String password = context.getInitParameter("DB_PWD");
        
        Class.forName(DRIVER);
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * Fallback for contexts where ServletContext is not available (tactical use).
     * @deprecated Use getConnection(ServletContext) for configuration-driven access.
     */
    public static Connection getManualConnection() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVER);
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gurukul", "root", "");
    }
}
