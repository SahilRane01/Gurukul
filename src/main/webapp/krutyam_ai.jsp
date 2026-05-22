<%@ page import="java.sql.*, java.util.*, com.gurukul.models.*, com.gurukul.utils.DBConnection, java.text.SimpleDateFormat" %>
<jsp:useBean id="user" class="com.gurukul.models.UserProfile" scope="session" />
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
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
                                    <p class="text-xl font-[Orbitron] text-gray-900">88.5%</p>
                                </div>
                                <div>
                                    <span class="text-[8px] text-gray-400 uppercase font-bold tracking-widest">Status</span>
                                    <p class="text-xl font-[Orbitron] text-green-500">EXCELLENT</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SUGGESTED PROMPTS -->
                <div class="flex flex-wrap gap-3 mb-6">
                    <div class="prompt-chip" onclick="sendPrompt('Show my attendance summary')">Show my attendance summary</div>
                    <div class="prompt-chip" onclick="sendPrompt('Upcoming events')">Upcoming events</div>
                    <div class="prompt-chip" onclick="sendPrompt('Explain Data Science Unit 1')">Explain Data Science Unit 1</div>
                    <div class="prompt-chip" onclick="sendPrompt('Generate exam preparation summary')">Generate exam prep</div>
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
                    <div class="glass p-6 rounded-2xl border-l-4 border-red-500">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">Attendance</span>
                            <i data-lucide="activity" class="w-4 h-4 text-red-500"></i>
                        </div>
                        <div class="text-3xl font-[Orbitron] text-gray-900 mb-2">88.5%</div>
                        <div class="w-full h-1 bg-black/5 rounded-full overflow-hidden">
                            <div class="h-full bg-red-500" style="width: 88.5%"></div>
                        </div>
                    </div>

                    <!-- PENDING ASSIGNMENTS -->
                    <div class="glass p-6 rounded-2xl border-l-4 border-black">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">Assignments</span>
                            <i data-lucide="file-text" class="w-4 h-4 text-gray-900"></i>
                        </div>
                        <div class="text-3xl font-[Orbitron] text-gray-900 mb-1">03</div>
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
                p.className = 'typing-effect';
                p.innerText = text;
                bubble.appendChild(p);
            } else {
                bubble.innerHTML = `<p>\${text}</p>`;
            }

            div.appendChild(avatar);
            div.appendChild(bubble);
            container.appendChild(div);
            container.scrollTop = container.scrollHeight;
        }

        function sendPrompt(text) {
            appendMessage('user', text);
            setTimeout(() => {
                appendMessage('ai', "I'm processing your request regarding '" + text + "'. One moment...", true);
            }, 600);
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
