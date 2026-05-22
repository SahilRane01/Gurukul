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
    <title>Social Hub - Gurukul ILE</title>
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
            <span>GURUKUL_ILE / SOCIAL_HUB</span>
        </div>
        <div class="flex items-center gap-6">
            <span class="text-green-500">CAMPUS_ONLINE: 452</span>
            <div class="font-[Orbitron] text-red-500 tracking-widest bg-red-500/5 px-3 py-1 border border-red-500/20">EVENT: TECHFEST_2026</div>
        </div>
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
                    <a href="social_hub.jsp" class="group/item flex items-center gap-4 p-4 bg-red-500/[0.03] border-l-4 border-red-500 w-full">
                        <i data-lucide="share-2" class="w-5 h-5 text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase text-red-500">Social Hub</span>
                    </a>
                    <a href="alumni_network.jsp" class="group/item flex items-center gap-4 p-4 hover:bg-red-500/5 w-full">
                        <i data-lucide="users" class="w-5 h-5 text-gray-400 group-hover:text-red-500"></i>
                        <span class="hidden group-hover/sidebar:block font-[Orbitron] text-[10px] tracking-widest font-bold uppercase">Alumni</span>
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

        <!-- MAIN FEED -->
        <main class="flex-grow overflow-y-auto p-4 md:p-8 scrollbar-hide">
            <!-- HERO BANNER -->
            <div class="relative w-full h-80 rounded-[40px] overflow-hidden mb-12 shadow-2xl group">
                <img src="assets/techfest_banner.png" class="w-full h-full object-cover transition-transform duration-1000 group-hover:scale-110" alt="TechFest Banner">
                <div class="absolute inset-0 bg-gradient-to-r from-black/80 via-black/40 to-transparent flex flex-col justify-center p-12">
                    <span class="text-red-500 font-[Orbitron] text-[10px] tracking-[0.5em] font-black uppercase mb-4">Institutional Event</span>
                    <h1 class="text-white font-[Orbitron] text-5xl font-black uppercase tracking-tighter leading-none mb-6">TechFest<br><span class="text-red-500">2026</span></h1>
                    <div class="flex gap-4">
                        <button class="bg-red-500 text-white px-8 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-white hover:text-black transition-all">Register Now</button>
                        <button class="bg-white/10 backdrop-blur-md text-white border border-white/20 px-8 py-3 text-[10px] font-black uppercase tracking-widest hover:bg-white hover:text-black transition-all">Event Guide</button>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">
                <!-- FEED -->
                <div class="lg:col-span-2">
                    <!-- POST 1 -->
                    <div class="post-card">
                        <div class="flex justify-between items-start mb-8">
                            <div class="flex items-center gap-4">
                                <div class="w-12 h-12 bg-black rounded-2xl flex items-center justify-center text-white font-[Orbitron] font-black">CS</div>
                                <div>
                                    <h3 class="text-sm font-black text-gray-900 uppercase tracking-widest">Computer Society</h3>
                                    <p class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">2 hours ago • Verified Club</p>
                                </div>
                            </div>
                            <button class="text-gray-300 hover:text-red-500 transition-colors"><i data-lucide="more-horizontal" class="w-5 h-5"></i></button>
                        </div>
                        <p class="text-[11px] font-bold text-gray-600 uppercase tracking-widest leading-loose mb-8">Announcing the winners of our Hackathon 2026! Congratulations to Team 'Neural' for securing the first position with their innovative AI-driven sustainable energy solution. ✱</p>
                        <div class="grid grid-cols-2 gap-4 mb-8 rounded-3xl overflow-hidden">
                            <div class="h-64 bg-gray-100"><img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=800&q=80" class="w-full h-full object-cover"></div>
                            <div class="h-64 bg-gray-200"><img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=800&q=80" class="w-full h-full object-cover"></div>
                        </div>
                        <div class="flex items-center gap-8 pt-6 border-t border-black/5">
                            <button class="flex items-center gap-2 text-gray-400 hover:text-red-500 transition-all text-[10px] font-black uppercase tracking-widest"><i data-lucide="heart" class="w-4 h-4"></i> 124</button>
                            <button class="flex items-center gap-2 text-gray-400 hover:text-red-500 transition-all text-[10px] font-black uppercase tracking-widest"><i data-lucide="message-square" class="w-4 h-4"></i> 32</button>
                            <button class="flex items-center gap-2 text-gray-400 hover:text-red-500 transition-all text-[10px] font-black uppercase tracking-widest ml-auto"><i data-lucide="share" class="w-4 h-4"></i> Share</button>
                        </div>
                    </div>

                    <!-- POST 2 -->
                    <div class="post-card">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="w-12 h-12 bg-red-500 rounded-2xl flex items-center justify-center text-white font-[Orbitron] font-black">AD</div>
                            <div>
                                <h3 class="text-sm font-black text-gray-900 uppercase tracking-widest">Admin Office</h3>
                                <p class="text-[8px] text-gray-400 font-bold uppercase tracking-widest">5 hours ago • Important</p>
                            </div>
                        </div>
                        <p class="text-[11px] font-bold text-gray-600 uppercase tracking-widest leading-loose mb-0">Holiday Notice: Campus will remain closed on Friday for Institutional Day celebrations. Enjoy the break!</p>
                    </div>
                </div>

                <!-- RIGHT PANEL -->
                <aside class="space-y-12">
                    <!-- TRENDING -->
                    <div class="glass p-8 rounded-[40px]">
                        <h3 class="font-[Orbitron] text-[10px] tracking-[0.4em] text-gray-400 uppercase mb-8">Trending Now</h3>
                        <div class="space-y-2">
                            <div class="trending-item">
                                <div class="w-10 h-10 bg-black text-white rounded-xl flex items-center justify-center font-[Orbitron] text-xs font-black">#1</div>
                                <div>
                                    <h4 class="text-[9px] font-black uppercase tracking-widest text-gray-900">#TechFest2026</h4>
                                    <p class="text-[7px] text-gray-400 font-bold uppercase tracking-widest">2.4k Mentions</p>
                                </div>
                            </div>
                            <div class="trending-item">
                                <div class="w-10 h-10 bg-red-500/10 text-red-500 rounded-xl flex items-center justify-center font-[Orbitron] text-xs font-black">#2</div>
                                <div>
                                    <h4 class="text-[9px] font-black uppercase tracking-widest text-gray-900">#NeuralHack</h4>
                                    <p class="text-[7px] text-gray-400 font-bold uppercase tracking-widest">1.1k Mentions</p>
                                </div>
                            </div>
                            <div class="trending-item">
                                <div class="w-10 h-10 bg-black text-white rounded-xl flex items-center justify-center font-[Orbitron] text-xs font-black">#3</div>
                                <div>
                                    <h4 class="text-[9px] font-black uppercase tracking-widest text-gray-900">#GurukulAlumni</h4>
                                    <p class="text-[7px] text-gray-400 font-bold uppercase tracking-widest">850 Mentions</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- POPULAR CLUBS -->
                    <div>
                        <h3 class="font-[Orbitron] text-[10px] tracking-[0.4em] text-gray-400 uppercase mb-8 px-4">Popular Clubs</h3>
                        <div class="space-y-4">
                            <div class="flex items-center gap-4 bg-white p-4 rounded-2xl border border-black/5">
                                <div class="w-12 h-12 bg-gray-100 rounded-xl overflow-hidden"><img src="https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=100&q=80" class="w-full h-full object-cover"></div>
                                <div class="flex-grow">
                                    <h4 class="text-[10px] font-black uppercase tracking-widest text-gray-900">Cyber Security</h4>
                                    <p class="text-[8px] text-gray-400 font-bold tracking-widest">1,240 Members</p>
                                </div>
                                <button class="p-2 text-red-500 hover:bg-red-500/5 rounded-lg"><i data-lucide="plus" class="w-5 h-5"></i></button>
                            </div>
                            <div class="flex items-center gap-4 bg-white p-4 rounded-2xl border border-black/5">
                                <div class="w-12 h-12 bg-gray-100 rounded-xl overflow-hidden"><img src="https://images.unsplash.com/photo-1531297484001-80022131f5a1?auto=format&fit=crop&w=100&q=80" class="w-full h-full object-cover"></div>
                                <div class="flex-grow">
                                    <h4 class="text-[10px] font-black uppercase tracking-widest text-gray-900">Robotics Unit</h4>
                                    <p class="text-[8px] text-gray-400 font-bold tracking-widest">980 Members</p>
                                </div>
                                <button class="p-2 text-red-500 hover:bg-red-500/5 rounded-lg"><i data-lucide="plus" class="w-5 h-5"></i></button>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
