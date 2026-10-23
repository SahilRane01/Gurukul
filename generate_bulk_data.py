import random
import datetime

# Seed for reproducible realistic data
random.seed(42)

first_names = [
    "Aarav", "Vivaan", "Aditya", "Vihaan", "Arjun", "Sai", "Reyansh", "Ayaan", "Krishna", "Ishaan",
    "Shaurya", "Atharva", "Advik", "Pranav", "Advaith", "Kabir", "Ananya", "Diya", "Gauri", "Kavya",
    "Isha", "Anika", "Pooja", "Neha", "Sneha", "Priya", "Riya", "Tanvi", "Meera", "Shreya",
    "Siddharth", "Vikram", "Kunal", "Rahul", "Nikhil", "Amit", "Manish", "Deepak", "Suresh", "Gaurav",
    "Simran", "Preeti", "Komal", "Swati", "Rashmi", "Divya", "Payal", "Monika", "Sonali", "Jyoti",
    "Yash", "Harsh", "Mayank", "Chirag", "Tushar", "Sanket", "Omkar", "Pratik", "Abhishek", "Akash"
]

last_names = [
    "Sharma", "Verma", "Patel", "Mehta", "Sen", "Gupta", "Deshmukh", "Kulkarni", "Joshi", "Patil",
    "Rao", "Nair", "Iyer", "Chopra", "Malhotra", "Bhatia", "Saxena", "Reddy", "Choudhury", "Bose",
    "Banerjee", "Chatterjee", "Mishra", "Pandey", "Tiwari", "Dubey", "Yadav", "Singh", "Kumar", "Thakur"
]

sql_lines = [
    "USE gurukul;",
    "-- Disable foreign key checks for clean bulk loading",
    "SET FOREIGN_KEY_CHECKS = 0;"
]

# 1. Teachers for BCA and MCA
teachers = [
    (101, "Dr. Sanjay Deshmukh", "sanjay.deshmukh", "sanjay.deshmukh@gurukul.edu", "9820011221", "Teacher", "MCA", "Faculty", "Enterprise Java & Cloud Architecture", "password123"),
    (102, "Prof. Priya Nair", "priya.nair", "priya.nair@gurukul.edu", "9820011222", "Teacher", "MCA", "Faculty", "Advanced Database & Big Data", "password123"),
    (103, "Dr. Vikram Kulkarni", "vikram.kulkarni", "vikram.kulkarni@gurukul.edu", "9820011223", "Teacher", "BCA", "Faculty", "Web Technologies & Full Stack Development", "password123"),
    (104, "Prof. Neha Kapoor", "neha.kapoor", "neha.kapoor@gurukul.edu", "9820011224", "Teacher", "BCA", "Faculty", "Data Structures & Algorithms in C++", "password123")
]

user_inserts = ["INSERT INTO users (id, full_name, username, email, phone, role, course, batch, specialization, password) VALUES"]
user_values = []
for t in teachers:
    user_values.append(f"({t[0]}, '{t[1]}', '{t[2]}', '{t[3]}', '{t[4]}', '{t[5]}', '{t[6]}', '{t[7]}', '{t[8]}', '{t[9]}')")

# 2. 60 Students (30 BCA, 30 MCA)
student_ids = []
used_usernames = set()

for i in range(1, 61):
    sid = 200 + i
    student_ids.append(sid)
    fname = first_names[i-1]
    lname = last_names[(i * 3 + 7) % len(last_names)]
    full_name = f"{fname} {lname}"
    uname_base = f"{fname.lower()}.{lname.lower()}"
    uname = uname_base
    counter = 1
    while uname in used_usernames:
        uname = f"{uname_base}{counter}"
        counter += 1
    used_usernames.add(uname)
    
    phone = f"987{random.randint(1000000, 9999999)}"
    if i <= 30:
        course = "BCA"
        batch = "2024-2027"
        spec = "Computer Applications & Web Development"
        email = f"{uname}@bca.gurukul.edu"
    else:
        course = "MCA"
        batch = "2025-2027"
        spec = "Master of Computer Applications - Software Engineering"
        email = f"{uname}@mca.gurukul.edu"
        
    user_values.append(f"({sid}, '{full_name}', '{uname}', '{email}', '{phone}', 'Student', '{course}', '{batch}', '{spec}', 'password123')")

sql_lines.append(user_inserts[0] + "\n" + ",\n".join(user_values) + "\nON DUPLICATE KEY UPDATE full_name=VALUES(full_name);")

# 3. Classes for BCA and MCA
classes = [
    (10, "BCA101: Data Structures with C++", "Fundamental algorithms, trees, graphs, sorting, and complexity analysis.", 104, "BCA101DS"),
    (11, "BCA202: Full-Stack Web Development", "Modern web engineering using HTML5, CSS3, JavaScript, Servlets, and RESTful APIs.", 103, "BCA202WD"),
    (12, "MCA301: Enterprise Java & Spring Boot", "Architectural patterns, microservices, JPA/Hibernate, and security for enterprise systems.", 101, "MCA301EJ"),
    (13, "MCA402: Big Data Analytics & NoSQL", "Distributed storage, MapReduce, MongoDB, Spark streaming, and real-time data pipelines.", 102, "MCA402BD")
]

class_vals = []
for c in classes:
    class_vals.append(f"({c[0]}, '{c[1]}', '{c[2]}', '{c[3]}', '{c[4]}', NOW())")
sql_lines.append("INSERT INTO classes (id, name, description, teacher_id, class_code, created_at) VALUES\n" + ",\n".join(class_vals) + "\nON DUPLICATE KEY UPDATE name=VALUES(name);")

# 4. Class Enrollments (BCA students 201-230 in class 10 & 11, MCA students 231-260 in class 12 & 13)
enroll_vals = []
for sid in range(201, 231):
    enroll_vals.append(f"(10, {sid}, NOW())")
    enroll_vals.append(f"(11, {sid}, NOW())")
for sid in range(231, 261):
    enroll_vals.append(f"(12, {sid}, NOW())")
    enroll_vals.append(f"(13, {sid}, NOW())")
sql_lines.append("INSERT INTO class_students (class_id, student_id, joined_at) VALUES\n" + ",\n".join(enroll_vals) + "\nON DUPLICATE KEY UPDATE joined_at=NOW();")

# 5. Notices (BCA / MCA / General)
notices = [
    (10, "BCA Semester I Lab Practical Timetable", "The practical exams for BCA Data Structures Lab will be held in Lab 3 from October 10th to 12th.", "BCA", "2026-09-08"),
    (11, "MCA Placement Drive - Oracle & Infosys", "Eligible MCA final year students with 60%+ throughout should register on the placement portal before Sep 25th.", "MCA", "2026-09-08"),
    (12, "Guest Workshop: Kubernetes & Docker for MCA", "Industry experts from RedHat will deliver a 6-hour hands-on containerization workshop this Saturday.", "MCA", "2026-09-08"),
    (13, "BCA Inter-College Coding Contest", "Showcase your competitive programming skills in the Gurukul CodeSprint. Cash prizes worth 50,000 INR.", "BCA", "2026-09-08"),
    (14, "Library Book Return Reminder for BCA/MCA", "All borrowed reference books for the previous term must be renewed or returned by end of this week.", "ALL", "2026-09-08")
]
notice_vals = [f"({n[0]}, '{n[1]}', '{n[2]}', '{n[3]}', '{n[4]}')" for n in notices]
sql_lines.append("INSERT INTO noticeboard (id, heading, body, whom, created_at) VALUES\n" + ",\n".join(notice_vals) + "\nON DUPLICATE KEY UPDATE heading=VALUES(heading);")

# 6. Events
events = [
    (10, "BCA/MCA Orientation & Induction Ceremony", "2026-09-15", "Welcome address by the Dean, overview of academic credit system, and faculty introduction."),
    (11, "State Level Project Exhibition: TechFest 2026", "2026-10-18", "Annual presentation where MCA and BCA final year students exhibit their capstone software systems."),
    (12, "AI & Cloud Career Fair", "2026-11-02", "Top tech firms recruiting for Software Development Engineer, Cloud Associate, and Data Analyst roles.")
]
event_vals = [f"({e[0]}, '{e[1]}', '{e[2]}', '{e[3]}', NOW())" for e in events]
sql_lines.append("INSERT INTO events (id, event_name, event_date, description, created_at) VALUES\n" + ",\n".join(event_vals) + "\nON DUPLICATE KEY UPDATE event_name=VALUES(event_name);")

# 7. Assignments (2 per class = 8 total)
assignments = [
    (10, 10, "Binary Search Tree and AVL Balancing Implementation", "Write standard C++ code for AVL tree insertion, deletion, and rotation balancing with time complexity analysis.", "2026-09-28", 100),
    (11, 10, "Graph Traversal (BFS / DFS) & Shortest Path", "Implement Dijkstra algorithm and Topological sorting on directed graphs.", "2026-10-05", 100),
    (12, 11, "Responsive Dashboard using Tailwind & JavaScript", "Develop an interactive student portal with responsive navigation, chart widgets, and local storage state.", "2026-09-30", 100),
    (13, 11, "RESTful API Integration with Java Servlets", "Build CRUD servlets with JSON response formatting and session token verification.", "2026-10-08", 100),
    (14, 12, "Microservices Architecture with Spring Boot & Eureka", "Design a decoupled order and inventory management service with service discovery and gateway routing.", "2026-10-01", 100),
    (15, 12, "JPA Hibernate Transactional Management", "Implement robust caching and optimistic locking on multi-tenant database models.", "2026-10-10", 100),
    (16, 13, "MongoDB Aggregation Pipeline on Retail Dataset", "Execute complex aggregations, indexing, and map-reduce queries over 100k ecommerce transactions.", "2026-10-03", 100),
    (17, 13, "Apache Spark Streaming with Kafka", "Set up consumer pipelines for real-time log anomaly detection.", "2026-10-12", 100)
]
assign_vals = [f"({a[0]}, {a[1]}, '{a[2]}', '{a[3]}', '{a[4]}', {a[5]}, NOW())" for a in assignments]
sql_lines.append("INSERT INTO assignments (id, class_id, title, description, due_date, max_marks, created_at) VALUES\n" + ",\n".join(assign_vals) + "\nON DUPLICATE KEY UPDATE title=VALUES(title);")

# 8. Submissions (for students across these assignments - generate 60+ submissions)
sub_vals = []
sub_id = 100
for sid in range(201, 231): # BCA students submit assignment 10 and 12
    grade1 = random.randint(70, 98)
    feedback1 = "Clear implementation with comprehensive edge-case comments." if grade1 > 85 else "Well structured; optimize your recursive depth handling."
    sub_vals.append(f"({sub_id}, 10, {sid}, 'Complete implementation submitted with benchmark logs.', 'avl_tree_solution.cpp', '/uploads/avl_{sid}.cpp', {grade1}, '{feedback1}', NOW(), NOW())")
    sub_id += 1

    grade2 = random.randint(68, 96)
    feedback2 = "Great UI responsiveness and crisp color palette." if grade2 > 85 else "Good UI; ensure cross-browser Safari compatibility."
    sub_vals.append(f"({sub_id}, 12, {sid}, 'Tailwind dashboard responsive layout and live charts connected.', 'dashboard.zip', '/uploads/dash_{sid}.zip', {grade2}, '{feedback2}', NOW(), NOW())")
    sub_id += 1

for sid in range(231, 261): # MCA students submit assignment 14 and 16
    grade1 = random.randint(75, 99)
    feedback1 = "Excellent microservices decoupling and circuit breaker logic." if grade1 > 88 else "Solid service design; add healthcheck actuator endpoints."
    sub_vals.append(f"({sub_id}, 14, {sid}, 'Spring Boot microservices gateway & eureka discovery repo submitted.', 'spring_cloud_order.zip', '/uploads/spring_{sid}.zip', {grade1}, '{feedback1}', NOW(), NOW())")
    sub_id += 1

    grade2 = random.randint(72, 98)
    feedback2 = "High throughput queries using compound indexes." if grade2 > 85 else "Aggregations valid; ensure index usage on large lookups."
    sub_vals.append(f"({sub_id}, 16, {sid}, 'MongoDB aggregation queries with execution plan stats.', 'mongo_queries.js', '/uploads/mongo_{sid}.js', {grade2}, '{feedback2}', NOW(), NOW())")
    sub_id += 1

sql_lines.append("INSERT INTO submissions (id, assignment_id, student_id, text_content, file_name, file_path, grade, feedback, submitted_at, graded_at) VALUES\n" + ",\n".join(sub_vals) + "\nON DUPLICATE KEY UPDATE grade=VALUES(grade);")

# 9. Result Configs & Student Results (60 students * 2 classes = 120 result records)
rc_vals = [
    "(10, 100, 40, 50, 20, 50, 20, 90, 75, 60, 40)",
    "(11, 100, 40, 50, 20, 50, 20, 90, 75, 60, 40)",
    "(12, 100, 40, 50, 20, 50, 20, 90, 75, 60, 40)",
    "(13, 100, 40, 50, 20, 50, 20, 90, 75, 60, 40)"
]
sql_lines.append("INSERT INTO result_configs (class_id, theory_max, theory_pass, internal_max, internal_pass, viva_max, viva_pass, grade_a, grade_b, grade_c, grade_d) VALUES\n" + ",\n".join(rc_vals) + "\nON DUPLICATE KEY UPDATE theory_max=VALUES(theory_max);")

res_vals = []
res_id = 100
for sid in range(201, 231):
    for cid in [10, 11]:
        theory = random.randint(55, 95)
        internal = random.randint(30, 48)
        viva = random.randint(30, 48)
        total = theory + internal + viva
        pct = (total / 200) * 100
        if pct >= 85: grade = 'A'
        elif pct >= 70: grade = 'B'
        elif pct >= 55: grade = 'C'
        else: grade = 'D'
        status = 'PASS' if theory >= 40 and internal >= 20 and viva >= 20 else 'FAIL'
        res_vals.append(f"({res_id}, {cid}, {sid}, {theory}, {internal}, {viva}, {total}, '{grade}', '{status}', NOW(), NOW())")
        res_id += 1

for sid in range(231, 261):
    for cid in [12, 13]:
        theory = random.randint(60, 98)
        internal = random.randint(35, 50)
        viva = random.randint(35, 50)
        total = theory + internal + viva
        pct = (total / 200) * 100
        if pct >= 85: grade = 'A'
        elif pct >= 70: grade = 'B'
        elif pct >= 55: grade = 'C'
        else: grade = 'D'
        status = 'PASS' if theory >= 40 and internal >= 20 and viva >= 20 else 'FAIL'
        res_vals.append(f"({res_id}, {cid}, {sid}, {theory}, {internal}, {viva}, {total}, '{grade}', '{status}', NOW(), NOW())")
        res_id += 1

sql_lines.append("INSERT INTO student_results (id, class_id, student_id, theory_marks, internal_marks, viva_marks, total_marks, grade, status, created_at, updated_at) VALUES\n" + ",\n".join(res_vals) + "\nON DUPLICATE KEY UPDATE total_marks=VALUES(total_marks);")

# 10. Quizzes & Quiz Questions for BCA & MCA
quizzes = [
    (10, 10, "Data Structures: Trees, Graphs & Heaps Quiz", "Assessment covering traversal algorithms, binary search invariants, and time complexity bounds.", 25, "2026-09-29 23:59:59"),
    (11, 11, "Web Systems: DOM, Async JS & Servlets", "Evaluation of HTTP protocol verbs, DOM manipulation, promises, and servlet request lifecycle.", 20, "2026-09-30 23:59:59"),
    (12, 12, "Enterprise Java: IoC, DI, Spring & Hibernate", "Core concepts of dependency injection, application contexts, entity lifecycle, and transaction management.", 30, "2026-10-02 23:59:59"),
    (13, 13, "NoSQL Databases: CAP & Document Models", "Comparative analysis of key-value vs document stores, sharding architectures, and replica sets.", 25, "2026-10-04 23:59:59")
]
quiz_vals = [f"({q[0]}, {q[1]}, '{q[2]}', '{q[3]}', {q[4]}, '{q[5]}', NOW())" for q in quizzes]
sql_lines.append("INSERT INTO quizzes (id, class_id, title, description, duration_minutes, due_date, created_at) VALUES\n" + ",\n".join(quiz_vals) + "\nON DUPLICATE KEY UPDATE title=VALUES(title);")

questions = [
    (10, 10, "What is the worst-case time complexity for search operation in a non-balanced Binary Search Tree?", "O(log n)", "O(n)", "O(n log n)", "O(1)", "B", 5),
    (11, 10, "Which tree data structure guarantees logarithmic worst-case search by self-balancing through color attributes?", "AVL Tree", "B-Tree", "Red-Black Tree", "Splay Tree", "C", 5),
    (12, 11, "Which HTTP header is required for enabling Cross-Origin Resource Sharing (CORS) on the server side?", "Access-Control-Allow-Origin", "Origin-Authorization", "CORS-Allowed-Hosts", "Accept-Origin-Policy", "A", 5),
    (13, 11, "What is the default scope of a standard Jakarta Servlet in a multi-threaded web container?", "Per-request (prototype)", "Singleton (single instance shared across threads)", "Session-scoped", "Application-scoped clone", "B", 5),
    (14, 12, "Which Spring annotation is used to designate a class as an auto-detected service component in the application context?", "@Entity", "@Repository", "@Service", "@Configuration", "C", 5),
    (15, 12, "In Hibernate / JPA, what state is an entity in after calling entityManager.detach()?", "Transient", "Persistent", "Detached", "Removed", "C", 5),
    (16, 13, "Which of the following MongoDB index types is specifically designed for speeding up geospatial distance queries?", "Text Index", "2dsphere Index", "Hashed Index", "Compound Index", "B", 5),
    (17, 13, "What does MongoDB use to maintain high availability and automatic failover across nodes?", "Replica Sets with Raft/Paxos election", "Single Master Cluster", "Master-Slave Async Relay", "Shared-Nothing Mesh", "A", 5)
]
qq_vals = [f"({qq[0]}, {qq[1]}, '{qq[2]}', '{qq[3]}', '{qq[4]}', '{qq[5]}', '{qq[6]}', '{qq[7]}', {qq[8]})" for qq in questions]
sql_lines.append("INSERT INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option, marks) VALUES\n" + ",\n".join(qq_vals) + "\nON DUPLICATE KEY UPDATE question_text=VALUES(question_text);")

# 11. Quiz Submissions & Answers (60 students * 1 quiz = 60 submissions)
qsub_vals = []
qans_vals = []
qsub_id = 100

for sid in range(201, 231): # BCA quiz 10
    score = random.choice([5, 10])
    qsub_vals.append(f"({qsub_id}, 10, {sid}, {score}, 10, NOW())")
    ans1 = 'B' if score == 10 else random.choice(['A', 'B'])
    ans2 = 'C' if score == 10 else random.choice(['A', 'B', 'C'])
    qans_vals.append(f"({qsub_id}, 10, '{ans1}')")
    qans_vals.append(f"({qsub_id}, 11, '{ans2}')")
    qsub_id += 1

for sid in range(231, 261): # MCA quiz 12
    score = random.choice([5, 10])
    qsub_vals.append(f"({qsub_id}, 12, {sid}, {score}, 10, NOW())")
    ans1 = 'C' if score == 10 else random.choice(['A', 'B', 'C'])
    ans2 = 'C' if score == 10 else random.choice(['A', 'B', 'C'])
    qans_vals.append(f"({qsub_id}, 14, '{ans1}')")
    qans_vals.append(f"({qsub_id}, 15, '{ans2}')")
    qsub_id += 1

sql_lines.append("INSERT INTO quiz_submissions (id, quiz_id, student_id, score, total_marks, submitted_at) VALUES\n" + ",\n".join(qsub_vals) + "\nON DUPLICATE KEY UPDATE score=VALUES(score);")
sql_lines.append("INSERT INTO quiz_answers (submission_id, question_id, selected_option) VALUES\n" + ",\n".join(qans_vals) + "\nON DUPLICATE KEY UPDATE selected_option=VALUES(selected_option);")

# 12. Attendance records (Generate 120 attendance entries)
att_vals = []
att_id = 100
for sid in range(201, 231):
    status1 = 'PRESENT' if random.random() > 0.1 else 'ABSENT'
    status2 = 'PRESENT' if random.random() > 0.15 else 'ABSENT'
    att_vals.append(f"({att_id}, {sid}, CURDATE(), 'BCA101: Data Structures with C++', '{status1}', 104, NOW())")
    att_id += 1
    att_vals.append(f"({att_id}, {sid}, CURDATE(), 'BCA202: Full-Stack Web Development', '{status2}', 103, NOW())")
    att_id += 1

for sid in range(231, 261):
    status1 = 'PRESENT' if random.random() > 0.08 else 'ABSENT'
    status2 = 'PRESENT' if random.random() > 0.12 else 'ABSENT'
    att_vals.append(f"({att_id}, {sid}, CURDATE(), 'MCA301: Enterprise Java & Spring Boot', '{status1}', 101, NOW())")
    att_id += 1
    att_vals.append(f"({att_id}, {sid}, CURDATE(), 'MCA402: Big Data Analytics & NoSQL', '{status2}', 102, NOW())")
    att_id += 1

sql_lines.append("INSERT INTO attendance (id, student_id, date, subject, status, marked_by, created_at) VALUES\n" + ",\n".join(att_vals) + "\nON DUPLICATE KEY UPDATE status=VALUES(status);")

# 13. Meetings (BCA & MCA Live Sessions)
meetings = [
    (10, 104, "Prof. Neha Kapoor", "MEET-BCA101-01", "BCA", "BCA101: Live Coding AVL Balancing & Red-Black Invariants", "ACTIVE", "2026-09-12 10:00:00"),
    (11, 103, "Dr. Vikram Kulkarni", "MEET-BCA202-02", "BCA", "BCA202: RESTful Micro-Services & Asynchronous JavaScript", "ACTIVE", "2026-09-13 14:00:00"),
    (12, 101, "Dr. Sanjay Deshmukh", "MEET-MCA301-03", "MCA", "MCA301: Spring Boot Security with JWT & OAuth2 Deep Dive", "ACTIVE", "2026-09-14 11:00:00"),
    (13, 102, "Prof. Priya Nair", "MEET-MCA402-04", "MCA", "MCA402: Hands-on Sharding & Replica Set Partitioning in MongoDB", "ACTIVE", "2026-09-15 15:30:00")
]
meet_vals = [f"({m[0]}, {m[1]}, '{m[2]}', '{m[3]}', '{m[4]}', '{m[5]}', '{m[6]}', '{m[7]}', NOW())" for m in meetings]
sql_lines.append("INSERT INTO meetings (id, teacher_id, teacher_name, meeting_id, course, heading, status, scheduled_time, created_at) VALUES\n" + ",\n".join(meet_vals) + "\nON DUPLICATE KEY UPDATE heading=VALUES(heading);")

# 14. Leave Requests
leave_requests = [
    (10, 205, "Isha Sen", "Participating in Inter-University Hackathon at Bangalore", "2026-09-16", "2026-09-19", "APPROVED"),
    (11, 212, "Deepak Joshi", "Family function and travel to hometown", "2026-09-20", "2026-09-22", "PENDING"),
    (12, 235, "Tanvi Chopra", "Medical Leave - Viral fever recovery", "2026-09-14", "2026-09-17", "APPROVED"),
    (13, 248, "Sanket Kumar", "Attending AWS Certified Cloud Practitioner Exam Center", "2026-09-22", "2026-09-23", "PENDING")
]
lr_vals = [f"({lr[0]}, {lr[1]}, '{lr[2]}', '{lr[3]}', '{lr[4]}', '{lr[5]}', '{lr[6]}', NOW())" for lr in leave_requests]
sql_lines.append("INSERT INTO leave_requests (id, student_id, student_name, reason, start_date, end_date, status, applied_at) VALUES\n" + ",\n".join(lr_vals) + "\nON DUPLICATE KEY UPDATE status=VALUES(status);")

sql_lines.append("SET FOREIGN_KEY_CHECKS = 1;")

with open("/root/gurukul/bulk_mca_bca_data.sql", "w") as f:
    f.write("\n\n".join(sql_lines) + "\n")

print("Generated /root/gurukul/bulk_mca_bca_data.sql successfully!")
