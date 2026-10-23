/**
 * File: Classroom.java
 *
 * EXPLAIN LIKE I AM 5 (ELI5):
 * - WHAT IT DOES: It is like a digital school room with a name, a teacher, and a bunch of students inside.
 * - WHY IT IS USED: To keep everyone in the right room so Math students do not get mixed up with Art students!
 */

package com.gurukul.models;

import java.io.Serializable;
import java.sql.Timestamp;

public class Classroom implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String description;
    private int teacherId;
    private String teacherName;
    private String classCode;
    private Timestamp createdAt;
    private int studentCount;

    public Classroom() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }

    public String getClassCode() { return classCode; }
    public void setClassCode(String classCode) { this.classCode = classCode; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public int getStudentCount() { return studentCount; }
    public void setStudentCount(int studentCount) { this.studentCount = studentCount; }
}
