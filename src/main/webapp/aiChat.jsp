<%--
  File: aiChat.jsp
  
  EXPLAIN LIKE I AM 5 (ELI5):
  - WHAT IT DOES: A secret pipeline that passes messages back and forth with the smart AI robot brain.
  - WHY IT IS USED: So the web page can chat with the robot without getting blocked or showing secret codes.
--%>

<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.net.*" %>
<%
    // Read incoming JSON body
    StringBuilder sb = new StringBuilder();
    String line;
    try (BufferedReader r = request.getReader()) {
        while ((line = r.readLine()) != null) sb.append(line);
    }
    String body = sb.toString();

    HttpURLConnection conn = null;
    try {
        URL url = new URL("https://lyricist-justly-visiting.ngrok-free.dev/chat");
        conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(60000);
        conn.setReadTimeout(300000);
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setRequestProperty("ngrok-skip-browser-warning", "true");
        conn.setRequestProperty("User-Agent", "GurkulServer/1.0");

        // Write body
        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes("UTF-8"));
            os.flush();
        }

        int status = conn.getResponseCode();
        InputStream is = (status >= 200 && status < 300) ? conn.getInputStream() : conn.getErrorStream();

        StringBuilder resp = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
            String ln;
            while ((ln = br.readLine()) != null) resp.append(ln);
        }

        response.setStatus(status);
        out.print(resp.toString());

    } catch (Exception e) {
        response.setStatus(500);
        out.print("{\"response\": \"AI service error: " + e.getMessage().replace("\"", "'") + "\"}");
    } finally {
        if (conn != null) conn.disconnect();
    }
%>
