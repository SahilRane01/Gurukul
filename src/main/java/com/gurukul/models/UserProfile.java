/**
 * File: UserProfile.java
 *
 * EXPLAIN LIKE I AM 5 (ELI5):
 * - WHAT IT DOES: It is like a student ID badge with your picture, name, role (Teacher or Student), and class.
 * - WHY IT IS USED: So the school computer knows exactly who you are whenever you log in!
 */

package com.gurukul.models;

import java.io.Serializable;

public class UserProfile implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String fullName;
    private String userName;
    private String email;
    private String phone;
    private String role;
    private String course;
    private String batch;
    private String specialization;

    public UserProfile() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public String getBatch() { return batch; }
    public void setBatch(String batch) { this.batch = batch; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
}
