/**
 * File: DownloadTemplateServlet.java
 *
 * OVERVIEW:
 * - WHAT IT DOES: It gives the teacher a blank fill-in-the-blanks sheet (like an Excel sheet) to download.
 * - WHY IT IS USED: So the teacher can easily type all student names in one list without making mistakes!
 */

package com.gurukul.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/downloadTemplate")
public class DownloadTemplateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"students_template.csv\"");
        
        try (PrintWriter writer = response.getWriter()) {
            writer.println("FullName,Username,Email,Phone,Course,Batch,Specialization,Password");
            writer.println("John Doe,johndoe123,john@gurukul.edu,9876543210,B.Tech,2024,CS,Password123");
        }
    }
}
