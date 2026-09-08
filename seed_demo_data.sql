/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gurukul
-- ------------------------------------------------------
-- Server version	10.11.18-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `max_marks` int(11) DEFAULT 100,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES
(1,1,'Raft Consensus Algorithm Implementation','Implement the leader election and log replication logic using Java sockets or gRPC.','2026-09-30',100,'2026-09-08 19:00:03'),
(2,2,'Customer Churn Classification Pipeline','Build and evaluate random forest vs XGBoost models on the provided telecom dataset.','2026-10-02',100,'2026-09-08 19:00:03'),
(10,10,'Full Stack Microservices Project','Design and implement REST APIs with JWT authentication and responsive front-end dashboard.','2026-10-15',100,'2026-09-08 19:15:29'),
(11,11,'Shortest Path & Network Flow Optimization','Implement Dijkstra and Ford-Fulkerson algorithms with performance benchmarks.','2026-10-20',100,'2026-09-08 19:15:29');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `status` enum('PRESENT','ABSENT') NOT NULL,
  `marked_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_attendance` (`student_id`,`date`,`subject`),
  KEY `marked_by` (`marked_by`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`marked_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES
(1,3,'2026-09-09','CS401: Distributed Systems','PRESENT',1,'2026-09-08 19:00:03'),
(2,4,'2026-09-09','CS401: Distributed Systems','PRESENT',1,'2026-09-08 19:00:03'),
(3,3,'2026-09-09','IT302: Applied Machine Learning','PRESENT',2,'2026-09-08 19:00:03'),
(4,5,'2026-09-09','IT302: Applied Machine Learning','ABSENT',2,'2026-09-08 19:00:03'),
(5,7,'2026-09-01','CS501: Full Stack Web Architecture','PRESENT',6,'2026-09-08 19:15:29'),
(6,7,'2026-09-02','CS501: Full Stack Web Architecture','PRESENT',6,'2026-09-08 19:15:29'),
(7,7,'2026-09-03','CS501: Full Stack Web Architecture','PRESENT',6,'2026-09-08 19:15:29'),
(8,7,'2026-09-04','CS502: Advanced Data Structures & Algorithms','PRESENT',6,'2026-09-08 19:15:29'),
(9,7,'2026-09-05','CS502: Advanced Data Structures & Algorithms','PRESENT',6,'2026-09-08 19:15:29');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_announcements`
--

DROP TABLE IF EXISTS `class_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `class_announcements_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_announcements_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_announcements`
--

LOCK TABLES `class_announcements` WRITE;
/*!40000 ALTER TABLE `class_announcements` DISABLE KEYS */;
INSERT INTO `class_announcements` VALUES
(1,1,1,'Welcome to CS401! Please review the syllabus and ensure you have Docker & Java installed for lab work.','2026-09-08 19:00:03'),
(2,1,1,'Lab Assignment 1 has been uploaded. Due next Friday at 11:59 PM.','2026-09-08 19:00:03'),
(3,2,2,'Dataset for the Sentiment Analysis project is now available on the drive.','2026-09-08 19:00:03'),
(4,10,6,'Welcome to CS501 Full Stack Web Architecture! Check out the roadmap and syllabus in resources.','2026-09-08 19:15:29'),
(5,10,6,'Reminder: Project proposal submissions are due this Friday.','2026-09-08 19:15:29'),
(6,11,6,'Assignment 1 on Graph Theory & Network Flow has been published.','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `class_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_students`
--

DROP TABLE IF EXISTS `class_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `joined_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enrollment` (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `class_students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_students`
--

LOCK TABLES `class_students` WRITE;
/*!40000 ALTER TABLE `class_students` DISABLE KEYS */;
INSERT INTO `class_students` VALUES
(1,1,3,'2026-09-08 19:00:03'),
(2,1,4,'2026-09-08 19:00:03'),
(3,2,3,'2026-09-08 19:00:03'),
(4,2,5,'2026-09-08 19:00:03'),
(5,10,7,'2026-09-08 19:15:29'),
(6,11,7,'2026-09-08 19:15:29'),
(7,1,7,'2026-09-08 19:15:29'),
(8,2,7,'2026-09-08 19:15:29'),
(9,10,3,'2026-09-08 19:15:29'),
(10,10,4,'2026-09-08 19:15:29'),
(11,11,5,'2026-09-08 19:15:29');
/*!40000 ALTER TABLE `class_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_code` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_code` (`class_code`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES
(1,'CS401: Distributed Systems','Core course covering consensus algorithms, RPC, message queues, and high availability systems.',1,'CS401DS','2026-09-08 19:00:03'),
(2,'IT302: Applied Machine Learning','Advanced elective on neural networks, NLP, and model deployment pipelines.',2,'IT302ML','2026-09-08 19:00:03'),
(10,'CS501: Full Stack Web Architecture','Modern web engineering with React, Node.js, Spring Boot, and Cloud Native deployment.',6,'CS501DEMO','2026-09-08 19:15:29'),
(11,'CS502: Advanced Data Structures & Algorithms','In-depth exploration of graph algorithms, dynamic programming, and system optimization.',6,'CS502DEMO','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(1,'Guest Lecture on Cloud Native Architectures','2026-09-20','Interactive workshop with industry architects covering Kubernetes, microservices, and reactive design patterns.','2026-09-08 19:00:03'),
(2,'Cybersecurity Awareness Workshop','2026-09-25','Hands-on session on ethical hacking, defensive security, and secure coding practices.','2026-09-08 19:00:03'),
(3,'Gurukul Annual Sports Meet','2026-10-05','Track, field, cricket, and badminton tournaments across all departments.','2026-09-08 19:00:03');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `reason` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `applied_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES
(1,5,'Rohan Mehta','Attending National Hackathon Finals at IIT Bombay','2026-09-12','2026-09-15','APPROVED','2026-09-08 19:00:03'),
(2,4,'Diya Sen','Medical appointment and recovery','2026-09-18','2026-09-19','PENDING','2026-09-08 19:00:03'),
(3,7,'Demo Student','Attending National Level Hackathon 2026','2026-09-15','2026-09-17','APPROVED','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(100) DEFAULT NULL,
  `meeting_id` varchar(100) NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `scheduled_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES
(1,1,'Dr. Rajesh Sharma','MEET-CS401-001','Computer Science','CS401: Raft & Paxos Interactive Deep Dive','ACTIVE','2026-09-10 14:00:00','2026-09-08 19:00:03'),
(2,2,'Prof. Ananya Verma','MEET-IT302-002','Information Technology','IT302: Hands-on Transformer Architecture Workshop','ACTIVE','2026-09-11 11:00:00','2026-09-08 19:00:03'),
(3,6,'Demo Teacher','MEET-CS501-LIVE','CS501','Microservices Architecture & System Design Live Q&A','ACTIVE','2026-09-09 02:45:29','2026-09-08 19:15:29'),
(4,6,'Demo Teacher','MEET-CS502-DOUBT','CS502','Dijkstra and Dynamic Programming Doubt Clearing Session','ACTIVE','2026-09-10 00:45:29','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticeboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `whom` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboard`
--

LOCK TABLES `noticeboard` WRITE;
/*!40000 ALTER TABLE `noticeboard` DISABLE KEYS */;
INSERT INTO `noticeboard` VALUES
(1,'Mid-Semester Examinations Schedule','The mid-term examinations for B.Tech CS & IT will commence from October 15th, 2026. Detailed seating arrangement will be published next week.','ALL','2026-09-08 19:00:03'),
(2,'Annual Tech Symposium: HackGurukul 2026','Registration is open for the 48-hour annual hackathon. Submit team proposals before September 30th to participate.','STUDENTS','2026-09-08 19:00:03'),
(3,'Faculty Meeting on Curriculum Revision','All department heads and teaching faculty are requested to attend the seminar hall session this Friday at 3:00 PM.','TEACHERS','2026-09-08 19:00:03');
/*!40000 ALTER TABLE `noticeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_id` (`submission_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `quiz_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
INSERT INTO `quiz_answers` VALUES
(1,1,1,'A'),
(2,1,2,'B'),
(3,2,1,'A'),
(4,2,2,'A');
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL,
  `marks` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES
(1,1,'According to the CAP theorem, what does a system have to sacrifice during a network partition if it guarantees Consistency?','Availability','Latency','Partition Tolerance','Throughput','A',5),
(2,1,'Which consensus algorithm uses term numbers and leader heartbeats to manage membership?','Paxos','Raft','Two-Phase Commit','Gossip Protocol','B',5),
(3,2,'Which metric is best suited when dealing with severe class imbalance in disease detection?','Accuracy','F1-Score / PR-AUC','Mean Squared Error','Adjusted R2','B',5),
(4,10,'Which HTTP status code signifies a resource was created successfully?','200 OK','201 Created','204 No Content','302 Found','B',2),
(5,10,'Which header is standardly used for bearer token authentication?','Authorization','Authentication','Token','Proxy-Authorization','A',2),
(6,10,'What is the primary benefit of stateless HTTP authentication like JWT?','Encrypted database records','No server-side session state storage required','Automatic database backups','Zero latency queries','B',2),
(7,10,'Which HTTP method is defined as idempotent and used to update a complete resource representation?','POST','GET','PUT','PATCH','C',2),
(8,10,'What does CORS stand for in web browsers?','Cross-Origin Resource Sharing','Cross-Online Response Server','Centralized Origin Request Standard','Client Origin Routing System','A',2);
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_submissions`
--

DROP TABLE IF EXISTS `quiz_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` int(11) DEFAULT 0,
  `total_marks` int(11) DEFAULT 0,
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_quiz_sub` (`quiz_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `quiz_submissions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_submissions`
--

LOCK TABLES `quiz_submissions` WRITE;
/*!40000 ALTER TABLE `quiz_submissions` DISABLE KEYS */;
INSERT INTO `quiz_submissions` VALUES
(1,1,3,10,10,'2026-09-08 19:00:03'),
(2,1,4,5,10,'2026-09-08 19:00:03'),
(10,10,7,10,10,'2026-09-08 19:15:29');
/*!40000 ALTER TABLE `quiz_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT 30,
  `due_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES
(1,1,'Distributed Systems Fundamentals Quiz','10-question evaluation on CAP theorem, PACELC, and Two-Phase Commit.',20,'2026-09-28 23:59:59','2026-09-08 19:00:03'),
(2,2,'Supervised Learning Concepts','Quiz covering precision, recall, ROC-AUC, and bias-variance tradeoff.',15,'2026-09-29 23:59:59','2026-09-08 19:00:03'),
(10,10,'CS501: Web Standards & REST Quiz','Assess understanding of HTTP protocols, RESTful verbs, status codes, and JWT authentication.',20,'2026-10-10 23:59:59','2026-09-08 19:15:29'),
(11,11,'CS502: Advanced Graph Theory Quiz','Comprehensive quiz covering BFS/DFS trees, Dijkstra, DAG topological sort, and flow networks.',25,'2026-10-12 23:59:59','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_configs`
--

DROP TABLE IF EXISTS `result_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_configs` (
  `class_id` int(11) NOT NULL,
  `theory_max` int(11) DEFAULT 100,
  `theory_pass` int(11) DEFAULT 40,
  `internal_max` int(11) DEFAULT 50,
  `internal_pass` int(11) DEFAULT 20,
  `viva_max` int(11) DEFAULT 50,
  `viva_pass` int(11) DEFAULT 20,
  `grade_a` int(11) DEFAULT 90,
  `grade_b` int(11) DEFAULT 75,
  `grade_c` int(11) DEFAULT 60,
  `grade_d` int(11) DEFAULT 40,
  PRIMARY KEY (`class_id`),
  CONSTRAINT `result_configs_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_configs`
--

LOCK TABLES `result_configs` WRITE;
/*!40000 ALTER TABLE `result_configs` DISABLE KEYS */;
INSERT INTO `result_configs` VALUES
(1,100,40,50,20,50,20,90,75,60,40),
(2,100,40,50,20,50,20,90,75,60,40),
(10,100,40,50,20,50,20,90,75,60,40),
(11,100,40,50,20,50,20,90,75,60,40);
/*!40000 ALTER TABLE `result_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_results`
--

DROP TABLE IF EXISTS `student_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `theory_marks` int(11) DEFAULT 0,
  `internal_marks` int(11) DEFAULT 0,
  `viva_marks` int(11) DEFAULT 0,
  `total_marks` int(11) DEFAULT 0,
  `grade` varchar(5) DEFAULT NULL,
  `status` enum('PASS','FAIL') DEFAULT 'FAIL',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_student_result` (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_results_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_results`
--

LOCK TABLES `student_results` WRITE;
/*!40000 ALTER TABLE `student_results` DISABLE KEYS */;
INSERT INTO `student_results` VALUES
(1,1,3,92,48,46,186,'A','PASS','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(2,1,4,78,42,38,158,'B','PASS','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(3,2,3,88,46,44,178,'B','PASS','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(4,2,5,65,35,30,130,'C','PASS','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(5,10,7,92,48,46,186,'A+','PASS','2026-09-08 19:15:29','2026-09-08 19:15:29'),
(6,11,7,88,45,44,177,'A','PASS','2026-09-08 19:15:29','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `student_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `text_content` text DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  `graded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_submission` (`assignment_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(1,1,3,'Implemented Raft leader election with heartbeats and randomized timeouts. Code attached.',NULL,NULL,95,'Excellent implementation of heartbeat logic and timeout handling.','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(2,1,4,'Implemented Raft core logic with edge case test suites.',NULL,NULL,88,'Good work, but consider improving edge-case handling on network partition.','2026-09-08 19:00:03','2026-09-08 19:00:03'),
(3,10,7,'Completed microservice architecture repository with full JWT auth, Docker compose and API docs.',NULL,NULL,94,'Superb code structure and well-documented API endpoints.','2026-09-08 19:15:29','2026-09-08 19:15:29'),
(4,1,7,'Implemented Raft consensus module with leader election and log synchronization unit tests.',NULL,NULL,90,'Great work on error handling and state persistence.','2026-09-08 19:15:29','2026-09-08 19:15:29');
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Dr. Rajesh Sharma','rajesh.sharma','rajesh@gurukul.edu','9876543210','Teacher','Computer Science','Faculty','Distributed Systems & Cloud','pass123','2026-09-08 19:00:03'),
(2,'Prof. Ananya Verma','ananya.verma','ananya@gurukul.edu','9876543211','Teacher','Information Technology','Faculty','Machine Learning & AI','pass123','2026-09-08 19:00:03'),
(3,'Aarav Patel','aarav.patel','aarav@student.gurukul.edu','9876543212','Student','B.Tech CS','2022-2026','Computer Science','pass123','2026-09-08 19:00:03'),
(4,'Diya Sen','diya.sen','diya@student.gurukul.edu','9876543213','Student','B.Tech CS','2022-2026','Computer Science','pass123','2026-09-08 19:00:03'),
(5,'Rohan Mehta','rohan.mehta','rohan@student.gurukul.edu','9876543214','Student','B.Tech IT','2022-2026','Information Technology','pass123','2026-09-08 19:00:03'),
(6,'Demo Teacher','teacher.demo','teacher.demo@gurukul.edu','9999999991','Teacher','Computer Science','Faculty','Computer Science & Engineering','pass123','2026-09-08 19:13:26'),
(7,'Demo Student','student.demo','student.demo@gurukul.edu','9999999992','Student','B.Tech CS','2022-2026','Computer Science','pass123','2026-09-08 19:13:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-09  0:45:48
