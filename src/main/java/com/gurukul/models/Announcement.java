/**
 * File: Announcement.java
 *
 * EXPLAIN LIKE I AM 5 (ELI5):
 * - WHAT IT DOES: It is a little sticky note that holds a teacher's message to the class.
 * - WHY IT IS USED: So the computer can remember who wrote the message, what it says, and when it was posted!
 */

package com.gurukul.models;

import java.io.Serializable;
import java.sql.Timestamp;

public class Announcement implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private int classId;
    private int authorId;
    private String authorName;
    private String content;
    private Timestamp createdAt;

    public Announcement() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getClassId() { return classId; }
    public void setClassId(int classId) { this.classId = classId; }

    public int getAuthorId() { return authorId; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }

    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
