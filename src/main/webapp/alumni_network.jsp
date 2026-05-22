<%@ page import="java.sql.*, java.util.*, com.gurukul.models.*, com.gurukul.utils.DBConnection" %>
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
    <title>Alumni Network - Gurukul ILE</title>
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
            <span class="text-red-500 animate-pulse">&#10033;</span>
            <span>GURUKUL_ILE / ALUMNI_NETWORK</span>
        </div>
        <div class="font-[Orbitron] text-red-500 tracking-widest bg-red-500/5 px-3 py-1 border border-red-500/20">NETWORK_NODES: 1,248</div>
    </div>

    <div class="flex flex-grow overflow-hidden relative z-10">
        <!-- SIDEBAR -->
        <aside class="hidden md:flex flex-col h-full py-6 pr-4 transition-all duration-500 group/sidebar w-20 hover:w-64">
            <div class="glass h-full border border-black/10 flex flex-col py-10 overflow-hidden relative shadow-2xl bg-white/95">
                <div class="w-full flex flex-col items-center group-hover/sidebar:items-start group-hover/sidebar:px-8 relative z-10 justify-center">
                    <div class="w-12 h-12 bg-red-500 flex items-center justify-center font-[Orbitron] text-base font-bold text-white shadow-[0_0_30px_rgba(255,51,51,0.4)] shrink-0 border border-white/20 cursor-pointer" onclick="location.href='dashboard.jsp'">GKL</div>
                </div>

                <nav class="flex-grow flex flex-col gap-1 mt-8 relative z-10 items-stretch">
                    <a href="dashboard.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="home" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Dashboard</span>
                    </a>
                    <a href="classes.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="book-open" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Classes</span>
                    </a>
                    <a href="social_hub.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="share-2" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Social Hub</span>
                    </a>
                    <a href="alumni_network.jsp" class="group/item flex items-center gap-4 p-4 bg-red-500/[0.03] border-l-4 border-red-500 w-full">
                        <i data-lucide="users" class="w-5 h-5 text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase text-red-500">Alumni</span>
                    </a>
                    <a href="krutyam_ai.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="sparkles" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Krutyam AI</span>
                    </a>
                    <a href="logout" class="group/item flex items-center gap-4 p-4 hover:bg-black/5 mt-auto w-full">
                        <i data-lucide="log-out" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Logout</span>
                    </a>
                </nav>
            </div>
        </aside>

        <!-- MAIN -->
        <main class="flex-grow overflow-y-auto p-8 scrollbar-hide">
            <div class="flex flex-col md:flex-row justify-between items-end gap-6 mb-12">
                <div>
                    <h1 class="font-[Orbitron] text-4xl font-black uppercase tracking-widest mb-2">Connect <span class="text-red-500">Nodes</span></h1>
                    <p class="text-xs text-gray-400 font-bold uppercase tracking-[0.4em]">Bridging Academia and Professional Industry</p>
                </div>
                <div class="flex gap-4 w-full md:w-auto">
                    <div class="relative flex-grow md:w-64">
                        <i data-lucide="search" class="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400"></i>
                        <input type="text" placeholder="Search by Company, Name..." class="w-full bg-white border border-black/5 p-4 pl-12 text-[10px] font-bold uppercase tracking-widest outline-none focus:border-red-500 transition-all">
                    </div>
                    <button class="bg-black text-white px-8 py-4 text-[10px] font-bold uppercase tracking-widest hover:bg-red-500 transition-all flex items-center gap-3">
                        <i data-lucide="filter" class="w-4 h-4"></i> Filter
                    </button>
                </div>
            </div>

            <!-- ALUMNI GRID -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- CARD 1 -->
                <div class="alumni-card">
                    <div class="flex gap-6 mb-6">
                        <div class="w-20 h-20 rounded-2xl bg-gray-100 overflow-hidden border border-black/5 group-hover:border-red-500/20 transition-all">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80" alt="Alumni" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h3 class="font-[Orbitron] text-sm font-black uppercase tracking-widest mb-1">Rohan Sharma</h3>
                            <p class="text-red-500 text-[10px] font-bold uppercase tracking-widest mb-2">Software Engineer @ Google</p>
                            <div class="flex gap-2">
                                <span class="px-2 py-1 bg-black/5 rounded text-[8px] font-bold uppercase text-gray-500">Class of '22</span>
                                <span class="px-2 py-1 bg-red-500/5 rounded text-[8px] font-bold uppercase text-red-500">Mentor</span>
                            </div>
                        </div>
                    </div>
                    <p class="text-[10px] text-gray-400 font-bold uppercase leading-relaxed mb-6 opacity-60">"The core fundamentals taught at Gurukul still help me daily at my work in Google Cloud Platform."</p>
                    <div class="flex gap-3">
                        <button class="flex-grow bg-black text-white py-3 text-[9px] font-black uppercase tracking-widest hover:bg-red-500 transition-all">Connect</button>
                        <button class="p-3 border border-black/10 hover:border-red-500 transition-all"><i data-lucide="linkedin" class="w-4 h-4"></i></button>
                    </div>
                </div>

                <!-- CARD 2 -->
                <div class="alumni-card">
                    <div class="flex gap-6 mb-6">
                        <div class="w-20 h-20 rounded-2xl bg-gray-100 overflow-hidden border border-black/5 group-hover:border-red-500/20 transition-all">
                            <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80" alt="Alumni" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h3 class="font-[Orbitron] text-sm font-black uppercase tracking-widest mb-1">Priya Patel</h3>
                            <p class="text-red-500 text-[10px] font-bold uppercase tracking-widest mb-2">Data Analyst @ TCS</p>
                            <div class="flex gap-2">
                                <span class="px-2 py-1 bg-black/5 rounded text-[8px] font-bold uppercase text-gray-500">Class of '21</span>
                                <span class="px-2 py-1 bg-green-500/5 rounded text-[8px] font-bold uppercase text-green-600">Available</span>
                            </div>
                        </div>
                    </div>
                    <p class="text-[10px] text-gray-400 font-bold uppercase leading-relaxed mb-6 opacity-60">"Happy to help current students with internship referrals and interview preparation tips."</p>
                    <div class="flex gap-3">
                        <button class="flex-grow bg-black text-white py-3 text-[9px] font-black uppercase tracking-widest hover:bg-red-500 transition-all">Message</button>
                        <button class="p-3 border border-black/10 hover:border-red-500 transition-all"><i data-lucide="mail" class="w-4 h-4"></i></button>
                    </div>
                </div>

                <!-- CARD 3 -->
                <div class="alumni-card">
                    <div class="flex gap-6 mb-6">
                        <div class="w-20 h-20 rounded-2xl bg-gray-100 overflow-hidden border border-black/5 group-hover:border-red-500/20 transition-all">
                            <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80" alt="Alumni" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h3 class="font-[Orbitron] text-sm font-black uppercase tracking-widest mb-1">Arjun Mehta</h3>
                            <p class="text-red-500 text-[10px] font-bold uppercase tracking-widest mb-2">Systems Architect @ Infosys</p>
                            <div class="flex gap-2">
                                <span class="px-2 py-1 bg-black/5 rounded text-[8px] font-bold uppercase text-gray-500">Class of '20</span>
                            </div>
                        </div>
                    </div>
                    <p class="text-[10px] text-gray-400 font-bold uppercase leading-relaxed mb-6 opacity-60">"Looking for students interested in Full Stack Development for a freelance project."</p>
                    <div class="flex gap-3">
                        <button class="flex-grow bg-black text-white py-3 text-[9px] font-black uppercase tracking-widest hover:bg-red-500 transition-all">Connect</button>
                        <button class="p-3 border border-black/10 hover:border-red-500 transition-all"><i data-lucide="external-link" class="w-4 h-4"></i></button>
                    </div>
                </div>
            </div>

            <!-- SUCCESS STORIES & MENTORSHIP -->
            <div class="grid grid-cols-1 lg:grid-cols-2 mt-12 gap-12">
                <div class="glass p-10 rounded-3xl relative overflow-hidden">
                    <div class="absolute top-0 right-0 p-6 text-[8px] font-black text-red-500/20 uppercase tracking-[0.5em]">Mentorship_HUB</div>
                    <h2 class="font-[Orbitron] text-xl font-black uppercase tracking-widest mb-6">Get Guided by Experts</h2>
                    <p class="text-[10px] text-gray-400 font-bold uppercase tracking-widest leading-relaxed mb-8 max-w-sm">Connect with alumni who are now leaders in top global tech companies and startups.</p>
                    <button class="bg-red-500 text-white px-10 py-4 text-[10px] font-bold uppercase tracking-widest hover:bg-black transition-all shadow-xl shadow-red-500/20">Apply for Mentorship</button>
                </div>
                <div class="bg-black text-white p-10 rounded-3xl flex flex-col justify-center">
                    <h3 class="font-[Orbitron] text-lg font-black uppercase tracking-widest mb-4">Community Discussions</h3>
                    <p class="text-[9px] text-gray-500 font-bold uppercase tracking-widest mb-6 italic">"Join the circle of professionals and students discussing the future of AI in 2026."</p>
                    <div class="flex items-center gap-4">
                        <div class="flex -space-x-3">
                            <div class="w-8 h-8 rounded-full border-2 border-black bg-gray-600"></div>
                            <div class="w-8 h-8 rounded-full border-2 border-black bg-gray-500"></div>
                            <div class="w-8 h-8 rounded-full border-2 border-black bg-gray-400"></div>
                        </div>
                        <span class="text-[8px] text-gray-400 uppercase font-bold tracking-widest">45+ Alumni Online</span>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
