# Gurukul Backend Controllers - Exhaustive Logic & Flow Guide

This document provides a thorough analysis of every backend controller in Gurukul, detailing each class structure, method, condition, SQL transaction, and flow.

## [`LoginServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LoginServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/LoginServlet.java`  
**Functional Role**: User Authentication Gateway

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class LoginServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/login")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (rs.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (password.equals(actual_pwd)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.

### 4. Database Queries Executed
- ```sql
  SELECT * FROM users WHERE username = ?
  ```

---

## [`LogoutServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LogoutServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/LogoutServlet.java`  
**Functional Role**: Session Invalidation & Termination

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class LogoutServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/logout")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doGet(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (session != null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.

---

## [`RegistrationServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/RegistrationServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/RegistrationServlet.java`  
**Functional Role**: User Account Provisioning

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class RegistrationServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/registration")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `protected void doGet(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (!password.equals(c_password)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  INSERT INTO users (full_name, username, email, phone, role, course, batch, specialization, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  ```

---

## [`ClassController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/ClassController.java)
**Location**: `src/main/java/com/gurukul/controllers/ClassController.java`  
**Functional Role**: Classroom Lifecycle & Enrollment

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class ClassController extends HttpServlet`
- **Annotations**: `@WebServlet("/classAction")`, `@Override`

### 2. Method Signatures & Internal Execution Flow
#### Method: `private String generateClassCode()`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (source == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("CREATE_CLASS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (!rs.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if ("JOIN_CLASS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Student".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (code != null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rs.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if ("DELETE_CLASS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("POST_ANNOUNCEMENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("LEAVE_CLASS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  INSERT INTO class_announcements (class_id, author_id, content) VALUES (?, ?, ?)
  ```
- ```sql
  INSERT IGNORE INTO class_students (class_id, student_id) VALUES (?, ?)
  ```
- ```sql
  INSERT INTO classes (name, description, teacher_id, class_code) VALUES (?, ?, ?, ?)
  ```
- ```sql
  DELETE FROM class_students WHERE class_id = ? AND student_id = ?
  ```
- ```sql
  SELECT id FROM classes WHERE class_code = ?
  ```
- ```sql
  DELETE FROM classes WHERE id = ? AND teacher_id = ?
  ```

---

## [`AssignmentController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AssignmentController.java)
**Location**: `src/main/java/com/gurukul/controllers/AssignmentController.java`  
**Functional Role**: Homework & Coursework Management

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class AssignmentController extends HttpServlet`
- **Annotations**: `@WebServlet("/assignmentAction")`, `@Override`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("CREATE_ASSIGNMENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (dueDateStr != null && !dueDateStr.isEmpty()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_ASSIGNMENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("GRADE_SUBMISSION".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.

### 4. Database Queries Executed
- ```sql
  DELETE FROM assignments WHERE id = ?
  ```
- ```sql
  UPDATE submissions SET grade = ?, feedback = ?, graded_at = NOW() WHERE id = ?
  ```
- ```sql
  INSERT INTO assignments (class_id, title, description, due_date, max_marks) VALUES (?, ?, ?, ?, ?)
  ```

---

## [`SubmissionController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/SubmissionController.java)
**Location**: `src/main/java/com/gurukul/controllers/SubmissionController.java`  
**Functional Role**: Student Homework Grading

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class SubmissionController extends HttpServlet`
- **Annotations**: `@WebServlet("/submitAction")`, `@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1 MB
    maxFileSize       = 10 * 1024 * 1024,  // 10 MB
    maxRequestSize    = 15 * 1024 * 1024   // 15 MB
)`, `@Override`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Student".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("SUBMIT_ASSIGNMENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (filePart != null && filePart.getSize()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!dir.exists()`
  - *Purpose*: Evaluates application state or query outcome.

### 4. Database Queries Executed
- ```sql
  INSERT INTO submissions (assignment_id, student_id, text_content, file_name, file_path)
  ```

---

## [`AttendanceController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AttendanceController.java)
**Location**: `src/main/java/com/gurukul/controllers/AttendanceController.java`  
**Functional Role**: Attendance Roll Call & Stats

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class AttendanceController extends HttpServlet`
- **Annotations**: `@WebServlet("/attendanceAction")`, `@Override`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("MARK_ATTENDANCE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (studentIds != null && statuses != null && studentIds.length == statuses.length)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  INSERT INTO attendance (student_id, date, subject, status, marked_by)
  ```

---

## [`QuizController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/QuizController.java)
**Location**: `src/main/java/com/gurukul/controllers/QuizController.java`  
**Functional Role**: Interactive Online Assessments

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class QuizController extends HttpServlet`
- **Annotations**: `@WebServlet("/quizAction")`, `@Override`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("CREATE_QUIZ".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (rs.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (qText != null && !qText.trim()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("SUBMIT_QUIZ".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Student".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (rsCheck.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (selectedOpt != null && selectedOpt.equalsIgnoreCase(correctOpt)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rsSub.next()`
  - *Purpose*: Evaluates application state or query outcome.

### 4. Database Queries Executed
- ```sql
  SELECT id FROM quiz_submissions WHERE quiz_id = ? AND student_id = ?
  ```
- ```sql
  INSERT INTO quizzes (class_id, title, description, duration_minutes) VALUES (?, ?, ?, ?)
  ```
- ```sql
  INSERT INTO quiz_questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option, marks) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  ```
- ```sql
  INSERT INTO quiz_submissions (quiz_id, student_id, score, total_marks) VALUES (?, ?, ?, ?)
  ```
- ```sql
  SELECT id, correct_option, marks FROM quiz_questions WHERE quiz_id = ?
  ```
- ```sql
  INSERT INTO quiz_answers (submission_id, question_id, selected_option) VALUES (?, ?, ?)
  ```

---

## [`ResultController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/ResultController.java)
**Location**: `src/main/java/com/gurukul/controllers/ResultController.java`  
**Functional Role**: Grade Calculation & Rubric Evaluation

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class ResultController extends HttpServlet`
- **Annotations**: `@WebServlet("/resultAction")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (source == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("SAVE_CONFIG".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("SAVE_MARKS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rsC.next()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (totalMax == 0)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (status.equals("PASS")`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (percent >= ga)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (percent >= gb)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (percent >= gc)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (percent >= gd)`
  - *Purpose*: Evaluates application state or query outcome.

### 4. Database Queries Executed
- ```sql
  INSERT INTO student_results (class_id, student_id, theory_marks, internal_marks, viva_marks, total_marks, grade, status)
  ```
- ```sql
  INSERT INTO result_configs (class_id, theory_max, theory_pass, internal_max, internal_pass, viva_max, viva_pass, grade_a, grade_b, grade_c, grade_d)
  ```
- ```sql
  SELECT * FROM result_configs WHERE class_id = ?
  ```

---

## [`LeaveController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LeaveController.java)
**Location**: `src/main/java/com/gurukul/controllers/LeaveController.java`  
**Functional Role**: Leave Request & Approval Pipeline

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class LeaveController extends HttpServlet`
- **Annotations**: `@WebServlet("/leaveAction")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (source == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("APPLY_LEAVE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("UPDATE_LEAVE_STATUS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.

### 4. Database Queries Executed
- ```sql
  UPDATE leave_requests SET status = ? WHERE id = ?
  ```
- ```sql
  INSERT INTO leave_requests (student_id, student_name, reason, start_date, end_date, status) VALUES (?, ?, ?, ?, ?, 'PENDING')
  ```

---

## [`MeetingServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/MeetingServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/MeetingServlet.java`  
**Functional Role**: Live Meeting Room Management

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class MeetingServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/meetingAction")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("START_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rows == 0)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if ("SCHEDULE_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("END_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  INSERT INTO meetings (teacher_id, teacher_name, meeting_id, course, status) VALUES (?, ?, ?, ?, 'ACTIVE')
  ```
- ```sql
  INSERT INTO meetings (teacher_id, teacher_name, meeting_id, course, heading, status, scheduled_time) VALUES (?, ?, ?, ?, ?, 'SCHEDULED', ?)
  ```
- ```sql
  UPDATE meetings SET status = 'ENDED' WHERE meeting_id = ? AND teacher_id = ?
  ```
- ```sql
  UPDATE meetings SET status = 'ACTIVE' WHERE meeting_id = ? AND teacher_id = ?
  ```
- ```sql
  DELETE FROM meetings WHERE meeting_id = ? AND teacher_id = ?
  ```

---

## [`SignalingEndpoint.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/SignalingEndpoint.java)
**Location**: `src/main/java/com/gurukul/controllers/SignalingEndpoint.java`  
**Functional Role**: WebRTC WebSocket Signaling Server

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class SignalingEndpoint`
- **Annotations**: `@ServerEndpoint("/signal/{room}")`, `@OnOpen`, `@PathParam("room")`, `@OnMessage`, `@PathParam("room")`, `@OnClose`, `@PathParam("room")`, `@OnError`

### 2. Method Signatures & Internal Execution Flow
#### Method: `public void onError(Session session, Throwable t)`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `private void sendTo(Session s, String message)`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `private void broadcast(String room, Session exclude, String message)`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `private String extractField(String json, String field)`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (to != null && !to.isEmpty()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (target != null && target.isOpen()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (peers != null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (peers.isEmpty()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (peers == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (!s.getId()`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (idx < 0)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (colon < 0)`
  - *Purpose*: Evaluates application state or query outcome.

---

## [`AiChatServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AiChatServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/AiChatServlet.java`  
**Functional Role**: AI Chatbot Reverse-Proxy Relay

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class AiChatServlet extends HttpServlet`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

---

## [`UserProfileServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/UserProfileServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/UserProfileServlet.java`  
**Functional Role**: Account Profile & Password Updates

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class UserProfileServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/userProfile")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

#### Method: `protected void doGet(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null)`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (name == null || name.trim()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (email == null || email.trim()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (phone == null || phone.trim()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rows > 0)`
  - *Purpose*: Evaluates application state or query outcome.

### 4. Database Queries Executed
- ```sql
  UPDATE users SET full_name=?, email=?, phone=? WHERE id=?
  ```

---

## [`TeacherController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/TeacherController.java)
**Location**: `src/main/java/com/gurukul/controllers/TeacherController.java`  
**Functional Role**: Instructor Administration & CSV Uploads

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class TeacherController extends HttpServlet`
- **Annotations**: `@WebServlet("/teacherAction")`, `@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (source == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_NOTICE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_NOTICE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_EVENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_EVENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_STUDENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("UPDATE_STUDENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (password != null && !password.isEmpty()`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("BULK_UPLOAD_STUDENTS".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (filePart != null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (isHeader)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if (data.length >= 8)`
  - *Purpose*: Evaluates application state or query outcome.

### 4. Database Queries Executed
- ```sql
  INSERT INTO noticeboard (heading, body, whom) VALUES (?, ?, ?)
  ```
- ```sql
  UPDATE users SET full_name = ?, username = ?, email = ?, phone = ?, course = ?, batch = ?, specialization = ?
  ```
- ```sql
  DELETE FROM events WHERE id = ?
  ```
- ```sql
  INSERT INTO events (event_name, event_date, description) VALUES (?, ?, ?)
  ```
- ```sql
  DELETE FROM noticeboard WHERE id = ?
  ```
- ```sql
  INSERT INTO users (full_name, username, email, phone, role, course, batch, specialization, password) VALUES (?, ?, ?, ?, 'Student', ?, ?, ?, ?)
  ```

---

## [`DownloadTemplateServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/DownloadTemplateServlet.java)
**Location**: `src/main/java/com/gurukul/controllers/DownloadTemplateServlet.java`  
**Functional Role**: Roster CSV File Streaming

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class DownloadTemplateServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/downloadTemplate")`, `@gurukul`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doGet(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

---

## [`MeetingServlet.java (Root)`](file:///root/gurukul/src/main/java/com/gurukul/MeetingServlet.java)
**Location**: `src/main/java/com/gurukul/MeetingServlet.java`  
**Functional Role**: Legacy Root Meeting Handler

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class MeetingServlet extends HttpServlet`
- **Annotations**: `@WebServlet("/meetingAction")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if ("START_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if (rows == 0)`
  - *Purpose*: Evaluates application state or query outcome.
- **Branch Check**: `if ("SCHEDULE_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("END_MEETING".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  UPDATE meetings SET status = 'ENDED' WHERE meeting_id = ? AND teacher_id = ?
  ```
- ```sql
  UPDATE meetings SET status = 'ACTIVE' WHERE meeting_id = ? AND teacher_id = ?
  ```
- ```sql
  INSERT INTO meetings (teacher_id, teacher_name, meeting_id, course, status) VALUES (?, ?, ?, ?, 'ACTIVE')
  ```
- ```sql
  INSERT INTO meetings (teacher_id, teacher_name, meeting_id, course, heading, status, scheduled_time) VALUES (?, ?, ?, ?, ?, 'SCHEDULED', ?)
  ```

---

## [`TeacherController.java (Root)`](file:///root/gurukul/src/main/java/com/gurukul/TeacherController.java)
**Location**: `src/main/java/com/gurukul/TeacherController.java`  
**Functional Role**: Legacy Root Teacher Handler

### 1. Structural Architecture & Class Declaration
- **Declaration**: `public class TeacherController extends HttpServlet`
- **Annotations**: `@WebServlet("/teacherAction")`

### 2. Method Signatures & Internal Execution Flow
#### Method: `protected void doPost(HttpServletRequest request, HttpServletResponse response)`
- **Declared Exceptions**: `ServletException, IOException`
- **Execution Steps**:
  1. Unpacks HTTP request parameters and session attributes.
  2. Runs boundary and authorization validation guards.
  3. Interacts with the database using parameterized JDBC prepared statements.
  4. Updates session/request state and performs redirect or forward.

### 3. Detailed Conditional Branches (`if` / `else`)
- **Branch Check**: `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`
  - *Purpose*: Checks if an authenticated user session is active.
  - *If True*: Allows the request to proceed to the protected resource.
  - *If False*: Rejects the request and redirects to `login.jsp`.
- **Branch Check**: `if (source == null)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_NOTICE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_NOTICE".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_EVENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("DELETE_EVENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.
- **Branch Check**: `if ("ADD_STUDENT".equals(action)`
  - *Purpose*: Validates input parameters and action verbs.
  - *If True*: Dispatches the matching operational subroutine.
  - *If False*: Continues evaluating subsequent action branches.

### 4. Database Queries Executed
- ```sql
  INSERT INTO noticeboard (heading, body, whom) VALUES (?, ?, ?)
  ```
- ```sql
  DELETE FROM events WHERE id = ?
  ```
- ```sql
  INSERT INTO events (event_name, event_date, description) VALUES (?, ?, ?)
  ```
- ```sql
  DELETE FROM noticeboard WHERE id = ?
  ```
- ```sql
  INSERT INTO users (full_name, username, email, phone, role, course, batch, specialization, password) VALUES (?, ?, ?, ?, 'Student', ?, ?, ?, ?)
  ```

---

