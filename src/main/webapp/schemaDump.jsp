<%--
  File: schemaDump.jsp
  
  EXPLAIN LIKE I AM 5 (ELI5):
  - WHAT IT DOES: A peek inside the computer's memory box to show programmers all the list names and data cubbies.
  - WHY IT IS USED: For the tech doctor to see if all database boxes are neatly in place!
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.gurukul.utils.DBConnection, java.io.*" %>
<%
    Connection conn = null;
    try {
        conn = DBConnection.getConnection();
        DatabaseMetaData meta = conn.getMetaData();
        ResultSet rs = meta.getTables(null, null, "%", new String[]{"TABLE"});
        while(rs.next()) {
            String tableName = rs.getString(3);
            out.println("Table: " + tableName + "<br>");
            ResultSet cols = meta.getColumns(null, null, tableName, null);
            while(cols.next()) {
                out.println("- " + cols.getString("COLUMN_NAME") + " (" + cols.getString("TYPE_NAME") + ")<br>");
            }
            out.println("<br>");
        }
    } catch(Exception e) {
        out.print(e.getMessage());
    } finally {
        if(conn != null) conn.close();
    }
%>
