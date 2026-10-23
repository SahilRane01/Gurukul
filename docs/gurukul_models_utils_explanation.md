# Gurukul Data Models & Utility Architecture - Exhaustive Reference

This document covers all Java Beans, Data Transfer Objects (DTOs), and Utilities powering Gurukul.

## [`UserProfile.java`](file:///root/gurukul/src/main/java/com/gurukul/models/UserProfile.java)
**Location**: `src/main/java/com/gurukul/models/UserProfile.java`  
**Purpose**: User Account Identity Model

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `String` | `fullName` | Property storing fullName value |
| `String` | `userName` | Property storing userName value |
| `String` | `email` | Property storing email value |
| `String` | `phone` | Property storing phone value |
| `String` | `role` | Property storing role value |
| `String` | `course` | Property storing course value |
| `String` | `batch` | Property storing batch value |
| `String` | `specialization` | Property storing specialization value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `String getFullName()`: Getter/Setter or business helper.
- `void setFullName(String fullName)`: Getter/Setter or business helper.
- `String getUserName()`: Getter/Setter or business helper.
- `void setUserName(String userName)`: Getter/Setter or business helper.
- `String getEmail()`: Getter/Setter or business helper.
- `void setEmail(String email)`: Getter/Setter or business helper.
- `String getPhone()`: Getter/Setter or business helper.
- `void setPhone(String phone)`: Getter/Setter or business helper.
- `String getRole()`: Getter/Setter or business helper.
- `void setRole(String role)`: Getter/Setter or business helper.
- `String getCourse()`: Getter/Setter or business helper.
- `void setCourse(String course)`: Getter/Setter or business helper.
- `String getBatch()`: Getter/Setter or business helper.
- `void setBatch(String batch)`: Getter/Setter or business helper.
- `String getSpecialization()`: Getter/Setter or business helper.
- `void setSpecialization(String specialization)`: Getter/Setter or business helper.

---

## [`Classroom.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Classroom.java)
**Location**: `src/main/java/com/gurukul/models/Classroom.java`  
**Purpose**: Virtual Course Space Model

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `String` | `name` | Property storing name value |
| `String` | `description` | Property storing description value |
| `int` | `teacherId` | Property storing teacherId value |
| `String` | `teacherName` | Property storing teacherName value |
| `String` | `classCode` | Property storing classCode value |
| `Timestamp` | `createdAt` | Property storing createdAt value |
| `int` | `studentCount` | Property storing studentCount value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `String getName()`: Getter/Setter or business helper.
- `void setName(String name)`: Getter/Setter or business helper.
- `String getDescription()`: Getter/Setter or business helper.
- `void setDescription(String description)`: Getter/Setter or business helper.
- `int getTeacherId()`: Getter/Setter or business helper.
- `void setTeacherId(int teacherId)`: Getter/Setter or business helper.
- `String getTeacherName()`: Getter/Setter or business helper.
- `void setTeacherName(String teacherName)`: Getter/Setter or business helper.
- `String getClassCode()`: Getter/Setter or business helper.
- `void setClassCode(String classCode)`: Getter/Setter or business helper.
- `Timestamp getCreatedAt()`: Getter/Setter or business helper.
- `void setCreatedAt(Timestamp createdAt)`: Getter/Setter or business helper.
- `int getStudentCount()`: Getter/Setter or business helper.
- `void setStudentCount(int studentCount)`: Getter/Setter or business helper.

---

## [`Assignment.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Assignment.java)
**Location**: `src/main/java/com/gurukul/models/Assignment.java`  
**Purpose**: Coursework & Homework Task

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `classId` | Property storing classId value |
| `String` | `title` | Property storing title value |
| `String` | `description` | Property storing description value |
| `Date` | `dueDate` | Property storing dueDate value |
| `int` | `maxMarks` | Property storing maxMarks value |
| `Timestamp` | `createdAt` | Property storing createdAt value |
| `int` | `submissionCount` | Property storing submissionCount value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getClassId()`: Getter/Setter or business helper.
- `void setClassId(int classId)`: Getter/Setter or business helper.
- `String getTitle()`: Getter/Setter or business helper.
- `void setTitle(String title)`: Getter/Setter or business helper.
- `String getDescription()`: Getter/Setter or business helper.
- `void setDescription(String description)`: Getter/Setter or business helper.
- `Date getDueDate()`: Getter/Setter or business helper.
- `void setDueDate(Date dueDate)`: Getter/Setter or business helper.
- `int getMaxMarks()`: Getter/Setter or business helper.
- `void setMaxMarks(int maxMarks)`: Getter/Setter or business helper.
- `Timestamp getCreatedAt()`: Getter/Setter or business helper.
- `void setCreatedAt(Timestamp createdAt)`: Getter/Setter or business helper.
- `int getSubmissionCount()`: Getter/Setter or business helper.
- `void setSubmissionCount(int submissionCount)`: Getter/Setter or business helper.

---

## [`Submission.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Submission.java)
**Location**: `src/main/java/com/gurukul/models/Submission.java`  
**Purpose**: Student Work Submission

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `assignmentId` | Property storing assignmentId value |
| `int` | `studentId` | Property storing studentId value |
| `String` | `studentName` | Property storing studentName value |
| `String` | `textContent` | Property storing textContent value |
| `String` | `fileName` | Property storing fileName value |
| `String` | `filePath` | Property storing filePath value |
| `Integer` | `grade` | Property storing grade value |
| `String` | `feedback` | Property storing feedback value |
| `Timestamp` | `submittedAt` | Property storing submittedAt value |
| `Timestamp` | `gradedAt` | Property storing gradedAt value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getAssignmentId()`: Getter/Setter or business helper.
- `void setAssignmentId(int assignmentId)`: Getter/Setter or business helper.
- `int getStudentId()`: Getter/Setter or business helper.
- `void setStudentId(int studentId)`: Getter/Setter or business helper.
- `String getStudentName()`: Getter/Setter or business helper.
- `void setStudentName(String studentName)`: Getter/Setter or business helper.
- `String getTextContent()`: Getter/Setter or business helper.
- `void setTextContent(String textContent)`: Getter/Setter or business helper.
- `String getFileName()`: Getter/Setter or business helper.
- `void setFileName(String fileName)`: Getter/Setter or business helper.
- `String getFilePath()`: Getter/Setter or business helper.
- `void setFilePath(String filePath)`: Getter/Setter or business helper.
- `Integer getGrade()`: Getter/Setter or business helper.
- `void setGrade(Integer grade)`: Getter/Setter or business helper.
- `String getFeedback()`: Getter/Setter or business helper.
- `void setFeedback(String feedback)`: Getter/Setter or business helper.
- `Timestamp getSubmittedAt()`: Getter/Setter or business helper.
- `void setSubmittedAt(Timestamp submittedAt)`: Getter/Setter or business helper.
- `Timestamp getGradedAt()`: Getter/Setter or business helper.
- `void setGradedAt(Timestamp gradedAt)`: Getter/Setter or business helper.

---

## [`Quiz.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Quiz.java)
**Location**: `src/main/java/com/gurukul/models/Quiz.java`  
**Purpose**: Classroom Assessment Entity

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `classId` | Property storing classId value |
| `String` | `title` | Property storing title value |
| `String` | `description` | Property storing description value |
| `int` | `durationMinutes` | Property storing durationMinutes value |
| `Date` | `dueDate` | Property storing dueDate value |
| `Timestamp` | `createdAt` | Property storing createdAt value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getClassId()`: Getter/Setter or business helper.
- `void setClassId(int classId)`: Getter/Setter or business helper.
- `String getTitle()`: Getter/Setter or business helper.
- `void setTitle(String title)`: Getter/Setter or business helper.
- `String getDescription()`: Getter/Setter or business helper.
- `void setDescription(String description)`: Getter/Setter or business helper.
- `int getDurationMinutes()`: Getter/Setter or business helper.
- `void setDurationMinutes(int durationMinutes)`: Getter/Setter or business helper.
- `Date getDueDate()`: Getter/Setter or business helper.
- `void setDueDate(Date dueDate)`: Getter/Setter or business helper.
- `Timestamp getCreatedAt()`: Getter/Setter or business helper.
- `void setCreatedAt(Timestamp createdAt)`: Getter/Setter or business helper.

---

## [`QuizQuestion.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizQuestion.java)
**Location**: `src/main/java/com/gurukul/models/QuizQuestion.java`  
**Purpose**: Multiple-Choice Question Item

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `quizId` | Property storing quizId value |
| `String` | `questionText` | Property storing questionText value |
| `String` | `optionA` | Property storing optionA value |
| `String` | `optionB` | Property storing optionB value |
| `String` | `optionC` | Property storing optionC value |
| `String` | `optionD` | Property storing optionD value |
| `String` | `correctOption` | Property storing correctOption value |
| `int` | `marks` | Property storing marks value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getQuizId()`: Getter/Setter or business helper.
- `void setQuizId(int quizId)`: Getter/Setter or business helper.
- `String getQuestionText()`: Getter/Setter or business helper.
- `void setQuestionText(String questionText)`: Getter/Setter or business helper.
- `String getOptionA()`: Getter/Setter or business helper.
- `void setOptionA(String optionA)`: Getter/Setter or business helper.
- `String getOptionB()`: Getter/Setter or business helper.
- `void setOptionB(String optionB)`: Getter/Setter or business helper.
- `String getOptionC()`: Getter/Setter or business helper.
- `void setOptionC(String optionC)`: Getter/Setter or business helper.
- `String getOptionD()`: Getter/Setter or business helper.
- `void setOptionD(String optionD)`: Getter/Setter or business helper.
- `String getCorrectOption()`: Getter/Setter or business helper.
- `void setCorrectOption(String correctOption)`: Getter/Setter or business helper.
- `int getMarks()`: Getter/Setter or business helper.
- `void setMarks(int marks)`: Getter/Setter or business helper.

---

## [`QuizAnswer.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizAnswer.java)
**Location**: `src/main/java/com/gurukul/models/QuizAnswer.java`  
**Purpose**: Student Answer Choice Record

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `submissionId` | Property storing submissionId value |
| `int` | `questionId` | Property storing questionId value |
| `String` | `selectedOption` | Property storing selectedOption value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getSubmissionId()`: Getter/Setter or business helper.
- `void setSubmissionId(int submissionId)`: Getter/Setter or business helper.
- `int getQuestionId()`: Getter/Setter or business helper.
- `void setQuestionId(int questionId)`: Getter/Setter or business helper.
- `String getSelectedOption()`: Getter/Setter or business helper.
- `void setSelectedOption(String selectedOption)`: Getter/Setter or business helper.

---

## [`QuizSubmission.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizSubmission.java)
**Location**: `src/main/java/com/gurukul/models/QuizSubmission.java`  
**Purpose**: Completed Quiz Grading Record

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `quizId` | Property storing quizId value |
| `int` | `studentId` | Property storing studentId value |
| `int` | `score` | Property storing score value |
| `int` | `totalMarks` | Property storing totalMarks value |
| `Timestamp` | `submittedAt` | Property storing submittedAt value |
| `String` | `studentName` | Property storing studentName value |
| `String` | `quizTitle` | Property storing quizTitle value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getQuizId()`: Getter/Setter or business helper.
- `void setQuizId(int quizId)`: Getter/Setter or business helper.
- `int getStudentId()`: Getter/Setter or business helper.
- `void setStudentId(int studentId)`: Getter/Setter or business helper.
- `int getScore()`: Getter/Setter or business helper.
- `void setScore(int score)`: Getter/Setter or business helper.
- `int getTotalMarks()`: Getter/Setter or business helper.
- `void setTotalMarks(int totalMarks)`: Getter/Setter or business helper.
- `Timestamp getSubmittedAt()`: Getter/Setter or business helper.
- `void setSubmittedAt(Timestamp submittedAt)`: Getter/Setter or business helper.
- `String getStudentName()`: Getter/Setter or business helper.
- `void setStudentName(String studentName)`: Getter/Setter or business helper.
- `String getQuizTitle()`: Getter/Setter or business helper.
- `void setQuizTitle(String quizTitle)`: Getter/Setter or business helper.

---

## [`StudentResult.java`](file:///root/gurukul/src/main/java/com/gurukul/models/StudentResult.java)
**Location**: `src/main/java/com/gurukul/models/StudentResult.java`  
**Purpose**: Academic Transcript Statement

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `classId` | Property storing classId value |
| `int` | `studentId` | Property storing studentId value |
| `String` | `studentName` | Property storing studentName value |
| `int` | `theoryMarks` | Property storing theoryMarks value |
| `int` | `internalMarks` | Property storing internalMarks value |
| `int` | `vivaMarks` | Property storing vivaMarks value |
| `int` | `totalMarks` | Property storing totalMarks value |
| `String` | `grade` | Property storing grade value |
| `String` | `status` | Property storing status value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getClassId()`: Getter/Setter or business helper.
- `void setClassId(int classId)`: Getter/Setter or business helper.
- `int getStudentId()`: Getter/Setter or business helper.
- `void setStudentId(int studentId)`: Getter/Setter or business helper.
- `String getStudentName()`: Getter/Setter or business helper.
- `void setStudentName(String studentName)`: Getter/Setter or business helper.
- `int getTheoryMarks()`: Getter/Setter or business helper.
- `void setTheoryMarks(int theoryMarks)`: Getter/Setter or business helper.
- `int getInternalMarks()`: Getter/Setter or business helper.
- `void setInternalMarks(int internalMarks)`: Getter/Setter or business helper.
- `int getVivaMarks()`: Getter/Setter or business helper.
- `void setVivaMarks(int vivaMarks)`: Getter/Setter or business helper.
- `int getTotalMarks()`: Getter/Setter or business helper.
- `void setTotalMarks(int totalMarks)`: Getter/Setter or business helper.
- `String getGrade()`: Getter/Setter or business helper.
- `void setGrade(String grade)`: Getter/Setter or business helper.
- `String getStatus()`: Getter/Setter or business helper.
- `void setStatus(String status)`: Getter/Setter or business helper.

---

## [`ResultConfig.java`](file:///root/gurukul/src/main/java/com/gurukul/models/ResultConfig.java)
**Location**: `src/main/java/com/gurukul/models/ResultConfig.java`  
**Purpose**: Grading Formula & Rubric Thresholds

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `classId` | Property storing classId value |
| `int` | `theoryMax` | Property storing theoryMax value |
| `int` | `theoryPass` | Property storing theoryPass value |
| `int` | `internalMax` | Property storing internalMax value |
| `int` | `internalPass` | Property storing internalPass value |
| `int` | `vivaMax` | Property storing vivaMax value |
| `int` | `vivaPass` | Property storing vivaPass value |
| `int` | `gradeA` | Property storing gradeA value |
| `int` | `gradeB` | Property storing gradeB value |
| `int` | `gradeC` | Property storing gradeC value |
| `int` | `gradeD` | Property storing gradeD value |

### Public Methods & Accessors
- `int getClassId()`: Getter/Setter or business helper.
- `void setClassId(int classId)`: Getter/Setter or business helper.
- `int getTheoryMax()`: Getter/Setter or business helper.
- `void setTheoryMax(int theoryMax)`: Getter/Setter or business helper.
- `int getTheoryPass()`: Getter/Setter or business helper.
- `void setTheoryPass(int theoryPass)`: Getter/Setter or business helper.
- `int getInternalMax()`: Getter/Setter or business helper.
- `void setInternalMax(int internalMax)`: Getter/Setter or business helper.
- `int getInternalPass()`: Getter/Setter or business helper.
- `void setInternalPass(int internalPass)`: Getter/Setter or business helper.
- `int getVivaMax()`: Getter/Setter or business helper.
- `void setVivaMax(int vivaMax)`: Getter/Setter or business helper.
- `int getVivaPass()`: Getter/Setter or business helper.
- `void setVivaPass(int vivaPass)`: Getter/Setter or business helper.
- `int getGradeA()`: Getter/Setter or business helper.
- `void setGradeA(int gradeA)`: Getter/Setter or business helper.
- `int getGradeB()`: Getter/Setter or business helper.
- `void setGradeB(int gradeB)`: Getter/Setter or business helper.
- `int getGradeC()`: Getter/Setter or business helper.
- `void setGradeC(int gradeC)`: Getter/Setter or business helper.
- `int getGradeD()`: Getter/Setter or business helper.
- `void setGradeD(int gradeD)`: Getter/Setter or business helper.

---

## [`LeaveRequest.java`](file:///root/gurukul/src/main/java/com/gurukul/models/LeaveRequest.java)
**Location**: `src/main/java/com/gurukul/models/LeaveRequest.java`  
**Purpose**: Leave Application Record

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `studentId` | Property storing studentId value |
| `String` | `studentName` | Property storing studentName value |
| `String` | `reason` | Property storing reason value |
| `Date` | `startDate` | Property storing startDate value |
| `Date` | `endDate` | Property storing endDate value |
| `String` | `status` | Property storing status value |
| `Timestamp` | `appliedAt` | Property storing appliedAt value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getStudentId()`: Getter/Setter or business helper.
- `void setStudentId(int studentId)`: Getter/Setter or business helper.
- `String getStudentName()`: Getter/Setter or business helper.
- `void setStudentName(String studentName)`: Getter/Setter or business helper.
- `String getReason()`: Getter/Setter or business helper.
- `void setReason(String reason)`: Getter/Setter or business helper.
- `Date getStartDate()`: Getter/Setter or business helper.
- `void setStartDate(Date startDate)`: Getter/Setter or business helper.
- `Date getEndDate()`: Getter/Setter or business helper.
- `void setEndDate(Date endDate)`: Getter/Setter or business helper.
- `String getStatus()`: Getter/Setter or business helper.
- `void setStatus(String status)`: Getter/Setter or business helper.
- `Timestamp getAppliedAt()`: Getter/Setter or business helper.
- `void setAppliedAt(Timestamp appliedAt)`: Getter/Setter or business helper.

---

## [`NoticeBoard.java`](file:///root/gurukul/src/main/java/com/gurukul/models/NoticeBoard.java)
**Location**: `src/main/java/com/gurukul/models/NoticeBoard.java`  
**Purpose**: Campus Circular Announcement

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `String` | `heading` | Property storing heading value |
| `String` | `body` | Property storing body value |
| `Timestamp` | `createdAt` | Property storing createdAt value |
| `String` | `whom` | Property storing whom value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `String getHeading()`: Getter/Setter or business helper.
- `void setHeading(String heading)`: Getter/Setter or business helper.
- `String getBody()`: Getter/Setter or business helper.
- `void setBody(String body)`: Getter/Setter or business helper.
- `Timestamp getCreatedAt()`: Getter/Setter or business helper.
- `void setCreatedAt(Timestamp createdAt)`: Getter/Setter or business helper.
- `String getWhom()`: Getter/Setter or business helper.
- `void setWhom(String whom)`: Getter/Setter or business helper.

---

## [`Announcement.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Announcement.java)
**Location**: `src/main/java/com/gurukul/models/Announcement.java`  
**Purpose**: Classroom Feed Post

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `int` | `classId` | Property storing classId value |
| `int` | `authorId` | Property storing authorId value |
| `String` | `authorName` | Property storing authorName value |
| `String` | `content` | Property storing content value |
| `Timestamp` | `createdAt` | Property storing createdAt value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `int getClassId()`: Getter/Setter or business helper.
- `void setClassId(int classId)`: Getter/Setter or business helper.
- `int getAuthorId()`: Getter/Setter or business helper.
- `void setAuthorId(int authorId)`: Getter/Setter or business helper.
- `String getAuthorName()`: Getter/Setter or business helper.
- `void setAuthorName(String authorName)`: Getter/Setter or business helper.
- `String getContent()`: Getter/Setter or business helper.
- `void setContent(String content)`: Getter/Setter or business helper.
- `Timestamp getCreatedAt()`: Getter/Setter or business helper.
- `void setCreatedAt(Timestamp createdAt)`: Getter/Setter or business helper.

---

## [`EventBean.java`](file:///root/gurukul/src/main/java/com/gurukul/models/EventBean.java)
**Location**: `src/main/java/com/gurukul/models/EventBean.java`  
**Purpose**: Academic Calendar Event

### Encapsulated Properties & Data Fields
| Type | Field Name | Functional Meaning |
| :--- | :--- | :--- |
| `int` | `id` | Property storing id value |
| `String` | `eventName` | Property storing eventName value |
| `Date` | `eventDate` | Property storing eventDate value |
| `String` | `description` | Property storing description value |

### Public Methods & Accessors
- `int getId()`: Getter/Setter or business helper.
- `void setId(int id)`: Getter/Setter or business helper.
- `String getEventName()`: Getter/Setter or business helper.
- `void setEventName(String eventName)`: Getter/Setter or business helper.
- `Date getEventDate()`: Getter/Setter or business helper.
- `void setEventDate(Date eventDate)`: Getter/Setter or business helper.
- `String getDescription()`: Getter/Setter or business helper.
- `void setDescription(String description)`: Getter/Setter or business helper.

---

## [`DBConnection.java`](file:///root/gurukul/src/main/java/com/gurukul/utils/DBConnection.java)
**Location**: `src/main/java/com/gurukul/utils/DBConnection.java`  
**Purpose**: Central JDBC Connection Factory

---

