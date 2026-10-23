/**
 * File: AiChatServlet.java
 *
 * OVERVIEW:
 * - WHAT IT DOES: It is like a messenger boy running to ask the smart robot brain your question and running back with the answer.
 * - WHY IT IS USED: So when a kid asks for help with math or science, the smart AI robot can answer right away!
 */

package com.gurukul.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

public class AiChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        String requestBody = sb.toString();

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest proxyRequest = HttpRequest.newBuilder()
                .uri(URI.create("https://lyricist-justly-visiting.ngrok-free.dev/chat"))
                .header("Content-Type", "application/json")
                .header("ngrok-skip-browser-warning", "true")
                .POST(HttpRequest.BodyPublishers.ofString(requestBody, StandardCharsets.UTF_8))
                .build();

        try {
            HttpResponse<String> proxyResponse = client.send(proxyRequest, HttpResponse.BodyHandlers.ofString());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(proxyResponse.statusCode());
            response.getWriter().write(proxyResponse.body());
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Proxy request interrupted\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Proxy request failed: " + e.getMessage() + "\"}");
        }
    }
}
