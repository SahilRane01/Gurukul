<%--
  File: krutyam_ai.jsp
  
  OVERVIEW:
  - WHAT IT DOES: A friendly robot chat screen (Krutyam AI) that helps you with homework and explains tricky things simply.
  - WHY IT IS USED: Like having a super smart robotic best friend who answers your questions 24/7!
--%>

<%@ page import="java.sql.*, java.util.*, com.gurukul.models.*, com.gurukul.utils.DBConnection, java.text.SimpleDateFormat, java.io.*, java.net.*" %>
<jsp:useBean id="user" class="com.gurukul.models.UserProfile" scope="session" />
<%
    // --- AI PROXY LOGIC ---
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getContentType() != null && request.getContentType().contains("application/json")) {
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader r = request.getReader()) {
            while ((line = r.readLine()) != null) sb.append(line);
        }
        String body = sb.toString();

        // Check for context injection
        String parsedPrompt = "";
        String parsedUsername = "User";
        try {
            int pIdx = body.indexOf("\"prompt\":\"");
            if(pIdx != -1) {
                int start = pIdx + 10;
                int end = body.indexOf("\"", start);
                parsedPrompt = body.substring(start, end);
            }
            int uIdx = body.indexOf("\"username\":\"");
            if(uIdx != -1) {
                int start = uIdx + 12;
                int end = body.indexOf("\"", start);
                parsedUsername = body.substring(start, end);
            }
        } catch(Exception e){}

        String contextStr = "";
        com.gurukul.models.UserProfile sessionUser = (com.gurukul.models.UserProfile) session.getAttribute("user");
        if(sessionUser != null && parsedPrompt != null && !parsedPrompt.trim().isEmpty()) {
            String pLower = parsedPrompt.toLowerCase();
            try (java.sql.Connection conn = DBConnection.getConnection(application)) {
                if(pLower.contains("event")) {
                    String sql = "SELECT * FROM events WHERE event_date >= CURDATE() ORDER BY event_date ASC";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery()) {
                        while(rs.next()) contextStr += rs.getString("event_name") + " on " + rs.getDate("event_date") + "; ";
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("result")) {
                    String sql = "SELECT r.*, c.name as class_name FROM student_results r JOIN classes c ON r.class_id = c.id WHERE r.student_id = ?";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setInt(1, sessionUser.getId());
                        try(ResultSet rs = ps.executeQuery()) {
                            while(rs.next()) contextStr += rs.getString("class_name") + " Grade " + rs.getString("grade") + " (" + rs.getString("status") + "); ";
                        }
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("quiz")) {
                    String sql = "SELECT q.title, qs.score FROM quizzes q JOIN classes c ON q.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN quiz_submissions qs ON q.id = qs.quiz_id AND qs.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY q.created_at DESC LIMIT 5";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setInt(1, sessionUser.getId());
                        try(ResultSet rs = ps.executeQuery()) {
                            while(rs.next()) contextStr += rs.getString("title") + (rs.getString("score") != null ? " (Score: " + rs.getString("score") + ")" : " (Pending)") + "; ";
                        }
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("assignment")) {
                    String sql = "SELECT a.title, a.due_date, (CASE WHEN s.grade IS NOT NULL THEN 'GRADED' WHEN s.id IS NOT NULL THEN 'SUBMITTED' ELSE 'PENDING' END) as status FROM assignments a JOIN classes c ON a.class_id = c.id JOIN class_students cs ON c.id = cs.class_id LEFT JOIN submissions s ON a.id = s.assignment_id AND s.student_id = cs.student_id WHERE cs.student_id = ? ORDER BY a.due_date ASC LIMIT 10";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setInt(1, sessionUser.getId());
                        try(ResultSet rs = ps.executeQuery()) {
                            while(rs.next()) contextStr += rs.getString("title") + " due " + rs.getString("due_date") + " Status: " + rs.getString("status") + "; ";
                        }
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("notice")) {
                    String sql = "SELECT * FROM noticeboard ORDER BY created_at DESC LIMIT 5";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery()) {
                        while(rs.next()) contextStr += rs.getString("heading") + " - " + rs.getString("body") + " (To: " + rs.getString("whom") + "); ";
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("meeting")) {
                    String sql = "SELECT * FROM meetings WHERE status = 'ACTIVE' ORDER BY created_at DESC";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery()) {
                        while(rs.next()) contextStr += rs.getString("teacher_name") + " has an active session titled '" + rs.getString("heading") + "'; ";
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("attendance")) {
                    String sql = "SELECT COUNT(*) as total, SUM(CASE WHEN status='PRESENT' THEN 1 ELSE 0 END) as present_count FROM attendance WHERE student_id = ?";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setInt(1, sessionUser.getId());
                        try(ResultSet rs = ps.executeQuery()) {
                            if(rs.next()) contextStr += rs.getInt("present_count") + " present out of " + rs.getInt("total") + " classes; ";
                        }
                    }
                    contextStr += "] ";
                }
                if(pLower.contains("class")) {
                    String sql = "SELECT c.name FROM classes c JOIN class_students cs ON c.id = cs.class_id WHERE cs.student_id = ?";
                    contextStr += "[SQL Executed: " + sql + "] [Results: ";
                    try(PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setInt(1, sessionUser.getId());
                        try(ResultSet rs = ps.executeQuery()) {
                            while(rs.next()) contextStr += rs.getString("name") + "; ";
                        }
                    }
                    contextStr += "] ";
                }
            } catch(Exception e) {}
        }

        if(!contextStr.isEmpty()) {
            String newPrompt = "Context: " + contextStr + " User request: " + parsedPrompt;
            newPrompt = newPrompt.replace("\"", "\\\"")
                                 .replace("\n", " ")
                                 .replace("\r", " ")
                                 .replace("\t", " ")
                                 .replace("\\", "\\\\"); // escape quotes, newlines, tabs and backslashes
            body = "{\"username\":\"" + parsedUsername + "\",\"prompt\":\"" + newPrompt + "\"}";
        }

        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://lyricist-justly-visiting.ngrok-free.dev/chat");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setConnectTimeout(60000); // 1 minute to connect
            conn.setReadTimeout(300000); // 5 minutes to wait for the AI response
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("ngrok-skip-browser-warning", "true");
            conn.setRequestProperty("User-Agent", "GurkulServer/1.0");

            try (OutputStream os = conn.getOutputStream()) {
                os.write(body.getBytes("UTF-8"));
                os.flush();
            }

            int status = conn.getResponseCode();
            InputStream is = (status >= 200 && status < 300) ? conn.getInputStream() : conn.getErrorStream();

            StringBuilder resp = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
                String ln;
                while ((ln = br.readLine()) != null) resp.append(ln);
            }

            String finalResponse = resp.toString();
            response.setContentType("application/json");
            response.setStatus(status);
            
            // Store the interaction in the database
            try (java.sql.Connection dbConn = DBConnection.getConnection(application)) {
                try (Statement st = dbConn.createStatement()) {
                    st.execute("CREATE TABLE IF NOT EXISTS ai_chats (id INT AUTO_INCREMENT PRIMARY KEY, student_id INT NOT NULL, prompt TEXT, response TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");
                }
                if (sessionUser != null) {
                    try (PreparedStatement psLog = dbConn.prepareStatement("INSERT INTO ai_chats (student_id, prompt, response) VALUES (?, ?, ?)")) {
                        psLog.setInt(1, sessionUser.getId());
                        psLog.setString(2, parsedPrompt);
                        psLog.setString(3, finalResponse);
                        psLog.executeUpdate();
                    }
                }
            } catch (Exception e) {
                // Ignore DB logging errors to not break the API response
            }
            
            out.print(finalResponse);
        } catch (Exception e) {
            response.setStatus(500);
            out.print("{\"response\": \"AI service error: " + e.getMessage().replace("\"", "'") + "\"}");
        } finally {
            if (conn != null) conn.disconnect();
        }
        return; // Stop rendering the rest of the page for API calls
    }
    // --- END PROXY LOGIC ---
%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    boolean isStudent = "Student".equalsIgnoreCase(user.getRole());
    double attendancePercentage = 0.0;
    int pendingAssignments = 0;
    
    if (isStudent) {
        int totalClasses = 0;
        int presentCount = 0;
        try (Connection conn = DBConnection.getConnection(getServletContext())) {
            String statsSql = "SELECT COUNT(*) as total, SUM(CASE WHEN status='PRESENT' THEN 1 ELSE 0 END) as present_count FROM attendance WHERE student_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(statsSql)) {
                ps.setInt(1, user.getId());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) { 
                        totalClasses = rs.getInt("total"); 
                        presentCount = rs.getInt("present_count"); 
                    }
                }
            }
            if (totalClasses > 0) {
                attendancePercentage = (presentCount * 100.0) / totalClasses;
            }
            
            String pendingSql = "SELECT COUNT(*) as pending_count FROM assignments a JOIN class_students cs ON a.class_id = cs.class_id LEFT JOIN submissions s ON a.id = s.assignment_id AND s.student_id = cs.student_id WHERE cs.student_id = ? AND s.id IS NULL";
            try (PreparedStatement psPending = conn.prepareStatement(pendingSql)) {
                psPending.setInt(1, user.getId());
                try (ResultSet rsPending = psPending.executeQuery()) {
                    if (rsPending.next()) {
                        pendingAssignments = rsPending.getInt("pending_count");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Krutyam AI - Gurukul ILE</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" href="css/gurukul_core.css">
</head>
<body class="font-[Inter] bg-[#f8fafc] text-gray-900 h-screen overflow-hidden flex flex-col">
    <div class="fixed inset-0 pointer-events-none grid-bg z-0 opacity-100"></div>

    <!-- TOP BAR -->
    <div class="relative z-50 border-b border-black/5 px-6 py-2 flex justify-between items-center text-[9px] text-gray-400 bg-white/80 backdrop-blur-md uppercase tracking-[0.3em] font-bold">
        <div class="flex items-center gap-4">
            <button id="mobile-toggle" class="md:hidden p-2 -ml-2 text-gray-400 hover:text-red-500 transition-colors">
                <i data-lucide="menu" class="w-5 h-5"></i>
            </button>
            <span class="text-red-500 animate-pulse">&#10033;</span>
            <span>GURUKUL_ILE / KRUTYAM_AI</span>
            <span class="opacity-30 mx-2">|</span>
            <span class="text-[7px] text-red-500/80 tracking-widest uppercase">CORE_STATUS: OPERATIONAL</span>
        </div>
        <div class="flex items-center gap-6">
            <span class="hidden md:inline text-gray-300 whitespace-nowrap">AI_LEVEL: SUPREME</span>
            <div class="font-[Orbitron] text-red-500 tracking-widest bg-red-500/5 px-3 py-1 border border-red-500/20">UNIT_ID: <%= user.getUserName() %></div>
        </div>
    </div>

    <div class="flex flex-grow overflow-hidden relative z-10">
        <!-- SIDEBAR -->
        <aside id="sidebar-module" class="fixed md:relative inset-y-0 left-0 z-40 transform -translate-x-full md:translate-x-0 flex flex-col h-full py-6 pr-4 transition-all duration-500 group/sidebar w-64 md:w-20 hover:md:w-64 bg-white/95 md:bg-transparent backdrop-blur-xl md:backdrop-blur-none">
            <div class="glass h-full border-r md:border border-black/10 flex flex-col py-10 overflow-hidden relative shadow-2xl bg-white/95">
                <div class="w-full flex md:flex-col items-center md:items-start px-6 md:px-0 md:group-hover/sidebar:px-8 relative z-10 md:justify-center">
                    <div class="w-12 h-12 bg-red-500 flex items-center justify-center font-[Orbitron] text-base font-bold text-white shadow-[0_0_30px_rgba(255,51,51,0.4)] shrink-0 border border-white/20 cursor-pointer" onclick="location.href='dashboard.jsp'">GKL</div>
                </div>

                <nav class="flex-grow flex flex-col gap-1 mt-8 relative z-10 items-center md:items-stretch overflow-y-auto scrollbar-hide">
                    <a href="dashboard.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="home" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Dashboard</span>
                    </a>
                    <a href="classes.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="book-open" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Classes</span>
                    </a>
                    <a href="social_hub.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="share-2" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Social Hub</span>
                    </a>
                    <a href="alumni_network.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="users" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Alumni</span>
                    </a>
                    <a href="krutyam_ai.jsp" class="group/item flex items-center gap-4 p-4 bg-red-500/[0.03] border-l-4 border-red-500 w-full">
                        <i data-lucide="sparkles" class="w-5 h-5 text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase text-red-500">Krutyam AI</span>
                    </a>
                    <a href="logout" class="group/item flex items-center gap-4 p-4 hover:bg-black/5 mt-auto w-full">
                        <i data-lucide="log-out" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden md:group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Logout</span>
                    </a>
                </nav>
            </div>
        </aside>

        <!-- MAIN -->
        <main class="flex-grow flex flex-col md:flex-row h-full overflow-hidden">
            <!-- CHAT AREA -->
            <div class="flex-grow flex flex-col h-full p-8 pb-4">
                <div class="flex items-center gap-6 mb-8">
                    <div class="relative">
                        <div class="absolute -inset-1 bg-red-500 rounded-full blur opacity-25 animate-pulse"></div>
                        <img src="assets/krutyam_logo.png" class="w-16 h-16 rounded-full relative ai-glow border border-red-500/20" alt="Krutyam AI">
                    </div>
                    <div>
                        <h1 class="font-[Orbitron] text-2xl tracking-widest uppercase font-black text-gray-900">Krutyam AI</h1>
                        <p class="text-[9px] text-red-500 font-bold tracking-[0.4em] uppercase">Neural Network Online / v4.2.0</p>
                    </div>
                </div>

                <!-- CHAT MESSAGES -->
                <div id="chat-container" class="flex-grow overflow-y-auto space-y-6 pr-4 mb-6 scrollbar-hide">
                    <!-- AI MESSAGE -->
                    <div class="flex gap-4 items-start">
                        <div class="w-8 h-8 bg-red-500 rounded-full flex items-center justify-center text-white text-[10px] font-bold shrink-0">K</div>
                        <div class="chat-bubble-ai">
                            <p class="typing-effect">Hello, I am Krutyam AI. How can I help you today?</p>
                        </div>
                    </div>

                    <!-- USER MESSAGE (DUMMY) -->
                    <div class="flex gap-4 items-start flex-row-reverse">
                        <div class="w-8 h-8 bg-black rounded-full flex items-center justify-center text-white text-[10px] font-bold shrink-0">U</div>
                        <div class="chat-bubble-user">
                            <p>Can you show my attendance summary for this month?</p>
                        </div>
                    </div>

                    <!-- AI RESPONSE (DUMMY) -->
                    <div class="flex gap-4 items-start">
                        <div class="w-8 h-8 bg-red-500 rounded-full flex items-center justify-center text-white text-[10px] font-bold shrink-0">K</div>
                        <div class="chat-bubble-ai">
                            <p class="mb-4">Certainly, <%= user.getFullName() %>. Here is your current attendance status:</p>
                            <div class="grid grid-cols-2 gap-4 bg-white/50 p-4 rounded-xl border border-black/5">
                                <div>
                                    <span class="text-[8px] text-gray-400 uppercase font-bold tracking-widest">Attendance %</span>
                                    <p class="text-xl font-[Orbitron] text-gray-900"><%= isStudent ? String.format("%.1f", attendancePercentage) + "%" : "N/A" %></p>
                                </div>
                                <div>
                                    <span class="text-[8px] text-gray-400 uppercase font-bold tracking-widest">Status</span>
                                    <p class="text-xl font-[Orbitron] <%= isStudent && attendancePercentage >= 75 ? "text-green-500" : (isStudent ? "text-red-500" : "text-gray-500") %>"><%= isStudent ? (attendancePercentage >= 75 ? "EXCELLENT" : "WARNING") : "N/A" %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SUGGESTED PROMPTS -->
                <div class="flex flex-wrap gap-3 mb-6">
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming events')">Upcoming events</div>
                    <div class="prompt-chip" onclick="sendPrompt('My results')">Their results</div>
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming quizzes')">Upcoming quizzes</div>
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming assignments')">Upcoming assignments</div>
                    <div class="prompt-chip" onclick="sendPrompt('Notices')">Notices</div>
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming classes')">Upcoming classes</div>
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming meetings')">Upcoming meetings</div>
                    <div class="prompt-chip" onclick="sendPrompt('Attendance')">Attendance</div>
                </div>

                <!-- INPUT AREA -->
                <div class="relative">
                    <input type="text" id="chat-input" class="w-full bg-white border border-black/10 rounded-2xl p-6 pl-8 pr-16 text-sm font-medium outline-none focus:border-red-500 focus:ring-4 focus:ring-red-500/5 transition-all shadow-xl" placeholder="Ask Krutyam anything...">
                    <button id="send-btn" class="absolute right-4 top-1/2 -translate-y-1/2 bg-red-500 text-white p-3 rounded-xl hover:bg-black transition-all shadow-lg">
                        <i data-lucide="send" class="w-5 h-5"></i>
                    </button>
                </div>
            </div>

            <!-- INSIGHTS SIDEBAR -->
            <aside class="w-full md:w-80 p-8 border-l border-black/5 bg-white/50 backdrop-blur-md overflow-y-auto scrollbar-hide">
                <h2 class="font-[Orbitron] text-[10px] tracking-[0.4em] text-gray-400 uppercase mb-8">Student Insights</h2>
                
                <div class="space-y-8">
                    <!-- ATTENDANCE -->
                    <div class="glass p-6 rounded-2xl border-l-4 <%= isStudent && attendancePercentage >= 75 ? "border-green-500" : "border-red-500" %>">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">Attendance</span>
                            <i data-lucide="activity" class="w-4 h-4 <%= isStudent && attendancePercentage >= 75 ? "text-green-500" : "text-red-500" %>"></i>
                        </div>
                        <div class="text-3xl font-[Orbitron] text-gray-900 mb-2"><%= isStudent ? String.format("%.1f", attendancePercentage) + "%" : "N/A" %></div>
                        <div class="w-full h-1 bg-black/5 rounded-full overflow-hidden">
                            <div class="h-full <%= isStudent && attendancePercentage >= 75 ? "bg-green-500" : "bg-red-500" %>" style="width: <%= isStudent ? Math.min(attendancePercentage, 100) : 0 %>%"></div>
                        </div>
                    </div>

                    <!-- PENDING ASSIGNMENTS -->
                    <div class="glass p-6 rounded-2xl border-l-4 border-black">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">Assignments</span>
                            <i data-lucide="file-text" class="w-4 h-4 text-gray-900"></i>
                        </div>
                        <div class="text-3xl font-[Orbitron] text-gray-900 mb-1"><%= isStudent ? String.format("%02d", pendingAssignments) : "N/A" %></div>
                        <p class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">Pending Submissions</p>
                    </div>

                    <!-- AI EVENT SUMMARY -->
                    <div>
                        <h3 class="font-[Orbitron] text-[8px] tracking-[0.3em] text-red-500 uppercase mb-4">AI Event Analysis</h3>
                        <div class="space-y-4">
                            <div class="p-4 bg-white rounded-xl border border-black/5 relative overflow-hidden">
                                <div class="absolute top-0 right-0 p-1 bg-red-500 text-white text-[6px] font-bold uppercase">New</div>
                                <h4 class="text-[10px] font-bold text-gray-900 uppercase tracking-widest mb-1">TechFest 2026</h4>
                                <p class="text-[9px] text-gray-500 leading-relaxed">AI predicts high engagement. Recommended for your portfolio.</p>
                            </div>
                            <div class="p-4 bg-white rounded-xl border border-black/5">
                                <h4 class="text-[10px] font-bold text-gray-900 uppercase tracking-widest mb-1">Placement Drive</h4>
                                <p class="text-[9px] text-gray-500 leading-relaxed">Infosys drive starting next week. Review Java modules.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </main>
    </div>

    <script>
        lucide.createIcons();

        const input = document.getElementById('chat-input');
        const container = document.getElementById('chat-container');
        const sendBtn = document.getElementById('send-btn');

        function appendMessage(role, text, isAi = false) {
            const div = document.createElement('div');
            div.className = `flex gap-4 items-start \${role === 'user' ? 'flex-row-reverse' : ''}`;
            
            const avatar = document.createElement('div');
            avatar.className = `w-8 h-8 \${isAi ? 'bg-red-500' : 'bg-black'} rounded-full flex items-center justify-center text-white text-[10px] font-bold shrink-0`;
            avatar.innerText = role === 'user' ? 'U' : 'K';

            const bubble = document.createElement('div');
            bubble.className = isAi ? 'chat-bubble-ai' : 'chat-bubble-user';
            
            if (isAi) {
                const p = document.createElement('p');
                p.style.whiteSpace = 'pre-wrap'; // Ensure line breaks work and text wraps
                bubble.appendChild(p);
                
                // JavaScript typing effect that supports multi-line text
                let i = 0;
                const speed = 15; // ms per character
                function typeChar() {
                    if (i < text.length) {
                        p.textContent += text.charAt(i);
                        i++;
                        container.scrollTop = container.scrollHeight;
                        setTimeout(typeChar, speed);
                    }
                }
                typeChar();
            } else {
                bubble.innerHTML = `<p>\${text}</p>`;
            }

            div.appendChild(avatar);
            div.appendChild(bubble);
            container.appendChild(div);
            container.scrollTop = container.scrollHeight;
        }

        const MY_NAME = "<%= user.getFullName() %>";

        async function sendPrompt(text) {
            appendMessage('user', text);
            
            // Show loading indicator in UI
            const div = document.createElement('div');
            div.id = 'ai-loading';
            div.className = 'flex gap-4 items-start';
            div.innerHTML = `
                <div class="w-8 h-8 bg-red-500 rounded-full flex items-center justify-center text-white text-[10px] font-bold shrink-0">K</div>
                <div class="chat-bubble-ai flex items-center gap-1">
                    <div class="w-1.5 h-1.5 bg-gray-500 rounded-full animate-pulse"></div>
                    <div class="w-1.5 h-1.5 bg-gray-500 rounded-full animate-pulse" style="animation-delay:0.2s"></div>
                    <div class="w-1.5 h-1.5 bg-gray-500 rounded-full animate-pulse" style="animation-delay:0.4s"></div>
                </div>
            `;
            container.appendChild(div);
            container.scrollTop = container.scrollHeight;
            
            try {
                const response = await fetch('krutyam_ai.jsp', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ username: MY_NAME, prompt: text })
                });
                
                const data = await response.json();
                
                document.getElementById('ai-loading')?.remove();
                appendMessage('ai', data.response || "Sorry, I couldn't process that.", true);
            } catch (err) {
                document.getElementById('ai-loading')?.remove();
                appendMessage('ai', "Error connecting to AI service.", true);
            }
        }

        sendBtn.addEventListener('click', () => {
            if (input.value.trim()) {
                sendPrompt(input.value);
                input.value = '';
            }
        });

        input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter' && input.value.trim()) {
                sendPrompt(input.value);
                input.value = '';
            }
        });

        document.getElementById('mobile-toggle')?.addEventListener('click', () => {
            document.getElementById('sidebar-module').classList.remove('-translate-x-full');
        });
    </script>
</body>
</html>
