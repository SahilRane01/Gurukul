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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES
(1,1,'Raft Consensus Algorithm Implementation','Implement the leader election and log replication logic using Java sockets or gRPC.','2026-09-30',100,'2026-09-08 19:00:03'),
(2,2,'Customer Churn Classification Pipeline','Build and evaluate random forest vs XGBoost models on the provided telecom dataset.','2026-10-02',100,'2026-09-08 19:00:03'),
(10,10,'Binary Search Tree and AVL Balancing Implementation','Design and implement REST APIs with JWT authentication and responsive front-end dashboard.','2026-10-15',100,'2026-09-08 19:15:29'),
(11,11,'Graph Traversal (BFS / DFS) & Shortest Path','Implement Dijkstra and Ford-Fulkerson algorithms with performance benchmarks.','2026-10-20',100,'2026-09-08 19:15:29'),
(12,11,'Responsive Dashboard using Tailwind & JavaScript','Develop an interactive student portal with responsive navigation, chart widgets, and local storage state.','2026-09-30',100,'2026-09-08 19:23:25'),
(13,11,'RESTful API Integration with Java Servlets','Build CRUD servlets with JSON response formatting and session token verification.','2026-10-08',100,'2026-09-08 19:23:25'),
(14,12,'Microservices Architecture with Spring Boot & Eureka','Design a decoupled order and inventory management service with service discovery and gateway routing.','2026-10-01',100,'2026-09-08 19:23:25'),
(15,12,'JPA Hibernate Transactional Management','Implement robust caching and optimistic locking on multi-tenant database models.','2026-10-10',100,'2026-09-08 19:23:25'),
(16,13,'MongoDB Aggregation Pipeline on Retail Dataset','Execute complex aggregations, indexing, and map-reduce queries over 100k ecommerce transactions.','2026-10-03',100,'2026-09-08 19:23:25'),
(17,13,'Apache Spark Streaming with Kafka','Set up consumer pipelines for real-time log anomaly detection.','2026-10-12',100,'2026-09-08 19:23:25'),
(101,101,'Spring Cloud API Gateway & OAuth2 Service','Build a secured gateway service routing requests with rate limiting and JWT validation.','2026-10-25',100,'2026-09-08 19:23:37'),
(103,103,'Distributed Log Analysis using Apache Spark','Write Spark DataFrame transformations to analyze server access logs and compute 99th percentile latencies.','2026-10-28',100,'2026-09-08 19:23:37'),
(105,105,'Responsive E-Commerce Front-End in React','Build dynamic shopping cart, product catalog with search filtering, and state management.','2026-10-22',100,'2026-09-08 19:23:37'),
(107,107,'Balanced Binary Search Tree Implementation','Implement self-balancing AVL Tree insertion, deletion and rotation operations in C++.','2026-10-18',100,'2026-09-08 19:23:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(9,7,'2026-09-05','CS502: Advanced Data Structures & Algorithms','PRESENT',6,'2026-09-08 19:15:29'),
(100,201,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(101,201,'2026-09-09','BCA202: Full-Stack Web Development','ABSENT',103,'2026-09-08 19:23:25'),
(102,202,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(103,202,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(104,203,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(105,203,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(106,204,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(107,204,'2026-09-09','BCA202: Full-Stack Web Development','ABSENT',103,'2026-09-08 19:23:25'),
(108,205,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(109,205,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(110,206,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(111,206,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(112,207,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(113,207,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(114,208,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(115,208,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(116,209,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(117,209,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(118,210,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(119,210,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(120,211,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(121,211,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(122,212,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(123,212,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(124,213,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(125,213,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(126,214,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(127,214,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(128,215,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(129,215,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(130,216,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(131,216,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(132,217,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(133,217,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(134,218,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(135,218,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(136,219,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(137,219,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(138,220,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(139,220,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(140,221,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(141,221,'2026-09-09','BCA202: Full-Stack Web Development','ABSENT',103,'2026-09-08 19:23:25'),
(142,222,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(143,222,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(144,223,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(145,223,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(146,224,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(147,224,'2026-09-09','BCA202: Full-Stack Web Development','ABSENT',103,'2026-09-08 19:23:25'),
(148,225,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(149,225,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(150,226,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(151,226,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(152,227,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(153,227,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(154,228,'2026-09-09','BCA101: Data Structures with C++','PRESENT',104,'2026-09-08 19:23:25'),
(155,228,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(156,229,'2026-09-09','BCA101: Data Structures with C++','ABSENT',104,'2026-09-08 19:23:25'),
(157,229,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(158,230,'2026-09-09','BCA101: Data Structures with C++','ABSENT',104,'2026-09-08 19:23:25'),
(159,230,'2026-09-09','BCA202: Full-Stack Web Development','PRESENT',103,'2026-09-08 19:23:25'),
(160,231,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(161,231,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(162,232,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(163,232,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(164,233,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(165,233,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(166,234,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(167,234,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(168,235,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(169,235,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(170,236,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(171,236,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(172,237,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(173,237,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(174,238,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(175,238,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(176,239,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(177,239,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(178,240,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(179,240,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(180,241,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(181,241,'2026-09-09','MCA402: Big Data Analytics & NoSQL','ABSENT',102,'2026-09-08 19:23:25'),
(182,242,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(183,242,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(184,243,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(185,243,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(186,244,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(187,244,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(188,245,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(189,245,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(190,246,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(191,246,'2026-09-09','MCA402: Big Data Analytics & NoSQL','ABSENT',102,'2026-09-08 19:23:25'),
(192,247,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(193,247,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(194,248,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(195,248,'2026-09-09','MCA402: Big Data Analytics & NoSQL','ABSENT',102,'2026-09-08 19:23:25'),
(196,249,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(197,249,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(198,250,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(199,250,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(200,251,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(201,251,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(202,252,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(203,252,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(204,253,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(205,253,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(206,254,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(207,254,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(208,255,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(209,255,'2026-09-09','MCA402: Big Data Analytics & NoSQL','ABSENT',102,'2026-09-08 19:23:25'),
(210,256,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(211,256,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(212,257,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(213,257,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(214,258,'2026-09-09','MCA301: Enterprise Java & Spring Boot','ABSENT',101,'2026-09-08 19:23:25'),
(215,258,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(216,259,'2026-09-09','MCA301: Enterprise Java & Spring Boot','ABSENT',101,'2026-09-08 19:23:25'),
(217,259,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25'),
(218,260,'2026-09-09','MCA301: Enterprise Java & Spring Boot','PRESENT',101,'2026-09-08 19:23:25'),
(219,260,'2026-09-09','MCA402: Big Data Analytics & NoSQL','PRESENT',102,'2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(6,11,6,'Assignment 1 on Graph Theory & Network Flow has been published.','2026-09-08 19:15:29'),
(7,101,101,'Welcome to Enterprise Java! The repository for lab assignments is available in the resources section.','2026-09-08 19:23:37'),
(8,102,101,'Please configure your local Minikube / Docker Desktop environments prior to next session.','2026-09-08 19:23:37'),
(9,103,102,'Big Data Analytics lab setup instructions have been posted. Spark 3.5 is required.','2026-09-08 19:23:37'),
(10,105,103,'MERN Stack course kickoff: Review ECMAScript 2024 features and async/await syntax.','2026-09-08 19:23:37'),
(11,107,104,'C++ Data Structures syllabus and practice problem sets uploaded.','2026-09-08 19:23:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(11,11,5,'2026-09-08 19:15:29'),
(12,10,201,'2026-09-08 19:23:37'),
(13,11,201,'2026-09-08 19:23:25'),
(14,10,202,'2026-09-08 19:23:37'),
(15,11,202,'2026-09-08 19:23:25'),
(16,10,203,'2026-09-08 19:23:37'),
(17,11,203,'2026-09-08 19:23:25'),
(18,10,204,'2026-09-08 19:23:37'),
(19,11,204,'2026-09-08 19:23:25'),
(20,10,205,'2026-09-08 19:23:37'),
(21,11,205,'2026-09-08 19:23:25'),
(22,10,206,'2026-09-08 19:23:37'),
(23,11,206,'2026-09-08 19:23:25'),
(24,10,207,'2026-09-08 19:23:37'),
(25,11,207,'2026-09-08 19:23:25'),
(26,10,208,'2026-09-08 19:23:37'),
(27,11,208,'2026-09-08 19:23:25'),
(28,10,209,'2026-09-08 19:23:37'),
(29,11,209,'2026-09-08 19:23:25'),
(30,10,210,'2026-09-08 19:23:37'),
(31,11,210,'2026-09-08 19:23:25'),
(32,10,211,'2026-09-08 19:23:37'),
(33,11,211,'2026-09-08 19:23:25'),
(34,10,212,'2026-09-08 19:23:37'),
(35,11,212,'2026-09-08 19:23:25'),
(36,10,213,'2026-09-08 19:23:37'),
(37,11,213,'2026-09-08 19:23:25'),
(38,10,214,'2026-09-08 19:23:37'),
(39,11,214,'2026-09-08 19:23:25'),
(40,10,215,'2026-09-08 19:23:37'),
(41,11,215,'2026-09-08 19:23:25'),
(42,10,216,'2026-09-08 19:23:25'),
(43,11,216,'2026-09-08 19:23:25'),
(44,10,217,'2026-09-08 19:23:25'),
(45,11,217,'2026-09-08 19:23:25'),
(46,10,218,'2026-09-08 19:23:25'),
(47,11,218,'2026-09-08 19:23:25'),
(48,10,219,'2026-09-08 19:23:25'),
(49,11,219,'2026-09-08 19:23:25'),
(50,10,220,'2026-09-08 19:23:25'),
(51,11,220,'2026-09-08 19:23:25'),
(52,10,221,'2026-09-08 19:23:25'),
(53,11,221,'2026-09-08 19:23:25'),
(54,10,222,'2026-09-08 19:23:25'),
(55,11,222,'2026-09-08 19:23:25'),
(56,10,223,'2026-09-08 19:23:25'),
(57,11,223,'2026-09-08 19:23:25'),
(58,10,224,'2026-09-08 19:23:25'),
(59,11,224,'2026-09-08 19:23:25'),
(60,10,225,'2026-09-08 19:23:25'),
(61,11,225,'2026-09-08 19:23:25'),
(62,10,226,'2026-09-08 19:23:25'),
(63,11,226,'2026-09-08 19:23:25'),
(64,10,227,'2026-09-08 19:23:25'),
(65,11,227,'2026-09-08 19:23:25'),
(66,10,228,'2026-09-08 19:23:25'),
(67,11,228,'2026-09-08 19:23:25'),
(68,10,229,'2026-09-08 19:23:25'),
(69,11,229,'2026-09-08 19:23:25'),
(70,10,230,'2026-09-08 19:23:25'),
(71,11,230,'2026-09-08 19:23:25'),
(72,12,231,'2026-09-08 19:23:25'),
(73,13,231,'2026-09-08 19:23:25'),
(74,12,232,'2026-09-08 19:23:25'),
(75,13,232,'2026-09-08 19:23:25'),
(76,12,233,'2026-09-08 19:23:25'),
(77,13,233,'2026-09-08 19:23:25'),
(78,12,234,'2026-09-08 19:23:25'),
(79,13,234,'2026-09-08 19:23:25'),
(80,12,235,'2026-09-08 19:23:25'),
(81,13,235,'2026-09-08 19:23:25'),
(82,12,236,'2026-09-08 19:23:25'),
(83,13,236,'2026-09-08 19:23:25'),
(84,12,237,'2026-09-08 19:23:25'),
(85,13,237,'2026-09-08 19:23:25'),
(86,12,238,'2026-09-08 19:23:25'),
(87,13,238,'2026-09-08 19:23:25'),
(88,12,239,'2026-09-08 19:23:25'),
(89,13,239,'2026-09-08 19:23:25'),
(90,12,240,'2026-09-08 19:23:25'),
(91,13,240,'2026-09-08 19:23:25'),
(92,12,241,'2026-09-08 19:23:25'),
(93,13,241,'2026-09-08 19:23:25'),
(94,12,242,'2026-09-08 19:23:25'),
(95,13,242,'2026-09-08 19:23:25'),
(96,12,243,'2026-09-08 19:23:25'),
(97,13,243,'2026-09-08 19:23:25'),
(98,12,244,'2026-09-08 19:23:25'),
(99,13,244,'2026-09-08 19:23:25'),
(100,12,245,'2026-09-08 19:23:25'),
(101,13,245,'2026-09-08 19:23:25'),
(102,12,246,'2026-09-08 19:23:25'),
(103,13,246,'2026-09-08 19:23:25'),
(104,12,247,'2026-09-08 19:23:25'),
(105,13,247,'2026-09-08 19:23:25'),
(106,12,248,'2026-09-08 19:23:25'),
(107,13,248,'2026-09-08 19:23:25'),
(108,12,249,'2026-09-08 19:23:25'),
(109,13,249,'2026-09-08 19:23:25'),
(110,12,250,'2026-09-08 19:23:25'),
(111,13,250,'2026-09-08 19:23:25'),
(112,12,251,'2026-09-08 19:23:25'),
(113,13,251,'2026-09-08 19:23:25'),
(114,12,252,'2026-09-08 19:23:25'),
(115,13,252,'2026-09-08 19:23:25'),
(116,12,253,'2026-09-08 19:23:25'),
(117,13,253,'2026-09-08 19:23:25'),
(118,12,254,'2026-09-08 19:23:25'),
(119,13,254,'2026-09-08 19:23:25'),
(120,12,255,'2026-09-08 19:23:25'),
(121,13,255,'2026-09-08 19:23:25'),
(122,12,256,'2026-09-08 19:23:25'),
(123,13,256,'2026-09-08 19:23:25'),
(124,12,257,'2026-09-08 19:23:25'),
(125,13,257,'2026-09-08 19:23:25'),
(126,12,258,'2026-09-08 19:23:25'),
(127,13,258,'2026-09-08 19:23:25'),
(128,12,259,'2026-09-08 19:23:25'),
(129,13,259,'2026-09-08 19:23:25'),
(130,12,260,'2026-09-08 19:23:25'),
(131,13,260,'2026-09-08 19:23:25'),
(132,105,201,'2026-09-08 19:23:37'),
(133,105,202,'2026-09-08 19:23:37'),
(134,105,203,'2026-09-08 19:23:37'),
(135,105,204,'2026-09-08 19:23:37'),
(136,105,205,'2026-09-08 19:23:37'),
(137,105,206,'2026-09-08 19:23:37'),
(138,105,207,'2026-09-08 19:23:37'),
(139,105,208,'2026-09-08 19:23:37'),
(140,105,209,'2026-09-08 19:23:37'),
(141,105,210,'2026-09-08 19:23:37'),
(142,105,211,'2026-09-08 19:23:37'),
(143,105,212,'2026-09-08 19:23:37'),
(144,105,213,'2026-09-08 19:23:37'),
(145,105,214,'2026-09-08 19:23:37'),
(146,105,215,'2026-09-08 19:23:37'),
(147,105,216,'2026-09-08 19:23:37'),
(148,105,217,'2026-09-08 19:23:37'),
(149,105,218,'2026-09-08 19:23:37'),
(150,105,219,'2026-09-08 19:23:37'),
(151,105,220,'2026-09-08 19:23:37'),
(152,105,221,'2026-09-08 19:23:37'),
(153,105,222,'2026-09-08 19:23:37'),
(154,105,223,'2026-09-08 19:23:37'),
(155,105,224,'2026-09-08 19:23:37'),
(156,105,225,'2026-09-08 19:23:37'),
(157,105,226,'2026-09-08 19:23:37'),
(158,105,227,'2026-09-08 19:23:37'),
(159,105,228,'2026-09-08 19:23:37'),
(160,105,229,'2026-09-08 19:23:37'),
(161,105,230,'2026-09-08 19:23:37'),
(163,106,201,'2026-09-08 19:23:37'),
(164,106,202,'2026-09-08 19:23:37'),
(165,106,203,'2026-09-08 19:23:37'),
(166,106,204,'2026-09-08 19:23:37'),
(167,106,205,'2026-09-08 19:23:37'),
(168,106,206,'2026-09-08 19:23:37'),
(169,106,207,'2026-09-08 19:23:37'),
(170,106,208,'2026-09-08 19:23:37'),
(171,106,209,'2026-09-08 19:23:37'),
(172,106,210,'2026-09-08 19:23:37'),
(173,106,211,'2026-09-08 19:23:37'),
(174,106,212,'2026-09-08 19:23:37'),
(175,106,213,'2026-09-08 19:23:37'),
(176,106,214,'2026-09-08 19:23:37'),
(177,106,215,'2026-09-08 19:23:37'),
(178,106,216,'2026-09-08 19:23:37'),
(179,106,217,'2026-09-08 19:23:37'),
(180,106,218,'2026-09-08 19:23:37'),
(181,106,219,'2026-09-08 19:23:37'),
(182,106,220,'2026-09-08 19:23:37'),
(183,106,221,'2026-09-08 19:23:37'),
(184,106,222,'2026-09-08 19:23:37'),
(185,106,223,'2026-09-08 19:23:37'),
(186,106,224,'2026-09-08 19:23:37'),
(187,106,225,'2026-09-08 19:23:37'),
(188,106,226,'2026-09-08 19:23:37'),
(189,106,227,'2026-09-08 19:23:37'),
(190,106,228,'2026-09-08 19:23:37'),
(191,106,229,'2026-09-08 19:23:37'),
(192,106,230,'2026-09-08 19:23:37'),
(194,107,201,'2026-09-08 19:23:37'),
(195,107,202,'2026-09-08 19:23:37'),
(196,107,203,'2026-09-08 19:23:37'),
(197,107,204,'2026-09-08 19:23:37'),
(198,107,205,'2026-09-08 19:23:37'),
(199,107,206,'2026-09-08 19:23:37'),
(200,107,207,'2026-09-08 19:23:37'),
(201,107,208,'2026-09-08 19:23:37'),
(202,107,209,'2026-09-08 19:23:37'),
(203,107,210,'2026-09-08 19:23:37'),
(204,107,211,'2026-09-08 19:23:37'),
(205,107,212,'2026-09-08 19:23:37'),
(206,107,213,'2026-09-08 19:23:37'),
(207,107,214,'2026-09-08 19:23:37'),
(208,107,215,'2026-09-08 19:23:37'),
(209,107,216,'2026-09-08 19:23:37'),
(210,107,217,'2026-09-08 19:23:37'),
(211,107,218,'2026-09-08 19:23:37'),
(212,107,219,'2026-09-08 19:23:37'),
(213,107,220,'2026-09-08 19:23:37'),
(214,107,221,'2026-09-08 19:23:37'),
(215,107,222,'2026-09-08 19:23:37'),
(216,107,223,'2026-09-08 19:23:37'),
(217,107,224,'2026-09-08 19:23:37'),
(218,107,225,'2026-09-08 19:23:37'),
(219,107,226,'2026-09-08 19:23:37'),
(220,107,227,'2026-09-08 19:23:37'),
(221,107,228,'2026-09-08 19:23:37'),
(222,107,229,'2026-09-08 19:23:37'),
(223,107,230,'2026-09-08 19:23:37'),
(225,108,201,'2026-09-08 19:23:37'),
(226,108,202,'2026-09-08 19:23:37'),
(227,108,203,'2026-09-08 19:23:37'),
(228,108,204,'2026-09-08 19:23:37'),
(229,108,205,'2026-09-08 19:23:37'),
(230,108,206,'2026-09-08 19:23:37'),
(231,108,207,'2026-09-08 19:23:37'),
(232,108,208,'2026-09-08 19:23:37'),
(233,108,209,'2026-09-08 19:23:37'),
(234,108,210,'2026-09-08 19:23:37'),
(235,108,211,'2026-09-08 19:23:37'),
(236,108,212,'2026-09-08 19:23:37'),
(237,108,213,'2026-09-08 19:23:37'),
(238,108,214,'2026-09-08 19:23:37'),
(239,108,215,'2026-09-08 19:23:37'),
(240,108,216,'2026-09-08 19:23:37'),
(241,108,217,'2026-09-08 19:23:37'),
(242,108,218,'2026-09-08 19:23:37'),
(243,108,219,'2026-09-08 19:23:37'),
(244,108,220,'2026-09-08 19:23:37'),
(245,108,221,'2026-09-08 19:23:37'),
(246,108,222,'2026-09-08 19:23:37'),
(247,108,223,'2026-09-08 19:23:37'),
(248,108,224,'2026-09-08 19:23:37'),
(249,108,225,'2026-09-08 19:23:37'),
(250,108,226,'2026-09-08 19:23:37'),
(251,108,227,'2026-09-08 19:23:37'),
(252,108,228,'2026-09-08 19:23:37'),
(253,108,229,'2026-09-08 19:23:37'),
(254,108,230,'2026-09-08 19:23:37'),
(256,101,231,'2026-09-08 19:23:37'),
(257,101,232,'2026-09-08 19:23:37'),
(258,101,233,'2026-09-08 19:23:37'),
(259,101,234,'2026-09-08 19:23:37'),
(260,101,235,'2026-09-08 19:23:37'),
(261,101,236,'2026-09-08 19:23:37'),
(262,101,237,'2026-09-08 19:23:37'),
(263,101,238,'2026-09-08 19:23:37'),
(264,101,239,'2026-09-08 19:23:37'),
(265,101,240,'2026-09-08 19:23:37'),
(266,101,241,'2026-09-08 19:23:37'),
(267,101,242,'2026-09-08 19:23:37'),
(268,101,243,'2026-09-08 19:23:37'),
(269,101,244,'2026-09-08 19:23:37'),
(270,101,245,'2026-09-08 19:23:37'),
(271,101,246,'2026-09-08 19:23:37'),
(272,101,247,'2026-09-08 19:23:37'),
(273,101,248,'2026-09-08 19:23:37'),
(274,101,249,'2026-09-08 19:23:37'),
(275,101,250,'2026-09-08 19:23:37'),
(276,101,251,'2026-09-08 19:23:37'),
(277,101,252,'2026-09-08 19:23:37'),
(278,101,253,'2026-09-08 19:23:37'),
(279,101,254,'2026-09-08 19:23:37'),
(280,101,255,'2026-09-08 19:23:37'),
(281,101,256,'2026-09-08 19:23:37'),
(282,101,257,'2026-09-08 19:23:37'),
(283,101,258,'2026-09-08 19:23:37'),
(284,101,259,'2026-09-08 19:23:37'),
(285,101,260,'2026-09-08 19:23:37'),
(287,102,231,'2026-09-08 19:23:37'),
(288,102,232,'2026-09-08 19:23:37'),
(289,102,233,'2026-09-08 19:23:37'),
(290,102,234,'2026-09-08 19:23:37'),
(291,102,235,'2026-09-08 19:23:37'),
(292,102,236,'2026-09-08 19:23:37'),
(293,102,237,'2026-09-08 19:23:37'),
(294,102,238,'2026-09-08 19:23:37'),
(295,102,239,'2026-09-08 19:23:37'),
(296,102,240,'2026-09-08 19:23:37'),
(297,102,241,'2026-09-08 19:23:37'),
(298,102,242,'2026-09-08 19:23:37'),
(299,102,243,'2026-09-08 19:23:37'),
(300,102,244,'2026-09-08 19:23:37'),
(301,102,245,'2026-09-08 19:23:37'),
(302,102,246,'2026-09-08 19:23:37'),
(303,102,247,'2026-09-08 19:23:37'),
(304,102,248,'2026-09-08 19:23:37'),
(305,102,249,'2026-09-08 19:23:37'),
(306,102,250,'2026-09-08 19:23:37'),
(307,102,251,'2026-09-08 19:23:37'),
(308,102,252,'2026-09-08 19:23:37'),
(309,102,253,'2026-09-08 19:23:37'),
(310,102,254,'2026-09-08 19:23:37'),
(311,102,255,'2026-09-08 19:23:37'),
(312,102,256,'2026-09-08 19:23:37'),
(313,102,257,'2026-09-08 19:23:37'),
(314,102,258,'2026-09-08 19:23:37'),
(315,102,259,'2026-09-08 19:23:37'),
(316,102,260,'2026-09-08 19:23:37'),
(318,103,231,'2026-09-08 19:23:37'),
(319,103,232,'2026-09-08 19:23:37'),
(320,103,233,'2026-09-08 19:23:37'),
(321,103,234,'2026-09-08 19:23:37'),
(322,103,235,'2026-09-08 19:23:37'),
(323,103,236,'2026-09-08 19:23:37'),
(324,103,237,'2026-09-08 19:23:37'),
(325,103,238,'2026-09-08 19:23:37'),
(326,103,239,'2026-09-08 19:23:37'),
(327,103,240,'2026-09-08 19:23:37'),
(328,103,241,'2026-09-08 19:23:37'),
(329,103,242,'2026-09-08 19:23:37'),
(330,103,243,'2026-09-08 19:23:37'),
(331,103,244,'2026-09-08 19:23:37'),
(332,103,245,'2026-09-08 19:23:37'),
(333,103,246,'2026-09-08 19:23:37'),
(334,103,247,'2026-09-08 19:23:37'),
(335,103,248,'2026-09-08 19:23:37'),
(336,103,249,'2026-09-08 19:23:37'),
(337,103,250,'2026-09-08 19:23:37'),
(338,103,251,'2026-09-08 19:23:37'),
(339,103,252,'2026-09-08 19:23:37'),
(340,103,253,'2026-09-08 19:23:37'),
(341,103,254,'2026-09-08 19:23:37'),
(342,103,255,'2026-09-08 19:23:37'),
(343,103,256,'2026-09-08 19:23:37'),
(344,103,257,'2026-09-08 19:23:37'),
(345,103,258,'2026-09-08 19:23:37'),
(346,103,259,'2026-09-08 19:23:37'),
(347,103,260,'2026-09-08 19:23:37'),
(349,104,231,'2026-09-08 19:23:37'),
(350,104,232,'2026-09-08 19:23:37'),
(351,104,233,'2026-09-08 19:23:37'),
(352,104,234,'2026-09-08 19:23:37'),
(353,104,235,'2026-09-08 19:23:37'),
(354,104,236,'2026-09-08 19:23:37'),
(355,104,237,'2026-09-08 19:23:37'),
(356,104,238,'2026-09-08 19:23:37'),
(357,104,239,'2026-09-08 19:23:37'),
(358,104,240,'2026-09-08 19:23:37'),
(359,104,241,'2026-09-08 19:23:37'),
(360,104,242,'2026-09-08 19:23:37'),
(361,104,243,'2026-09-08 19:23:37'),
(362,104,244,'2026-09-08 19:23:37'),
(363,104,245,'2026-09-08 19:23:37'),
(364,104,246,'2026-09-08 19:23:37'),
(365,104,247,'2026-09-08 19:23:37'),
(366,104,248,'2026-09-08 19:23:37'),
(367,104,249,'2026-09-08 19:23:37'),
(368,104,250,'2026-09-08 19:23:37'),
(369,104,251,'2026-09-08 19:23:37'),
(370,104,252,'2026-09-08 19:23:37'),
(371,104,253,'2026-09-08 19:23:37'),
(372,104,254,'2026-09-08 19:23:37'),
(373,104,255,'2026-09-08 19:23:37'),
(374,104,256,'2026-09-08 19:23:37'),
(375,104,257,'2026-09-08 19:23:37'),
(376,104,258,'2026-09-08 19:23:37'),
(377,104,259,'2026-09-08 19:23:37'),
(378,104,260,'2026-09-08 19:23:37'),
(381,11,231,'2026-09-08 19:23:37'),
(382,11,232,'2026-09-08 19:23:37'),
(383,11,233,'2026-09-08 19:23:37'),
(384,11,234,'2026-09-08 19:23:37'),
(385,11,235,'2026-09-08 19:23:37'),
(386,11,236,'2026-09-08 19:23:37'),
(387,11,237,'2026-09-08 19:23:37'),
(388,11,238,'2026-09-08 19:23:37'),
(389,11,239,'2026-09-08 19:23:37'),
(390,11,240,'2026-09-08 19:23:37'),
(391,11,241,'2026-09-08 19:23:37'),
(392,11,242,'2026-09-08 19:23:37'),
(393,11,243,'2026-09-08 19:23:37'),
(394,11,244,'2026-09-08 19:23:37'),
(395,11,245,'2026-09-08 19:23:37'),
(396,1,201,'2026-09-08 19:23:37'),
(397,1,202,'2026-09-08 19:23:37'),
(398,1,203,'2026-09-08 19:23:37'),
(399,1,204,'2026-09-08 19:23:37'),
(400,1,205,'2026-09-08 19:23:37'),
(401,1,206,'2026-09-08 19:23:37'),
(402,1,207,'2026-09-08 19:23:37'),
(403,1,208,'2026-09-08 19:23:37'),
(404,1,209,'2026-09-08 19:23:37'),
(405,1,210,'2026-09-08 19:23:37'),
(406,1,211,'2026-09-08 19:23:37'),
(407,1,212,'2026-09-08 19:23:37'),
(408,1,213,'2026-09-08 19:23:37'),
(409,1,214,'2026-09-08 19:23:37'),
(410,1,215,'2026-09-08 19:23:37'),
(411,1,216,'2026-09-08 19:23:37'),
(412,1,217,'2026-09-08 19:23:37'),
(413,1,218,'2026-09-08 19:23:37'),
(414,1,219,'2026-09-08 19:23:37'),
(415,1,220,'2026-09-08 19:23:37'),
(427,2,221,'2026-09-08 19:23:37'),
(428,2,222,'2026-09-08 19:23:37'),
(429,2,223,'2026-09-08 19:23:37'),
(430,2,224,'2026-09-08 19:23:37'),
(431,2,225,'2026-09-08 19:23:37'),
(432,2,226,'2026-09-08 19:23:37'),
(433,2,227,'2026-09-08 19:23:37'),
(434,2,228,'2026-09-08 19:23:37'),
(435,2,229,'2026-09-08 19:23:37'),
(436,2,230,'2026-09-08 19:23:37'),
(437,2,231,'2026-09-08 19:23:37'),
(438,2,232,'2026-09-08 19:23:37'),
(439,2,233,'2026-09-08 19:23:37'),
(440,2,234,'2026-09-08 19:23:37'),
(441,2,235,'2026-09-08 19:23:37'),
(442,2,236,'2026-09-08 19:23:37'),
(443,2,237,'2026-09-08 19:23:37'),
(444,2,238,'2026-09-08 19:23:37'),
(445,2,239,'2026-09-08 19:23:37'),
(446,2,240,'2026-09-08 19:23:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES
(1,'CS401: Distributed Systems','Core course covering consensus algorithms, RPC, message queues, and high availability systems.',1,'CS401DS','2026-09-08 19:00:03'),
(2,'IT302: Applied Machine Learning','Advanced elective on neural networks, NLP, and model deployment pipelines.',2,'IT302ML','2026-09-08 19:00:03'),
(10,'BCA101: Data Structures with C++','Modern web engineering with React, Node.js, Spring Boot, and Cloud Native deployment.',6,'CS501DEMO','2026-09-08 19:15:29'),
(11,'BCA202: Full-Stack Web Development','In-depth exploration of graph algorithms, dynamic programming, and system optimization.',6,'CS502DEMO','2026-09-08 19:15:29'),
(12,'MCA301: Enterprise Java & Spring Boot','Architectural patterns, microservices, JPA/Hibernate, and security for enterprise systems.',101,'MCA301EJ','2026-09-08 19:23:25'),
(13,'MCA402: Big Data Analytics & NoSQL','Distributed storage, MapReduce, MongoDB, Spark streaming, and real-time data pipelines.',102,'MCA402BD','2026-09-08 19:23:25'),
(101,'MCA601: Enterprise Java & Spring Cloud','Advanced microservices architecture, JPA/Hibernate, Kafka and Spring Security.',101,'MCA601EJ','2026-09-08 19:23:37'),
(102,'MCA602: Cloud Native DevOps & Kubernetes','Containerization, Helm, CI/CD Pipelines with GitHub Actions, and AWS deployments.',101,'MCA602CD','2026-09-08 19:23:37'),
(103,'MCA503: Big Data Analytics & Distributed DBs','Deep dive into Apache Spark, Cassandra, MongoDB, and ElasticSearch.',102,'MCA503BD','2026-09-08 19:23:37'),
(104,'MCA504: Data Mining & Warehousing','Data warehousing architecture, ETL pipelines, snowflake schema, and predictive modeling.',102,'MCA504DW','2026-09-08 19:23:37'),
(105,'BCA301: Full Stack Web Development (MERN)','HTML5, TailwindCSS, React.js, Express, and modern asynchronous JavaScript.',103,'BCA301WD','2026-09-08 19:23:37'),
(106,'BCA302: Mobile Application Engineering','Cross-platform app development using Flutter and Firebase backend.',103,'BCA302MA','2026-09-08 19:23:37'),
(107,'BCA201: Data Structures with C++','Pointers, memory management, trees, AVL trees, and algorithmic complexity.',104,'BCA201DS','2026-09-08 19:23:37'),
(108,'BCA202: Object Oriented System Design','Design patterns, SOLID principles, UML modeling, and refactoring techniques.',104,'BCA202OO','2026-09-08 19:23:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(1,'Guest Lecture on Cloud Native Architectures','2026-09-20','Interactive workshop with industry architects covering Kubernetes, microservices, and reactive design patterns.','2026-09-08 19:00:03'),
(2,'Cybersecurity Awareness Workshop','2026-09-25','Hands-on session on ethical hacking, defensive security, and secure coding practices.','2026-09-08 19:00:03'),
(3,'Gurukul Annual Sports Meet','2026-10-05','Track, field, cricket, and badminton tournaments across all departments.','2026-09-08 19:00:03'),
(10,'BCA/MCA Orientation & Induction Ceremony','2026-09-15','Welcome address by the Dean, overview of academic credit system, and faculty introduction.','2026-09-08 19:23:25'),
(11,'State Level Project Exhibition: TechFest 2026','2026-10-18','Annual presentation where MCA and BCA final year students exhibit their capstone software systems.','2026-09-08 19:23:25'),
(12,'AI & Cloud Career Fair','2026-11-02','Top tech firms recruiting for Software Development Engineer, Cloud Associate, and Data Analyst roles.','2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES
(1,5,'Rohan Mehta','Attending National Hackathon Finals at IIT Bombay','2026-09-12','2026-09-15','APPROVED','2026-09-08 19:00:03'),
(2,4,'Diya Sen','Medical appointment and recovery','2026-09-18','2026-09-19','PENDING','2026-09-08 19:00:03'),
(3,7,'Demo Student','Attending National Level Hackathon 2026','2026-09-15','2026-09-17','APPROVED','2026-09-08 19:15:29'),
(10,205,'Isha Sen','Participating in Inter-University Hackathon at Bangalore','2026-09-16','2026-09-19','APPROVED','2026-09-08 19:23:25'),
(11,212,'Deepak Joshi','Family function and travel to hometown','2026-09-20','2026-09-22','PENDING','2026-09-08 19:23:25'),
(12,235,'Tanvi Chopra','Medical Leave - Viral fever recovery','2026-09-14','2026-09-17','APPROVED','2026-09-08 19:23:25'),
(13,248,'Sanket Kumar','Attending AWS Certified Cloud Practitioner Exam Center','2026-09-22','2026-09-23','PENDING','2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(4,6,'Demo Teacher','MEET-CS502-DOUBT','CS502','Dijkstra and Dynamic Programming Doubt Clearing Session','ACTIVE','2026-09-10 00:45:29','2026-09-08 19:15:29'),
(10,104,'Prof. Neha Kapoor','MEET-BCA101-01','BCA','BCA101: Live Coding AVL Balancing & Red-Black Invariants','ACTIVE','2026-09-12 10:00:00','2026-09-08 19:23:25'),
(11,103,'Dr. Vikram Kulkarni','MEET-BCA202-02','BCA','BCA202: RESTful Micro-Services & Asynchronous JavaScript','ACTIVE','2026-09-13 14:00:00','2026-09-08 19:23:25'),
(12,101,'Dr. Sanjay Deshmukh','MEET-MCA301-03','MCA','MCA301: Spring Boot Security with JWT & OAuth2 Deep Dive','ACTIVE','2026-09-14 11:00:00','2026-09-08 19:23:25'),
(13,102,'Prof. Priya Nair','MEET-MCA402-04','MCA','MCA402: Hands-on Sharding & Replica Set Partitioning in MongoDB','ACTIVE','2026-09-15 15:30:00','2026-09-08 19:23:25'),
(14,101,'Dr. Sanjay Deshmukh','MEET-MCA601','MCA601','Enterprise Spring Cloud & Gateway Architecture','ACTIVE','2026-09-09 03:53:37','2026-09-08 19:23:37'),
(15,102,'Prof. Priya Nair','MEET-MCA503','MCA503','Big Data Streaming with Kafka & Spark','ACTIVE','2026-09-09 05:53:37','2026-09-08 19:23:37'),
(16,103,'Dr. Vikram Kulkarni','MEET-BCA301','BCA301','React Hooks & State Management Patterns','ACTIVE','2026-09-10 00:53:37','2026-09-08 19:23:37'),
(17,104,'Prof. Neha Kapoor','MEET-BCA201','BCA201','Advanced Tree Balancing & Graph Traversals','ACTIVE','2026-09-11 00:53:37','2026-09-08 19:23:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboard`
--

LOCK TABLES `noticeboard` WRITE;
/*!40000 ALTER TABLE `noticeboard` DISABLE KEYS */;
INSERT INTO `noticeboard` VALUES
(1,'Mid-Semester Examinations Schedule','The mid-term examinations for B.Tech CS & IT will commence from October 15th, 2026. Detailed seating arrangement will be published next week.','ALL','2026-09-08 19:00:03'),
(2,'Annual Tech Symposium: HackGurukul 2026','Registration is open for the 48-hour annual hackathon. Submit team proposals before September 30th to participate.','STUDENTS','2026-09-08 19:00:03'),
(3,'Faculty Meeting on Curriculum Revision','All department heads and teaching faculty are requested to attend the seminar hall session this Friday at 3:00 PM.','TEACHERS','2026-09-08 19:00:03'),
(10,'BCA Semester I Lab Practical Timetable','The practical exams for BCA Data Structures Lab will be held in Lab 3 from October 10th to 12th.','BCA','2026-09-07 18:30:00'),
(11,'MCA Placement Drive - Oracle & Infosys','Eligible MCA final year students with 60%+ throughout should register on the placement portal before Sep 25th.','MCA','2026-09-07 18:30:00'),
(12,'Guest Workshop: Kubernetes & Docker for MCA','Industry experts from RedHat will deliver a 6-hour hands-on containerization workshop this Saturday.','MCA','2026-09-07 18:30:00'),
(13,'BCA Inter-College Coding Contest','Showcase your competitive programming skills in the Gurukul CodeSprint. Cash prizes worth 50,000 INR.','BCA','2026-09-07 18:30:00'),
(14,'Library Book Return Reminder for BCA/MCA','All borrowed reference books for the previous term must be renewed or returned by end of this week.','ALL','2026-09-07 18:30:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(4,2,2,'A'),
(5,100,10,'B'),
(6,100,11,'C'),
(7,101,10,'B'),
(8,101,11,'C'),
(9,102,10,'B'),
(10,102,11,'C'),
(11,103,10,'B'),
(12,103,11,'C'),
(13,104,10,'B'),
(14,104,11,'C'),
(15,105,10,'B'),
(16,105,11,'C'),
(17,106,10,'B'),
(18,106,11,'B'),
(19,107,10,'B'),
(20,107,11,'C'),
(21,108,10,'B'),
(22,108,11,'C'),
(23,109,10,'B'),
(24,109,11,'C'),
(25,110,10,'B'),
(26,110,11,'B'),
(27,111,10,'B'),
(28,111,11,'A'),
(29,112,10,'B'),
(30,112,11,'C'),
(31,113,10,'B'),
(32,113,11,'C'),
(33,114,10,'B'),
(34,114,11,'C'),
(35,115,10,'A'),
(36,115,11,'A'),
(37,116,10,'B'),
(38,116,11,'C'),
(39,117,10,'A'),
(40,117,11,'A'),
(41,118,10,'B'),
(42,118,11,'C'),
(43,119,10,'B'),
(44,119,11,'C'),
(45,120,10,'B'),
(46,120,11,'C'),
(47,121,10,'B'),
(48,121,11,'C'),
(49,122,10,'B'),
(50,122,11,'C'),
(51,123,10,'A'),
(52,123,11,'B'),
(53,124,10,'B'),
(54,124,11,'C'),
(55,125,10,'B'),
(56,125,11,'B'),
(57,126,10,'B'),
(58,126,11,'B'),
(59,127,10,'B'),
(60,127,11,'C'),
(61,128,10,'B'),
(62,128,11,'C'),
(63,129,10,'B'),
(64,129,11,'A'),
(65,130,14,'C'),
(66,130,15,'C'),
(67,131,14,'C'),
(68,131,15,'C'),
(69,132,14,'C'),
(70,132,15,'C'),
(71,133,14,'B'),
(72,133,15,'B'),
(73,134,14,'C'),
(74,134,15,'C'),
(75,135,14,'B'),
(76,135,15,'A'),
(77,136,14,'B'),
(78,136,15,'C'),
(79,137,14,'A'),
(80,137,15,'C'),
(81,138,14,'C'),
(82,138,15,'C'),
(83,139,14,'B'),
(84,139,15,'A'),
(85,140,14,'B'),
(86,140,15,'B'),
(87,141,14,'C'),
(88,141,15,'C'),
(89,142,14,'B'),
(90,142,15,'B'),
(91,143,14,'C'),
(92,143,15,'C'),
(93,144,14,'C'),
(94,144,15,'C'),
(95,145,14,'C'),
(96,145,15,'C'),
(97,146,14,'C'),
(98,146,15,'C'),
(99,147,14,'C'),
(100,147,15,'C'),
(101,148,14,'B'),
(102,148,15,'A'),
(103,149,14,'B'),
(104,149,15,'A'),
(105,150,14,'C'),
(106,150,15,'A'),
(107,151,14,'A'),
(108,151,15,'A'),
(109,152,14,'C'),
(110,152,15,'A'),
(111,153,14,'A'),
(112,153,15,'B'),
(113,154,14,'C'),
(114,154,15,'A'),
(115,155,14,'C'),
(116,155,15,'C'),
(117,156,14,'C'),
(118,156,15,'C'),
(119,157,14,'C'),
(120,157,15,'C'),
(121,158,14,'C'),
(122,158,15,'C'),
(123,159,14,'A'),
(124,159,15,'B');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(8,10,'What does CORS stand for in web browsers?','Cross-Origin Resource Sharing','Cross-Online Response Server','Centralized Origin Request Standard','Client Origin Routing System','A',2),
(10,10,'What is the worst-case time complexity for search operation in a non-balanced Binary Search Tree?','O(log n)','O(n)','O(n log n)','O(1)','B',5),
(11,10,'Which tree data structure guarantees logarithmic worst-case search by self-balancing through color attributes?','AVL Tree','B-Tree','Red-Black Tree','Splay Tree','C',5),
(12,11,'Which HTTP header is required for enabling Cross-Origin Resource Sharing (CORS) on the server side?','Access-Control-Allow-Origin','Origin-Authorization','CORS-Allowed-Hosts','Accept-Origin-Policy','A',5),
(13,11,'What is the default scope of a standard Jakarta Servlet in a multi-threaded web container?','Per-request (prototype)','Singleton (single instance shared across threads)','Session-scoped','Application-scoped clone','B',5),
(14,12,'Which Spring annotation is used to designate a class as an auto-detected service component in the application context?','@Entity','@Repository','@Service','@Configuration','C',5),
(15,12,'In Hibernate / JPA, what state is an entity in after calling entityManager.detach()?','Transient','Persistent','Detached','Removed','C',5),
(16,13,'Which of the following MongoDB index types is specifically designed for speeding up geospatial distance queries?','Text Index','2dsphere Index','Hashed Index','Compound Index','B',5),
(17,13,'What does MongoDB use to maintain high availability and automatic failover across nodes?','Replica Sets with Raft/Paxos election','Single Master Cluster','Master-Slave Async Relay','Shared-Nothing Mesh','A',5),
(18,101,'What is the default bean scope in Spring Framework?','Prototype','Singleton','Session','Request','B',2),
(19,101,'Which annotation is used to mark a class as a Spring Boot auto-configuration entry point?','@SpringBootApplication','@Configuration','@EnableAutoConfiguration','@ComponentScan','A',2),
(20,105,'Which hook is used to perform side effects in functional React components?','useState','useReducer','useEffect','useMemo','C',2),
(21,105,'What is the purpose of React keys in lists?','CSS Styling','Unique identification for reconciliation','Security hashing','State persistence','B',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_submissions`
--

LOCK TABLES `quiz_submissions` WRITE;
/*!40000 ALTER TABLE `quiz_submissions` DISABLE KEYS */;
INSERT INTO `quiz_submissions` VALUES
(1,1,3,10,10,'2026-09-08 19:00:03'),
(2,1,4,5,10,'2026-09-08 19:00:03'),
(10,10,7,10,10,'2026-09-08 19:15:29'),
(100,10,201,10,10,'2026-09-08 19:23:25'),
(101,10,202,5,10,'2026-09-08 19:23:25'),
(102,10,203,10,10,'2026-09-08 19:23:25'),
(103,10,204,10,10,'2026-09-08 19:23:25'),
(104,10,205,10,10,'2026-09-08 19:23:25'),
(105,10,206,10,10,'2026-09-08 19:23:25'),
(106,10,207,5,10,'2026-09-08 19:23:25'),
(107,10,208,10,10,'2026-09-08 19:23:25'),
(108,10,209,5,10,'2026-09-08 19:23:25'),
(109,10,210,10,10,'2026-09-08 19:23:25'),
(110,10,211,5,10,'2026-09-08 19:23:25'),
(111,10,212,5,10,'2026-09-08 19:23:25'),
(112,10,213,10,10,'2026-09-08 19:23:25'),
(113,10,214,10,10,'2026-09-08 19:23:25'),
(114,10,215,10,10,'2026-09-08 19:23:25'),
(115,10,216,5,10,'2026-09-08 19:23:25'),
(116,10,217,5,10,'2026-09-08 19:23:25'),
(117,10,218,5,10,'2026-09-08 19:23:25'),
(118,10,219,10,10,'2026-09-08 19:23:25'),
(119,10,220,10,10,'2026-09-08 19:23:25'),
(120,10,221,10,10,'2026-09-08 19:23:25'),
(121,10,222,10,10,'2026-09-08 19:23:25'),
(122,10,223,10,10,'2026-09-08 19:23:25'),
(123,10,224,5,10,'2026-09-08 19:23:25'),
(124,10,225,10,10,'2026-09-08 19:23:25'),
(125,10,226,5,10,'2026-09-08 19:23:25'),
(126,10,227,5,10,'2026-09-08 19:23:25'),
(127,10,228,10,10,'2026-09-08 19:23:25'),
(128,10,229,10,10,'2026-09-08 19:23:25'),
(129,10,230,5,10,'2026-09-08 19:23:25'),
(130,12,231,10,10,'2026-09-08 19:23:25'),
(131,12,232,10,10,'2026-09-08 19:23:25'),
(132,12,233,10,10,'2026-09-08 19:23:25'),
(133,12,234,5,10,'2026-09-08 19:23:25'),
(134,12,235,10,10,'2026-09-08 19:23:25'),
(135,12,236,5,10,'2026-09-08 19:23:25'),
(136,12,237,5,10,'2026-09-08 19:23:25'),
(137,12,238,5,10,'2026-09-08 19:23:25'),
(138,12,239,10,10,'2026-09-08 19:23:25'),
(139,12,240,5,10,'2026-09-08 19:23:25'),
(140,12,241,5,10,'2026-09-08 19:23:25'),
(141,12,242,10,10,'2026-09-08 19:23:25'),
(142,12,243,5,10,'2026-09-08 19:23:25'),
(143,12,244,10,10,'2026-09-08 19:23:25'),
(144,12,245,10,10,'2026-09-08 19:23:25'),
(145,12,246,10,10,'2026-09-08 19:23:25'),
(146,12,247,10,10,'2026-09-08 19:23:25'),
(147,12,248,10,10,'2026-09-08 19:23:25'),
(148,12,249,5,10,'2026-09-08 19:23:25'),
(149,12,250,5,10,'2026-09-08 19:23:25'),
(150,12,251,5,10,'2026-09-08 19:23:25'),
(151,12,252,5,10,'2026-09-08 19:23:25'),
(152,12,253,5,10,'2026-09-08 19:23:25'),
(153,12,254,5,10,'2026-09-08 19:23:25'),
(154,12,255,5,10,'2026-09-08 19:23:25'),
(155,12,256,10,10,'2026-09-08 19:23:25'),
(156,12,257,10,10,'2026-09-08 19:23:25'),
(157,12,258,10,10,'2026-09-08 19:23:25'),
(158,12,259,5,10,'2026-09-08 19:23:25'),
(159,12,260,5,10,'2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES
(1,1,'Distributed Systems Fundamentals Quiz','10-question evaluation on CAP theorem, PACELC, and Two-Phase Commit.',20,'2026-09-28 23:59:59','2026-09-08 19:00:03'),
(2,2,'Supervised Learning Concepts','Quiz covering precision, recall, ROC-AUC, and bias-variance tradeoff.',15,'2026-09-29 23:59:59','2026-09-08 19:00:03'),
(10,10,'Data Structures: Trees, Graphs & Heaps Quiz','Assess understanding of HTTP protocols, RESTful verbs, status codes, and JWT authentication.',20,'2026-10-10 23:59:59','2026-09-08 19:15:29'),
(11,11,'Web Systems: DOM, Async JS & Servlets','Comprehensive quiz covering BFS/DFS trees, Dijkstra, DAG topological sort, and flow networks.',25,'2026-10-12 23:59:59','2026-09-08 19:15:29'),
(12,12,'Enterprise Java: IoC, DI, Spring & Hibernate','Core concepts of dependency injection, application contexts, entity lifecycle, and transaction management.',30,'2026-10-02 23:59:59','2026-09-08 19:23:25'),
(13,13,'NoSQL Databases: CAP & Document Models','Comparative analysis of key-value vs document stores, sharding architectures, and replica sets.',25,'2026-10-04 23:59:59','2026-09-08 19:23:25'),
(101,101,'Enterprise Java & Spring Core Assessment','Evaluates dependency injection, bean scopes, JPA caching, and transactions.',30,'2026-10-20 23:59:59','2026-09-08 19:23:37'),
(105,105,'React & Modern JavaScript Concepts','Covers virtual DOM, hooks, closures, and promises.',25,'2026-10-15 23:59:59','2026-09-08 19:23:37');
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
(11,100,40,50,20,50,20,90,75,60,40),
(12,100,40,50,20,50,20,90,75,60,40),
(13,100,40,50,20,50,20,90,75,60,40),
(101,100,40,50,20,50,20,90,75,60,40),
(102,100,40,50,20,50,20,90,75,60,40),
(103,100,40,50,20,50,20,90,75,60,40),
(104,100,40,50,20,50,20,90,75,60,40),
(105,100,40,50,20,50,20,90,75,60,40),
(106,100,40,50,20,50,20,90,75,60,40),
(107,100,40,50,20,50,20,90,75,60,40),
(108,100,40,50,20,50,20,90,75,60,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(6,11,7,88,45,44,177,'A','PASS','2026-09-08 19:15:29','2026-09-08 19:15:29'),
(100,10,201,88,30,40,158,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(101,11,201,86,30,33,149,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(102,10,202,78,39,37,154,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(103,11,202,58,37,48,143,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(104,10,203,60,32,45,137,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(105,11,203,59,47,34,140,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(106,10,204,63,45,47,155,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(107,11,204,65,38,46,149,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(108,10,205,93,43,36,172,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(109,11,205,89,36,39,164,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(110,10,206,80,41,44,165,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(111,11,206,88,44,33,165,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(112,10,207,70,37,32,139,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(113,11,207,76,30,48,154,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(114,10,208,90,37,48,175,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(115,11,208,69,30,32,131,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(116,10,209,95,31,37,163,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(117,11,209,59,31,40,130,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(118,10,210,59,46,37,142,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(119,11,210,72,45,36,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(120,10,211,89,34,48,171,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(121,11,211,91,45,37,173,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(122,10,212,85,43,36,164,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(123,11,212,61,33,43,137,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(124,10,213,77,43,43,163,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(125,11,213,84,31,33,148,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(126,10,214,58,42,40,140,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(127,11,214,61,37,36,134,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(128,10,215,67,47,44,158,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(129,11,215,63,43,35,141,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(130,10,216,72,44,37,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(131,11,216,59,44,47,150,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(132,10,217,61,31,47,139,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(133,11,217,55,32,37,124,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(134,10,218,65,43,45,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(135,11,218,85,36,42,163,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(136,10,219,58,35,42,135,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(137,11,219,55,42,38,135,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(138,10,220,84,39,43,166,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(139,11,220,90,45,34,169,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(140,10,221,67,39,36,142,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(141,11,221,58,48,47,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(142,10,222,58,40,31,129,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(143,11,222,58,48,45,151,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(144,10,223,87,46,35,168,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(145,11,223,58,46,32,136,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(146,10,224,66,32,32,130,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(147,11,224,70,42,33,145,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(148,10,225,91,37,48,176,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(149,11,225,93,31,32,156,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(150,10,226,81,48,48,177,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(151,11,226,88,40,38,166,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(152,10,227,68,40,37,145,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(153,11,227,71,42,34,147,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(154,10,228,74,44,40,158,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(155,11,228,59,30,44,133,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(156,10,229,94,48,33,175,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(157,11,229,59,47,36,142,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(158,10,230,87,38,34,159,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(159,11,230,77,32,37,146,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(160,12,231,83,44,40,167,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(161,13,231,88,44,35,167,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(162,12,232,95,44,38,177,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(163,13,232,68,43,38,149,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(164,12,233,66,39,43,148,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(165,13,233,78,41,45,164,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(166,12,234,73,43,50,166,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(167,13,234,76,36,37,149,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(168,12,235,87,43,36,166,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(169,13,235,60,45,39,144,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(170,12,236,76,40,49,165,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(171,13,236,95,48,35,178,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(172,12,237,67,37,39,143,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(173,13,237,94,36,46,176,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(174,12,238,97,39,48,184,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(175,13,238,68,36,44,148,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(176,12,239,83,36,46,165,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(177,13,239,73,42,38,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(178,12,240,82,48,39,169,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(179,13,240,75,40,40,155,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(180,12,241,86,35,40,161,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(181,13,241,81,48,42,171,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(182,12,242,77,40,38,155,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(183,13,242,84,36,50,170,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(184,12,243,74,41,49,164,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(185,13,243,82,44,42,168,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(186,12,244,74,35,41,150,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(187,13,244,85,45,43,173,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(188,12,245,64,43,46,153,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(189,13,245,92,47,45,184,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(190,12,246,61,38,43,142,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(191,13,246,71,43,36,150,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(192,12,247,66,48,46,160,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(193,13,247,80,48,38,166,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(194,12,248,84,41,43,168,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(195,13,248,62,48,35,145,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(196,12,249,93,41,46,180,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(197,13,249,87,37,45,169,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(198,12,250,80,38,44,162,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(199,13,250,92,44,48,184,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(200,12,251,80,47,44,171,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(201,13,251,95,39,41,175,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(202,12,252,86,47,40,173,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(203,13,252,96,44,47,187,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(204,12,253,95,35,44,174,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(205,13,253,78,41,48,167,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(206,12,254,97,45,49,191,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(207,13,254,88,49,41,178,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(208,12,255,92,50,40,182,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(209,13,255,65,44,45,154,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(210,12,256,65,42,44,151,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(211,13,256,74,41,39,154,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(212,12,257,61,36,42,139,'C','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(213,13,257,90,37,49,176,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(214,12,258,86,41,47,174,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(215,13,258,91,47,42,180,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(216,12,259,69,35,38,142,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(217,13,259,87,42,40,169,'B','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(218,12,260,93,49,36,178,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(219,13,260,95,42,38,175,'A','PASS','2026-09-08 19:23:25','2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(4,1,7,'Implemented Raft consensus module with leader election and log synchronization unit tests.',NULL,NULL,90,'Great work on error handling and state persistence.','2026-09-08 19:15:29','2026-09-08 19:15:29'),
(100,10,201,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_201.cpp',91,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(101,12,201,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_201.zip',76,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(102,10,202,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_202.cpp',92,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(103,12,202,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_202.zip',89,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(104,10,203,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_203.cpp',90,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(105,12,203,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_203.zip',70,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(106,10,204,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_204.cpp',89,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(107,12,204,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_204.zip',88,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(108,10,205,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_205.cpp',75,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(109,12,205,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_205.zip',85,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(110,10,206,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_206.cpp',93,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(111,12,206,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_206.zip',75,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(112,10,207,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_207.cpp',75,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(113,12,207,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_207.zip',82,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(114,10,208,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_208.cpp',82,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(115,12,208,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_208.zip',76,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(116,10,209,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_209.cpp',90,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(117,12,209,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_209.zip',90,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(118,10,210,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_210.cpp',87,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(119,12,210,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_210.zip',75,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(120,10,211,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_211.cpp',91,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(121,12,211,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_211.zip',78,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(122,10,212,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_212.cpp',96,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(123,12,212,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_212.zip',92,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(124,10,213,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_213.cpp',94,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(125,12,213,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_213.zip',69,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(126,10,214,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_214.cpp',77,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(127,12,214,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_214.zip',94,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(128,10,215,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_215.cpp',71,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(129,12,215,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_215.zip',93,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(130,10,216,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_216.cpp',80,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(131,12,216,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_216.zip',80,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(132,10,217,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_217.cpp',78,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(133,12,217,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_217.zip',70,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(134,10,218,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_218.cpp',76,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(135,12,218,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_218.zip',86,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(136,10,219,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_219.cpp',98,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(137,12,219,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_219.zip',90,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(138,10,220,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_220.cpp',80,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(139,12,220,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_220.zip',74,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(140,10,221,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_221.cpp',90,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(141,12,221,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_221.zip',83,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(142,10,222,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_222.cpp',82,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(143,12,222,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_222.zip',96,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(144,10,223,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_223.cpp',90,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(145,12,223,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_223.zip',82,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(146,10,224,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_224.cpp',74,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(147,12,224,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_224.zip',76,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(148,10,225,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_225.cpp',74,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(149,12,225,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_225.zip',75,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(150,10,226,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_226.cpp',93,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(151,12,226,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_226.zip',85,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(152,10,227,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_227.cpp',87,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(153,12,227,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_227.zip',76,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(154,10,228,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_228.cpp',93,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(155,12,228,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_228.zip',86,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(156,10,229,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_229.cpp',83,'Well structured; optimize your recursive depth handling.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(157,12,229,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_229.zip',96,'Great UI responsiveness and crisp color palette.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(158,10,230,'Complete implementation submitted with benchmark logs.','avl_tree_solution.cpp','/uploads/avl_230.cpp',88,'Clear implementation with comprehensive edge-case comments.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(159,12,230,'Tailwind dashboard responsive layout and live charts connected.','dashboard.zip','/uploads/dash_230.zip',80,'Good UI; ensure cross-browser Safari compatibility.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(160,14,231,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_231.zip',86,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(161,16,231,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_231.js',79,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(162,14,232,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_232.zip',79,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(163,16,232,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_232.js',88,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(164,14,233,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_233.zip',90,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(165,16,233,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_233.js',74,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(166,14,234,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_234.zip',99,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(167,16,234,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_234.js',73,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(168,14,235,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_235.zip',78,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(169,16,235,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_235.js',76,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(170,14,236,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_236.zip',95,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(171,16,236,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_236.js',77,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(172,14,237,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_237.zip',96,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(173,16,237,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_237.js',85,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(174,14,238,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_238.zip',94,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(175,16,238,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_238.js',74,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(176,14,239,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_239.zip',87,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(177,16,239,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_239.js',84,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(178,14,240,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_240.zip',94,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(179,16,240,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_240.js',86,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(180,14,241,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_241.zip',91,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(181,16,241,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_241.js',80,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(182,14,242,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_242.zip',92,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(183,16,242,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_242.js',72,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(184,14,243,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_243.zip',96,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(185,16,243,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_243.js',95,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(186,14,244,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_244.zip',78,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(187,16,244,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_244.js',93,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(188,14,245,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_245.zip',92,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(189,16,245,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_245.js',96,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(190,14,246,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_246.zip',83,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(191,16,246,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_246.js',96,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(192,14,247,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_247.zip',95,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(193,16,247,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_247.js',82,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(194,14,248,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_248.zip',78,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(195,16,248,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_248.js',81,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(196,14,249,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_249.zip',88,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(197,16,249,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_249.js',77,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(198,14,250,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_250.zip',89,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(199,16,250,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_250.js',72,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(200,14,251,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_251.zip',98,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(201,16,251,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_251.js',95,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(202,14,252,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_252.zip',83,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(203,16,252,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_252.js',88,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(204,14,253,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_253.zip',99,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(205,16,253,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_253.js',77,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(206,14,254,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_254.zip',91,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(207,16,254,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_254.js',75,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(208,14,255,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_255.zip',95,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(209,16,255,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_255.js',81,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(210,14,256,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_256.zip',95,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(211,16,256,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_256.js',88,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(212,14,257,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_257.zip',94,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(213,16,257,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_257.js',78,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(214,14,258,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_258.zip',79,'Solid service design; add healthcheck actuator endpoints.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(215,16,258,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_258.js',83,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(216,14,259,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_259.zip',99,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(217,16,259,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_259.js',77,'Aggregations valid; ensure index usage on large lookups.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(218,14,260,'Spring Boot microservices gateway & eureka discovery repo submitted.','spring_cloud_order.zip','/uploads/spring_260.zip',92,'Excellent microservices decoupling and circuit breaker logic.','2026-09-08 19:23:25','2026-09-08 19:23:25'),
(219,16,260,'MongoDB aggregation queries with execution plan stats.','mongo_queries.js','/uploads/mongo_260.js',96,'High throughput queries using compound indexes.','2026-09-08 19:23:25','2026-09-08 19:23:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(7,'Demo Student','student.demo','student.demo@gurukul.edu','9999999992','Student','B.Tech CS','2022-2026','Computer Science','pass123','2026-09-08 19:13:26'),
(101,'Dr. Sanjay Deshmukh','sanjay.deshmukh','sanjay.deshmukh@gurukul.edu','9820011221','Teacher','MCA','Faculty','Enterprise Java & Cloud Architecture','pass123','2026-09-08 19:23:25'),
(102,'Prof. Priya Nair','priya.nair','priya.nair@gurukul.edu','9820011222','Teacher','MCA','Faculty','Advanced Database & Big Data','pass123','2026-09-08 19:23:25'),
(103,'Dr. Vikram Kulkarni','vikram.kulkarni','vikram.kulkarni@gurukul.edu','9820011223','Teacher','BCA','Faculty','Web Technologies & Full Stack Development','pass123','2026-09-08 19:23:25'),
(104,'Prof. Neha Kapoor','neha.kapoor','neha.kapoor@gurukul.edu','9820011224','Teacher','BCA','Faculty','Data Structures & Algorithms in C++','pass123','2026-09-08 19:23:25'),
(201,'Aarav Rao','aarav.rao','aarav.rao@bca.gurukul.edu','9872867825','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(202,'Vivaan Chopra','vivaan.chopra','vivaan.chopra@bca.gurukul.edu','9871419610','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(203,'Aditya Saxena','aditya.saxena','aditya.saxena@bca.gurukul.edu','9875614226','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(204,'Vihaan Bose','vihaan.bose','vihaan.bose@bca.gurukul.edu','9875108603','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(205,'Arjun Mishra','arjun.mishra','arjun.mishra@bca.gurukul.edu','9874744854','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(206,'Sai Dubey','sai.dubey','sai.dubey@bca.gurukul.edu','9873341057','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(207,'Reyansh Kumar','reyansh.kumar','reyansh.kumar@bca.gurukul.edu','9872719583','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(208,'Ayaan Verma','ayaan.verma','ayaan.verma@bca.gurukul.edu','9872458591','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(209,'Krishna Sen','krishna.sen','krishna.sen@bca.gurukul.edu','9878078673','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(210,'Ishaan Kulkarni','ishaan.kulkarni','ishaan.kulkarni@bca.gurukul.edu','9871533224','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(211,'Shaurya Rao','shaurya.rao','shaurya.rao@bca.gurukul.edu','9871499914','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(212,'Atharva Chopra','atharva.chopra','atharva.chopra@bca.gurukul.edu','9872571945','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(213,'Advik Saxena','advik.saxena','advik.saxena@bca.gurukul.edu','9874668136','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(214,'Pranav Bose','pranav.bose','pranav.bose@bca.gurukul.edu','9874903402','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(215,'Advaith Mishra','advaith.mishra','advaith.mishra@bca.gurukul.edu','9879478454','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(216,'Kabir Dubey','kabir.dubey','kabir.dubey@bca.gurukul.edu','9871445199','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(217,'Ananya Kumar','ananya.kumar','ananya.kumar@bca.gurukul.edu','9874335942','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(218,'Diya Verma','diya.verma','diya.verma@bca.gurukul.edu','9878038374','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(219,'Gauri Sen','gauri.sen','gauri.sen@bca.gurukul.edu','9874698379','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(220,'Kavya Kulkarni','kavya.kulkarni','kavya.kulkarni@bca.gurukul.edu','9878536477','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(221,'Isha Rao','isha.rao','isha.rao@bca.gurukul.edu','9875667265','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(222,'Anika Chopra','anika.chopra','anika.chopra@bca.gurukul.edu','9871109031','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(223,'Pooja Saxena','pooja.saxena','pooja.saxena@bca.gurukul.edu','9873678638','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(224,'Neha Bose','neha.bose','neha.bose@bca.gurukul.edu','9878090293','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(225,'Sneha Mishra','sneha.mishra','sneha.mishra@bca.gurukul.edu','9876708456','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(226,'Priya Dubey','priya.dubey','priya.dubey@bca.gurukul.edu','9875661907','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(227,'Riya Kumar','riya.kumar','riya.kumar@bca.gurukul.edu','9873608513','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(228,'Tanvi Verma','tanvi.verma','tanvi.verma@bca.gurukul.edu','9874612365','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(229,'Meera Sen','meera.sen','meera.sen@bca.gurukul.edu','9876647119','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(230,'Shreya Kulkarni','shreya.kulkarni','shreya.kulkarni@bca.gurukul.edu','9872714803','Student','BCA','2024-2027','Computer Applications & Web Development','pass123','2026-09-08 19:23:25'),
(231,'Siddharth Rao','siddharth.rao','siddharth.rao@mca.gurukul.edu','9872556017','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(232,'Vikram Chopra','vikram.chopra','vikram.chopra@mca.gurukul.edu','9877374122','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(233,'Kunal Saxena','kunal.saxena','kunal.saxena@mca.gurukul.edu','9872622631','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(234,'Rahul Bose','rahul.bose','rahul.bose@mca.gurukul.edu','9877022674','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(235,'Nikhil Mishra','nikhil.mishra','nikhil.mishra@mca.gurukul.edu','9876770619','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(236,'Amit Dubey','amit.dubey','amit.dubey@mca.gurukul.edu','9875437923','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(237,'Manish Kumar','manish.kumar','manish.kumar@mca.gurukul.edu','9871728977','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(238,'Deepak Verma','deepak.verma','deepak.verma@mca.gurukul.edu','9878707870','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(239,'Suresh Sen','suresh.sen','suresh.sen@mca.gurukul.edu','9879996414','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(240,'Gaurav Kulkarni','gaurav.kulkarni','gaurav.kulkarni@mca.gurukul.edu','9873094235','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(241,'Simran Rao','simran.rao','simran.rao@mca.gurukul.edu','9877350753','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(242,'Preeti Chopra','preeti.chopra','preeti.chopra@mca.gurukul.edu','9872322047','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(243,'Komal Saxena','komal.saxena','komal.saxena@mca.gurukul.edu','9875918715','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(244,'Swati Bose','swati.bose','swati.bose@mca.gurukul.edu','9877067228','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(245,'Rashmi Mishra','rashmi.mishra','rashmi.mishra@mca.gurukul.edu','9874226067','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(246,'Divya Dubey','divya.dubey','divya.dubey@mca.gurukul.edu','9872166941','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(247,'Payal Kumar','payal.kumar','payal.kumar@mca.gurukul.edu','9871768805','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(248,'Monika Verma','monika.verma','monika.verma@mca.gurukul.edu','9874823498','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(249,'Sonali Sen','sonali.sen','sonali.sen@mca.gurukul.edu','9875855124','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(250,'Jyoti Kulkarni','jyoti.kulkarni','jyoti.kulkarni@mca.gurukul.edu','9872338687','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(251,'Yash Rao','yash.rao','yash.rao@mca.gurukul.edu','9874905582','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(252,'Harsh Chopra','harsh.chopra','harsh.chopra@mca.gurukul.edu','9872694522','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(253,'Mayank Saxena','mayank.saxena','mayank.saxena@mca.gurukul.edu','9877377459','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(254,'Chirag Bose','chirag.bose','chirag.bose@mca.gurukul.edu','9875663623','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(255,'Tushar Mishra','tushar.mishra','tushar.mishra@mca.gurukul.edu','9878606962','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(256,'Sanket Dubey','sanket.dubey','sanket.dubey@mca.gurukul.edu','9877120868','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(257,'Omkar Kumar','omkar.kumar','omkar.kumar@mca.gurukul.edu','9873728882','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(258,'Pratik Verma','pratik.verma','pratik.verma@mca.gurukul.edu','9877210606','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(259,'Abhishek Sen','abhishek.sen','abhishek.sen@mca.gurukul.edu','9876960453','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25'),
(260,'Akash Kulkarni','akash.kulkarni','akash.kulkarni@mca.gurukul.edu','9874514944','Student','MCA','2025-2027','Master of Computer Applications - Software Engineering','pass123','2026-09-08 19:23:25');
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

-- Dump completed on 2026-09-09  0:53:42
