# Gurukul Frontend JSP Views - Exhaustive Flow & UI Logic Reference

This document provides a detailed breakdown of all 25 JavaServer Pages (JSP) in Gurukul, covering scriptlet flows, conditional rendering, forms, and database integrations.

## [`aiChat.jsp`](file:///root/gurukul/src/main/webapp/aiChat.jsp)
**Location**: `src/main/webapp/aiChat.jsp`  

- **Requires Authentication**: `Public / Landing`
### Conditional Logic & Scriptlet Branches
- `if (conn != null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`alumni_network.jsp`](file:///root/gurukul/src/main/webapp/alumni_network.jsp)
**Location**: `src/main/webapp/alumni_network.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`assignment_detail.jsp`](file:///root/gurukul/src/main/webapp/assignment_detail.jsp)
**Location**: `src/main/webapp/assignment_detail.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `assignmentAction` via `POST`
- Form targeting `submitAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (assignment == null || classroom == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (assignment.getDueDate()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 13 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT c.*, u.full_name AS teacher_name FROM classes c JOIN users u ON u.id = c.teacher_id WHERE c.id = ?`
- `SELECT * FROM assignments WHERE id = ? AND class_id = ?`
- `SELECT * FROM submissions WHERE assignment_id = ? AND student_id = ?`
- `SELECT s.*, u.full_name AS student_name FROM submissions s JOIN users u ON u.id = s.student_id WHERE s.assignment_id = ? ORDER BY s.submitted_at DESC`

---

## [`briefings.jsp`](file:///root/gurukul/src/main/webapp/briefings.jsp)
**Location**: `src/main/webapp/briefings.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `meetingAction` via `POST`
- Form targeting `meetingAction` via `POST`
- Form targeting `meetingAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("deleted".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (scheduledMeetings.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isActive)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!isActive)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 1 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `Delete Mission`
- `SELECT * FROM meetings WHERE status != 'ENDED' ORDER BY scheduled_time ASC, created_at DESC`

---

## [`class_detail.jsp`](file:///root/gurukul/src/main/webapp/class_detail.jsp)
**Location**: `src/main/webapp/class_detail.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `classAction` via `POST`
- Form targeting `assignmentAction` via `POST`
- Form targeting `resultAction` via `POST`
- Form targeting `resultAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (classroom == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (announcements.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 14 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM result_configs WHERE class_id = ?`
- `SELECT c.*, u.full_name AS teacher_name FROM classes c JOIN users u ON u.id = c.teacher_id WHERE c.id = ?`
- `SELECT u.* FROM users u JOIN class_students cs ON cs.student_id = u.id WHERE cs.class_id = ? ORDER BY u.full_name ASC`
- `SELECT sr.*, u.full_name FROM student_results sr JOIN users u ON u.id = sr.student_id WHERE sr.class_id = ?`
- `SELECT * FROM quizzes WHERE class_id = ? ORDER BY created_at DESC`
- `SELECT a.*, (SELECT COUNT(*) FROM submissions s WHERE s.assignment_id = a.id) AS sub_count FROM assignments a WHERE a.class_id = ? ORDER BY a.created_at DESC`
- `SELECT a.*, u.full_name AS author_name FROM class_announcements a JOIN users u ON u.id = a.author_id WHERE a.class_id = ? ORDER BY a.created_at DESC`

---

## [`classes.jsp`](file:///root/gurukul/src/main/webapp/classes.jsp)
**Location**: `src/main/webapp/classes.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `classAction` via `POST`
- Form targeting `classAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("error".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!activeMeetings.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (myClasses.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 2 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT c.*, (SELECT COUNT(*) FROM class_students cs WHERE cs.class_id = c.id) AS student_count`
- `SELECT c.*, u.full_name AS teacher_name,`

---

## [`createEvent.jsp`](file:///root/gurukul/src/main/webapp/createEvent.jsp)
**Location**: `src/main/webapp/createEvent.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `teacherAction` via `POST`
- Form targeting `teacherAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (events.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT * FROM events ORDER BY event_date ASC`

---

## [`createQuiz.jsp`](file:///root/gurukul/src/main/webapp/createQuiz.jsp)
**Location**: `src/main/webapp/createQuiz.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `quizAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (classIdStr == null || classIdStr.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (classroom == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (blocks.length > 1)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM classes WHERE id = ?`

---

## [`createStudent.jsp`](file:///root/gurukul/src/main/webapp/createStudent.jsp)
**Location**: `src/main/webapp/createStudent.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `teacherAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`

---

## [`dashboard.jsp`](file:///root/gurukul/src/main/webapp/dashboard.jsp)
**Location**: `src/main/webapp/dashboard.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `leaveAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (score != null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rsAtt.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!activeMeetings.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (notices.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (events.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (myAssignments.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (myQuizzes.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 4 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT * FROM noticeboard ORDER BY created_at DESC LIMIT 5`
- `SELECT * FROM leave_requests WHERE student_id = ? ORDER BY applied_at DESC`
- `SELECT r.*, c.name as class_name FROM student_results r JOIN classes c ON r.class_id = c.id WHERE r.student_id = ?`
- `SELECT q.id, q.title, c.id as class_id, c.name as class_name, qs.score, qs.total_marks FROM quizzes q JOIN classes c ON q.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN quiz_submissions qs ON q.id = qs.quiz_id AND qs.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY q.created_at DESC LIMIT 5`
- `SELECT a.id, a.title, a.due_date, c.name as class_name, s.grade, (CASE WHEN s.grade IS NOT NULL THEN 'GRADED' WHEN s.id IS NOT NULL THEN 'SUBMITTED' ELSE 'NOT_SUBMITTED' END) as submission_status FROM assignments a JOIN classes c ON a.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN submissions s ON a.id = s.assignment_id AND s.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY a.due_date ASC LIMIT 10`
- `SELECT * FROM events WHERE event_date >= CURDATE() ORDER BY event_date ASC`
- `SELECT COUNT(*) as total, SUM(CASE WHEN status='PRESENT' THEN 1 ELSE 0 END) as present_count FROM attendance WHERE student_id = ?`

---

## [`detailedResult.jsp`](file:///root/gurukul/src/main/webapp/detailedResult.jsp)
**Location**: `src/main/webapp/detailedResult.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("FAIL".equals(rs.getString("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (marksheet.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!hasFailed)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (percent >= 90)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (percent >= 75)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (percent >= 60)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (percent >= 40)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT sr.*, c.name as class_name, rc.theory_max, rc.internal_max, rc.viva_max`

---

## [`home.jsp`](file:///root/gurukul/src/main/webapp/home.jsp)
**Location**: `src/main/webapp/home.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`index.jsp`](file:///root/gurukul/src/main/webapp/index.jsp)
**Location**: `src/main/webapp/index.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (userProfile != null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("Teacher".equalsIgnoreCase(userProfile.getRole()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (index < text.length)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (d < 80)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`krutyam_ai.jsp`](file:///root/gurukul/src/main/webapp/krutyam_ai.jsp)
**Location**: `src/main/webapp/krutyam_ai.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if ("POST".equalsIgnoreCase(request.getMethod()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pIdx != -1)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (uIdx != -1)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (sessionUser != null && parsedPrompt != null && !parsedPrompt.trim()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pLower.contains("event")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pLower.contains("result")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pLower.contains("quiz")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pLower.contains("assignment")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 17 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT * FROM noticeboard ORDER BY created_at DESC LIMIT 5`
- `SELECT COUNT(*) as pending_count FROM assignments a JOIN class_students cs ON a.class_id = cs.class_id LEFT JOIN submissions s ON a.id = s.assignment_id AND s.student_id = cs.student_id WHERE cs.student_id = ? AND s.id IS NULL`
- `SELECT COUNT(*) as total, SUM(CASE WHEN status='PRESENT' THEN 1 ELSE 0 END) as present_count FROM attendance WHERE student_id = ?`
- `SELECT c.name FROM classes c JOIN class_students cs ON c.id = cs.class_id WHERE cs.student_id = ?`
- `SELECT q.title, qs.score FROM quizzes q JOIN classes c ON q.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN quiz_submissions qs ON q.id = qs.quiz_id AND qs.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY q.created_at DESC LIMIT 5`
- `SELECT * FROM events WHERE event_date >= CURDATE() ORDER BY event_date ASC`
- `SELECT r.*, c.name as class_name FROM student_results r JOIN classes c ON r.class_id = c.id WHERE r.student_id = ?`
- `SELECT a.title, a.due_date, (CASE WHEN s.grade IS NOT NULL THEN 'GRADED' WHEN s.id IS NOT NULL THEN 'SUBMITTED' ELSE 'PENDING' END) as status FROM assignments a JOIN classes c ON a.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN submissions s ON a.id = s.assignment_id AND s.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY a.due_date ASC LIMIT 10`
- `INSERT INTO ai_chats (student_id, prompt, response) VALUES (?, ?, ?)`

---

## [`login.jsp`](file:///root/gurukul/src/main/webapp/login.jsp)
**Location**: `src/main/webapp/login.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `login` via `POST`
- Form targeting `registration` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (userProfile != null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("Teacher".equalsIgnoreCase(userProfile.getRole()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("registered".equals(status)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("loggedout".equals(status)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (d<80)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`markAttendance.jsp`](file:///root/gurukul/src/main/webapp/markAttendance.jsp)
**Location**: `src/main/webapp/markAttendance.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `attendanceAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (selectedCourse != null && !selectedCourse.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (selectedCourse != null && !selectedCourse.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (selectedCourse != null && !selectedCourse.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (selectedBatch != null && !selectedBatch.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (selectedBatch != null && !selectedBatch.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("error".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 4 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT id, full_name, username, batch FROM users WHERE role = 'Student' AND course = ?`
- `SELECT DISTINCT course FROM users WHERE role = 'Student' AND course IS NOT NULL ORDER BY course`
- `SELECT DISTINCT batch FROM users WHERE role = 'Student' AND batch IS NOT NULL`

---

## [`meeting.jsp`](file:///root/gurukul/src/main/webapp/meeting.jsp)
**Location**: `src/main/webapp/meeting.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `meetingAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (proto != null && proto.contains("https")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (wsHost == null || wsHost.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (event.key === 'Enter')`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (joinId !== mySocketId)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!mySocketId)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (msg.id !== mySocketId)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 33 additional UI state conditions)*

---

## [`quizResult.jsp`](file:///root/gurukul/src/main/webapp/quizResult.jsp)
**Location**: `src/main/webapp/quizResult.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (quizIdStr == null || classIdStr == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (quiz == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (allSubmissions.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 2 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM quiz_submissions WHERE quiz_id = ? AND student_id = ?`
- `SELECT s.*, u.full_name FROM quiz_submissions s JOIN users u ON u.id = s.student_id WHERE s.quiz_id = ? ORDER BY s.score DESC`
- `SELECT * FROM quizzes WHERE id = ?`
- `SELECT q.id, q.question_text, q.correct_option, q.marks, a.selected_option`

---

## [`schemaDump.jsp`](file:///root/gurukul/src/main/webapp/schemaDump.jsp)
**Location**: `src/main/webapp/schemaDump.jsp`  

- **Requires Authentication**: `Public / Landing`
### Conditional Logic & Scriptlet Branches
- `if (conn != null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`sendNotice.jsp`](file:///root/gurukul/src/main/webapp/sendNotice.jsp)
**Location**: `src/main/webapp/sendNotice.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `teacherAction` via `POST`
- Form targeting `teacherAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (notices.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT * FROM noticeboard ORDER BY created_at DESC`

---

## [`social_hub.jsp`](file:///root/gurukul/src/main/webapp/social_hub.jsp)
**Location**: `src/main/webapp/social_hub.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`takeQuiz.jsp`](file:///root/gurukul/src/main/webapp/takeQuiz.jsp)
**Location**: `src/main/webapp/takeQuiz.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `quizAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (quizIdStr == null || classIdStr == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (quiz == null)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (timeRemaining <= 60)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (timeRemaining <= 0)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT id FROM quiz_submissions WHERE quiz_id = ? AND student_id = ?`
- `SELECT * FROM quiz_questions WHERE quiz_id = ?`
- `SELECT * FROM quizzes WHERE id = ?`

---

## [`teacherDashboard.jsp`](file:///root/gurukul/src/main/webapp/teacherDashboard.jsp)
**Location**: `src/main/webapp/teacherDashboard.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `meetingAction` via `POST`
- Form targeting `leaveAction` via `POST`
- Form targeting `leaveAction` via `POST`
- Form targeting `teacherAction` via `POST`
- Form targeting `teacherAction` via `POST`
- Form targeting `teacherAction` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (sb.getCourse()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(request.getParameter("status")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!activeMeetings.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (pendingLeaves.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (myQuizzes.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (currentPage > totalPages)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (currentPage < 1)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

### Embedded JDBC Scriptlet Queries
- `SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC`
- `SELECT * FROM leave_requests WHERE status = 'PENDING' ORDER BY applied_at ASC`
- `SELECT q.id, q.title, c.name as class_name, c.id as class_id, q.created_at,`
- `SELECT * FROM users WHERE role = 'Student' ORDER BY full_name ASC`

---

## [`userProfile.jsp`](file:///root/gurukul/src/main/webapp/userProfile.jsp)
**Location**: `src/main/webapp/userProfile.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Forms & Submission Endpoints
- Form targeting `userProfile` via `POST`

### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if ("success".equals(status)`: Evaluates user authentication, role, or data presence before rendering UI blocks.

---

## [`viewAttendance.jsp`](file:///root/gurukul/src/main/webapp/viewAttendance.jsp)
**Location**: `src/main/webapp/viewAttendance.jsp`  

- **Requires Authentication**: `Yes (Guarded)`
### Conditional Logic & Scriptlet Branches
- `if (session.getAttribute("user")`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (filterMonth != null && !filterMonth.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (filterSubject != null && !filterSubject.isEmpty()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (params.get(i)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (rs.next()`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- `if (!isTeacher)`: Evaluates user authentication, role, or data presence before rendering UI blocks.
- *(plus 4 additional UI state conditions)*

### Embedded JDBC Scriptlet Queries
- `SELECT u.id, u.full_name, u.course, u.batch,`
- `SELECT date, subject, status, created_at FROM attendance WHERE student_id = ?`
- `SELECT COUNT(*) as total, SUM(CASE WHEN status='PRESENT' THEN 1 ELSE 0 END) as present_count FROM attendance WHERE student_id = ?`

---

