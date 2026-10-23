/**
 * File: QuizSubmission.java
 *
 * EXPLAIN LIKE I AM 5 (ELI5):
 * - WHAT IT DOES: It is the finished test paper showing the final score (like 9 out of 10 stars!).
 * - WHY IT IS USED: So the student and teacher can see how well the student did on the quiz.
 */

package com.gurukul.models;

import java.sql.Timestamp;

public class QuizSubmission {
    private int id;
    private int quizId;
    private int studentId;
    private int score;
    private int totalMarks;
    private Timestamp submittedAt;
    
    // Additional fields for joined data
    private String studentName;
    private String quizTitle;

    public QuizSubmission() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuizId() { return quizId; }
    public void setQuizId(int quizId) { this.quizId = quizId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getTotalMarks() { return totalMarks; }
    public void setTotalMarks(int totalMarks) { this.totalMarks = totalMarks; }

    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    
    public String getQuizTitle() { return quizTitle; }
    public void setQuizTitle(String quizTitle) { this.quizTitle = quizTitle; }
}
