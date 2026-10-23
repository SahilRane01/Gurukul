<%--
  File: meeting.jsp
  
  EXPLAIN LIKE I AM 5 (ELI5):
  - WHAT IT DOES: A video room where everyone's face shows up on camera, with buttons to mute mic or share drawings!
  - WHY IT IS USED: So teachers and students can see and talk to each other even when studying from home!
--%>

<%@ page import="com.gurukul.models.UserProfile" isELIgnored="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    UserProfile user = (UserProfile) session.getAttribute("user");
    String meetingId = request.getParameter("id");
    String roomName  = request.getParameter("room");
    boolean isTeacher = "Teacher".equalsIgnoreCase(user.getRole());
    String safeRoom = (meetingId != null ? meetingId : "orbit").replaceAll("[^a-zA-Z0-9-_]", "-");

    // Build the WebSocket URL dynamically
    String proto = request.getHeader("X-Forwarded-Proto");
    if (proto != null && proto.contains("https")) {
        proto = "wss";
    } else {
        proto = request.isSecure() ? "wss" : "ws";
    }
    String wsHost = request.getHeader("X-Forwarded-Host");
    if (wsHost == null || wsHost.isEmpty()) wsHost = request.getServerName() + ":" + request.getServerPort();
    String contextPath = request.getContextPath();
    String wsUrl = proto + "://" + wsHost + contextPath + "/signal/" + safeRoom;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Room – <%= roomName %></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .grid-bg { background-image: linear-gradient(to right,rgba(255,255,255,.04) 1px,transparent 1px),linear-gradient(to bottom,rgba(255,255,255,.04) 1px,transparent 1px); background-size:30px 30px; }
        .video-tile { position:relative; background:#000; border-radius:4px; overflow:hidden; border:1px solid rgba(255,255,255,.05); box-shadow:0 20px 40px rgba(0,0,0,.8); aspect-ratio:16/9; }
        .video-tile:hover .tile-actions { opacity:1; }
        .hud-label { position:absolute; top:12px; left:16px; padding:3px 10px; font-size:7px; font-weight:900; letter-spacing:.3em; text-transform:uppercase; border-left:2px solid; }
        /* Fullscreen hover overlay */
        .tile-actions { position:absolute; top:8px; right:8px; display:flex; gap:6px; opacity:0; transition:opacity .2s; z-index:10; }
        .tile-btn { width:28px; height:28px; border-radius:4px; border:1px solid rgba(255,255,255,.15); background:rgba(0,0,0,.6); backdrop-filter:blur(6px); display:flex; align-items:center; justify-content:center; cursor:pointer; transition:all .2s; }
        .tile-btn:hover { background:rgba(220,38,38,.7); border-color:#dc2626; }
        /* Fullscreen video fills the whole screen */
        .video-tile:fullscreen, .video-tile:-webkit-full-screen { aspect-ratio:unset; border-radius:0; border:none; }
        .video-tile:fullscreen video, .video-tile:-webkit-full-screen video { object-fit:contain; background:#000; }
        .video-tile:fullscreen .hud-label, .video-tile:-webkit-full-screen .hud-label { display:block; }
        .ctrl-btn { width:48px; height:48px; border-radius:50%; border:1px solid rgba(255,255,255,.1); background:rgba(255,255,255,.05); display:flex; align-items:center; justify-content:center; cursor:pointer; transition:all .3s; }
        .ctrl-btn:hover { background:rgba(255,255,255,.15); }
        .ctrl-btn.on { background:#dc2626; border-color:#dc2626; box-shadow:0 0 20px rgba(220,38,38,.4); }
        #video-grid { display:grid; grid-template-columns:repeat(auto-fill, minmax(360px, 1fr)); gap:16px; padding:24px; overflow-y:auto; }
    </style>
</head>
<body style="background:#020202; color:#fff; height:100vh; overflow:hidden; display:flex; flex-direction:column;">
<div style="position:fixed;inset:0;pointer-events:none;z-index:0;" class="grid-bg opacity-30"></div>

<!-- HUD HEADER -->
<header style="position:relative;z-index:50;border-bottom:1px solid rgba(255,255,255,.05);padding:10px 24px;display:flex;justify-content:space-between;align-items:center;background:rgba(0,0,0,.9);backdrop-filter:blur(20px);flex-shrink:0;">
    <div style="display:flex;align-items:center;gap:16px;">
        <div style="width:36px;height:36px;background:#dc2626;display:flex;align-items:center;justify-content:center;font-family:Orbitron,sans-serif;font-size:10px;font-weight:900;box-shadow:0 0 20px rgba(239,68,68,.5);">GKL</div>
        <div>
            <h1 style="font-family:Orbitron,sans-serif;font-size:10px;letter-spacing:.4em;font-weight:900;text-transform:uppercase;color:#ef4444;margin:0;">Session: <%= roomName %></h1>
            <p style="font-size:7px;color:#4b5563;letter-spacing:.3em;font-weight:700;text-transform:uppercase;margin:2px 0 0;">ID: <%= meetingId %></p>
        </div>
    </div>
    <div style="display:flex;align-items:center;gap:12px;">
        <div style="display:flex;align-items:center;gap:8px;background:rgba(220,38,38,.1);border:1px solid rgba(220,38,38,.3);border-radius:999px;padding:4px 12px;">
            <div style="width:8px;height:8px;background:#ef4444;border-radius:50%;animation:pulse 2s infinite;"></div>
            <span id="status-text" style="font-size:8px;font-weight:900;letter-spacing:.2em;color:#f87171;text-transform:uppercase;">Connecting…</span>
        </div>
        <% if (isTeacher) { %>
        <form action="meetingAction" method="post" style="display:inline;">
            <input type="hidden" name="action" value="END_MEETING">
            <input type="hidden" name="meetingId" value="<%= meetingId %>">
            <button type="submit" style="background:#dc2626;color:#fff;padding:8px 20px;font-family:Orbitron,sans-serif;font-size:8px;letter-spacing:.3em;font-weight:900;text-transform:uppercase;border:none;cursor:pointer;">End Session</button>
        </form>
        <% } else { %>
        <a href="dashboard.jsp" style="background:rgba(255,255,255,.05);color:#9ca3af;padding:8px 20px;font-family:Orbitron,sans-serif;font-size:8px;letter-spacing:.2em;font-weight:900;text-transform:uppercase;border:1px solid rgba(255,255,255,.1);text-decoration:none;">Leave</a>
        <% } %>
    </div>
</header>

<!-- VIDEO GRID -->
<main style="flex-grow:1;position:relative;z-index:10;overflow:hidden;display:flex;flex-direction:column;">
    <div id="video-grid">
        <!-- Local tile injected by JS -->
    </div>
</main>

<!-- PARTICIPANTS SIDEBAR -->
<div id="participants-panel" style="display:none;position:fixed;right:0;top:58px;bottom:70px;width:220px;background:rgba(0,0,0,.85);border-left:1px solid rgba(255,255,255,.05);padding:16px;z-index:40;overflow-y:auto;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
        <h3 style="font-family:Orbitron,sans-serif;font-size:9px;letter-spacing:.3em;font-weight:900;color:#ef4444;text-transform:uppercase;margin:0;">Participants</h3>
        <button onclick="togglePanel()" style="background:none;border:none;cursor:pointer;color:#6b7280;"><i data-lucide="x" style="width:14px;height:14px;"></i></button>
    </div>
    <ul id="participants-list" style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:10px;font-size:9px;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#9ca3af;">
        <li style="display:flex;align-items:center;gap:8px;color:#f87171;">
            <div style="width:6px;height:6px;background:#ef4444;border-radius:50%;animation:pulse 2s infinite;"></div>
            <%= user.getFullName() %> (You)
        </li>
    </ul>
</div>

<!-- AI ASSISTANT PANEL -->
<div id="ai-panel" style="position:fixed;left:0;top:58px;bottom:70px;width:320px;background:rgba(0,0,0,.85);border-right:1px solid rgba(255,255,255,.05);padding:16px;z-index:40;display:flex;flex-direction:column;transition:transform 0.3s ease;transform:translateX(-100%);">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
        <div style="display:flex;align-items:center;gap:8px;">
            <div style="width:24px;height:24px;background:#3b82f6;border-radius:4px;display:flex;align-items:center;justify-content:center;color:#fff;"><i data-lucide="bot" style="width:14px;height:14px;"></i></div>
            <h3 style="font-family:Orbitron,sans-serif;font-size:10px;letter-spacing:.3em;font-weight:900;color:#3b82f6;text-transform:uppercase;margin:0;">Gurukul AI</h3>
        </div>
        <button onclick="toggleAiPanel()" style="background:none;border:none;cursor:pointer;color:#6b7280;"><i data-lucide="x" style="width:14px;height:14px;"></i></button>
    </div>
    
    <div id="ai-chat-history" style="flex-grow:1;overflow-y:auto;margin-bottom:12px;display:flex;flex-direction:column;gap:12px;font-size:12px;line-height:1.4;font-weight:500;color:#d1d5db;padding-right:8px;">
        <!-- Initial greeting -->
        <div style="align-self:flex-start;background:rgba(59,130,246,.1);border:1px solid rgba(59,130,246,.3);padding:10px 12px;border-radius:8px;max-width:85%;border-top-left-radius:0;">
            <div style="font-size:8px;color:#60a5fa;margin-bottom:4px;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;">Gurukul AI</div>
            Hi <%= user.getFullName() %>! How can I help you with this session?
        </div>
    </div>
    
    <div style="display:flex;gap:8px;position:relative;">
        <input type="text" id="ai-chat-input" placeholder="Ask AI..." style="flex-grow:1;background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.1);border-radius:6px;padding:10px 12px;color:#fff;font-size:12px;outline:none;" onkeypress="if(event.key === 'Enter') sendAiMessage()">
        <button id="ai-send-btn" onclick="sendAiMessage()" style="background:#3b82f6;color:#fff;border:none;border-radius:6px;padding:0 14px;cursor:pointer;display:flex;align-items:center;justify-content:center;transition:background .2s;"><i data-lucide="send" style="width:14px;height:14px;"></i></button>
    </div>
</div>

<!-- DEBUG BAR -->
<div id="debug-bar" style="position:relative;z-index:50;background:rgba(0,0,0,.5);border-top:1px solid rgba(255,255,255,.04);padding:4px 20px;display:flex;gap:12px;align-items:center;flex-shrink:0;font-size:7px;font-family:monospace;">
    <span style="color:#4b5563;font-weight:700;letter-spacing:.2em;text-transform:uppercase;">WS:</span>
    <span id="ws-state" style="color:#eab308;">–</span>
    <span style="color:#374151;">|</span>
    <span style="color:#4b5563;font-weight:700;letter-spacing:.2em;text-transform:uppercase;">ICE:</span>
    <span id="ice-state" style="color:#eab308;">–</span>
    <span style="color:#374151;">|</span>
    <span id="debug-msg" style="color:#6b7280;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;max-width:600px;"></span>
</div>

<!-- CONTROLS -->
<div style="position:relative;z-index:50;padding:12px 0;display:flex;justify-content:center;align-items:center;gap:24px;background:rgba(0,0,0,.6);border-top:1px solid rgba(255,255,255,.04);flex-shrink:0;">
    <button id="btn-ai"     class="ctrl-btn"    onclick="toggleAiPanel()"     title="Gurukul AI Assistant"><i data-lucide="bot"       style="width:20px;height:20px;"></i></button>
    <button id="btn-mic"    class="ctrl-btn on" onclick="toggleMic()"         title="Toggle Mic"><i data-lucide="mic"         style="width:20px;height:20px;"></i></button>
    <button id="btn-cam"    class="ctrl-btn on" onclick="toggleCam()"         title="Toggle Camera"><i data-lucide="video"       style="width:20px;height:20px;"></i></button>
    <button id="btn-screen" class="ctrl-btn"    onclick="toggleScreenShare()" title="Share Screen"><i data-lucide="monitor"     style="width:20px;height:20px;"></i></button>
    <button class="ctrl-btn"                    onclick="togglePanel()"       title="Participants"><i data-lucide="users"       style="width:20px;height:20px;"></i></button>
    <button class="ctrl-btn" style="background:rgba(185,28,28,.6);border-color:#dc2626;" onclick="hangup()" title="Leave"><i data-lucide="phone-off" style="width:20px;height:20px;"></i></button>
</div>

<style>
@keyframes pulse { 0%,100%{opacity:1} 50%{opacity:.4} }
</style>

<script>
lucide.createIcons();

// ─── Config from server ──────────────────────────────────────────────────────
const WS_URL     = "<%= wsUrl %>";
const ROOM_ID    = "<%= safeRoom %>";
const MY_NAME    = "<%= user.getFullName() %>";
const IS_TEACHER = <%= isTeacher %>;
const REDIRECT   = IS_TEACHER ? "teacherDashboard.jsp" : "dashboard.jsp";

const ICE_SERVERS = [
    { urls: "stun:stun.l.google.com:19302" },
    { urls: "stun:stun1.l.google.com:19302" },
    { urls: "stun:stun2.l.google.com:19302" },
    { urls: "stun:stun.cloudflare.com:3478" },
    { urls: "stun:stun.services.mozilla.com" }
];

// ─── State ────────────────────────────────────────────────────────────────────
let localStream;
let ws;
let peers = {};       // socketId → RTCPeerConnection
let mySocketId = null;
let pendingJoins = [];
let iceQueues = {};   // socketId → pending ICE candidates
let screenStream = null;  // active screen share stream (or null)

// ─── Debug helpers ────────────────────────────────────────────────────────────
function setStatus(t) { document.getElementById('status-text').innerText = t; }
function setWS(t)     { document.getElementById('ws-state').innerText = t; }
function setICE(t)    { document.getElementById('ice-state').innerText = t; }
function dbg(m)       { document.getElementById('debug-msg').innerText = m; console.log('[ORBIT]', m); }

// ─── 1. Get Camera + Mic ─────────────────────────────────────────────────────
async function init() {
    try {
        localStream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
        dbg("Camera acquired");
        addLocalTile();
        connectWS();
    } catch (e) {
        setStatus("Camera error");
        dbg("getUserMedia failed: " + e.message);
    }
}

function addLocalTile() {
    const tile = makeTile("local-tile");
    const video = tile.querySelector('video');
    video.muted = true;
    video.classList.add("scale-x-[-1]");
    const lbl = tile.querySelector('.hud-label');
    lbl.style.borderColor = "#dc2626";
    lbl.style.color = "#ef4444";
    lbl.style.background = "rgba(220,38,38,.1)";
    lbl.innerText = "YOU · " + MY_NAME.toUpperCase();
    document.getElementById('video-grid').appendChild(tile);
    video.srcObject = localStream;
    video.play().catch(function(){});
}

// ─── 2. WebSocket Signaling ───────────────────────────────────────────────────
function connectWS() {
    dbg("Connecting to signaling: " + WS_URL);
    ws = new WebSocket(WS_URL);
    setWS("connecting");

    ws.onopen = function() {
        setWS("open");
        setStatus("Waiting for peers…");
        dbg("WS connected");
    };

    ws.onclose = function() {
        setWS("closed");
        dbg("WS closed – reconnecting in 3s");
        setTimeout(connectWS, 3000);
    };

    ws.onerror = function(e) {
        setWS("error");
        dbg("WS error");
    };

    ws.onmessage = function(evt) {
        var msg;
        try { msg = JSON.parse(evt.data); } catch(e) { return; }
        dbg("WS msg: " + msg.type + (msg.from ? " from " + msg.from.substring(0,6) : ""));

        switch (msg.type) {
            case "your-id":
                mySocketId = msg.id;
                dbg("My socket ID: " + mySocketId.substring(0,8));
                // Now flush any user-joined events that arrived before we knew our ID
                pendingJoins.forEach(function(joinId) {
                    if (joinId !== mySocketId) {
                        dbg("Peer (buffered) joined: " + joinId.substring(0,8) + " – creating offer");
                        createOffer(joinId);
                    }
                });
                pendingJoins = [];
                break;
            case "user-joined":
                if (!mySocketId) {
                    // Not ready yet — buffer this event
                    pendingJoins.push(msg.id);
                } else if (msg.id !== mySocketId) {
                    dbg("Peer joined: " + msg.id.substring(0,8) + " – creating offer");
                    createOffer(msg.id);
                }
                break;
            case "offer":
                if (msg.from && msg.from !== mySocketId) handleOffer(msg.from, msg.sdp);
                break;
            case "answer":
                if (msg.from && peers[msg.from]) {
                    peers[msg.from].setRemoteDescription(new RTCSessionDescription({ type: "answer", sdp: msg.sdp }))
                        .then(function() { 
                            dbg("Remote answer set for " + msg.from.substring(0,6)); 
                            flushIceQueue(msg.from);
                        })
                        .catch(function(e) { dbg("setRemoteDesc error: " + e); });
                }
                break;
            case "ice":
                if (msg.from && peers[msg.from] && msg.candidate) {
                    let pc = peers[msg.from];
                    let cand = new RTCIceCandidate(msg.candidate);
                    if (pc.remoteDescription && pc.remoteDescription.type) {
                        pc.addIceCandidate(cand).catch(function(e) { dbg("addIce error: " + e); });
                    } else {
                        if (!iceQueues[msg.from]) iceQueues[msg.from] = [];
                        iceQueues[msg.from].push(cand);
                    }
                }
                break;
            case "user-left":
                removePeer(msg.id);
                break;
        }
    };
}

function send(obj) {
    if (ws && ws.readyState === WebSocket.OPEN) {
        ws.send(JSON.stringify(obj));
    }
}

// ─── 3. WebRTC ────────────────────────────────────────────────────────────────
function createPC(peerId) {
    var pc = new RTCPeerConnection({ iceServers: ICE_SERVERS });
    peers[peerId] = pc;

    // Add local tracks
    localStream.getTracks().forEach(function(t) { pc.addTrack(t, localStream); });

    // ICE candidates → signal
    pc.onicecandidate = function(e) {
        if (e.candidate) {
            send({ type: "ice", to: peerId, from: mySocketId, candidate: e.candidate });
        }
    };

    pc.oniceconnectionstatechange = function() {
        setICE(pc.iceConnectionState);
        dbg("ICE[" + peerId.substring(0,6) + "] → " + pc.iceConnectionState);
        if (pc.iceConnectionState === "connected" || pc.iceConnectionState === "completed") {
            setStatus("Live ✓");
        }
        if (pc.iceConnectionState === "failed") {
            setStatus("ICE failed");
        }
    };

    // Remote tracks → video tile
    pc.ontrack = function(e) {
        dbg("ontrack from " + peerId.substring(0,6) + " streams:" + e.streams.length);
        if (e.streams && e.streams[0]) {
            addRemoteTile(peerId, e.streams[0]);
            addParticipant(peerId);
            setStatus("Live ✓");
        }
    };

    return pc;
}

function createOffer(peerId) {
    var pc = createPC(peerId);
    pc.createOffer()
        .then(function(offer) { return pc.setLocalDescription(offer); })
        .then(function() {
            send({ type: "offer", to: peerId, from: mySocketId, sdp: pc.localDescription.sdp });
            dbg("Offer sent to " + peerId.substring(0,6));
        })
        .catch(function(e) { dbg("createOffer error: " + e); });
}

function handleOffer(peerId, sdp) {
    var pc = createPC(peerId);
    pc.setRemoteDescription(new RTCSessionDescription({ type: "offer", sdp: sdp }))
        .then(function() { 
            flushIceQueue(peerId);
            return pc.createAnswer(); 
        })
        .then(function(answer) { return pc.setLocalDescription(answer); })
        .then(function() {
            send({ type: "answer", to: peerId, from: mySocketId, sdp: pc.localDescription.sdp });
            dbg("Answer sent to " + peerId.substring(0,6));
        })
        .catch(function(e) { dbg("handleOffer error: " + e); });
}

function flushIceQueue(peerId) {
    if (peers[peerId] && iceQueues[peerId]) {
        iceQueues[peerId].forEach(function(cand) {
            peers[peerId].addIceCandidate(cand).catch(function(e) { dbg("buffered addIce error: " + e); });
        });
        delete iceQueues[peerId];
    }
}

function removePeer(peerId) {
    if (peers[peerId]) { peers[peerId].close(); delete peers[peerId]; }
    var tile = document.getElementById('tile-' + peerId);
    if (tile) tile.remove();
    var li = document.getElementById('part-' + peerId);
    if (li) li.remove();
}

// ─── 4. UI helpers ────────────────────────────────────────────────────────────
function makeTile(id) {
    var tile = document.createElement('div');
    tile.id = id;
    tile.className = 'video-tile';

    var video = document.createElement('video');
    video.autoplay = true;
    video.playsInline = true;
    video.style.cssText = 'width:100%;height:100%;object-fit:cover;';

    var label = document.createElement('div');
    label.className = 'hud-label';
    label.style.cssText = 'border-color:rgba(255,255,255,.2);background:rgba(255,255,255,.04);color:rgba(255,255,255,.4);';

    // ── Hover action buttons (fullscreen + pip) ────────────────────────────
    var actions = document.createElement('div');
    actions.className = 'tile-actions';

    // Fullscreen button
    var fsBtn = document.createElement('button');
    fsBtn.className = 'tile-btn';
    fsBtn.title = 'Full Screen';
    fsBtn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 3 21 3 21 9"/><polyline points="9 21 3 21 3 15"/><line x1="21" y1="3" x2="14" y2="10"/><line x1="3" y1="21" x2="10" y2="14"/></svg>';
    fsBtn.onclick = function(e) { e.stopPropagation(); enterFullscreen(tile, fsBtn); };

    // Picture-in-picture button
    var pipBtn = document.createElement('button');
    pipBtn.className = 'tile-btn';
    pipBtn.title = 'Picture in Picture';
    pipBtn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="2" ry="2"/><rect x="12" y="13" width="8" height="6" rx="1"/></svg>';
    pipBtn.onclick = function(e) { e.stopPropagation(); togglePip(video, pipBtn); };

    actions.appendChild(fsBtn);
    actions.appendChild(pipBtn);

    tile.appendChild(video);
    tile.appendChild(label);
    tile.appendChild(actions);

    // Update fullscreen icon when user presses Esc to exit
    tile.addEventListener('fullscreenchange', function() {
        updateFsIcon(fsBtn, !!document.fullscreenElement);
    });
    tile.addEventListener('webkitfullscreenchange', function() {
        updateFsIcon(fsBtn, !!document.webkitFullscreenElement);
    });

    return tile;
}

function enterFullscreen(tile, btn) {
    var isFs = document.fullscreenElement === tile || document.webkitFullscreenElement === tile;
    if (isFs) {
        // Exit fullscreen
        (document.exitFullscreen || document.webkitExitFullscreen).call(document);
    } else {
        // Enter fullscreen
        var req = tile.requestFullscreen || tile.webkitRequestFullscreen;
        if (req) req.call(tile).catch(function(e) { dbg('Fullscreen denied: ' + e.message); });
    }
}

function updateFsIcon(btn, isFullscreen) {
    if (isFullscreen) {
        // Show compress / exit icon
        btn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 14 10 14 10 20"/><polyline points="20 10 14 10 14 4"/><line x1="10" y1="14" x2="3" y2="21"/><line x1="21" y1="3" x2="14" y2="10"/></svg>';
        btn.title = 'Exit Full Screen';
        btn.style.background = 'rgba(220,38,38,.7)';
    } else {
        btn.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 3 21 3 21 9"/><polyline points="9 21 3 21 3 15"/><line x1="21" y1="3" x2="14" y2="10"/><line x1="3" y1="21" x2="10" y2="14"/></svg>';
        btn.title = 'Full Screen';
        btn.style.background = '';
    }
}

function togglePip(video, btn) {
    if (document.pictureInPictureElement === video) {
        document.exitPictureInPicture().catch(function(){});
        btn.style.background = '';
    } else if (document.pictureInPictureEnabled) {
        video.requestPictureInPicture().then(function() {
            btn.style.background = 'rgba(220,38,38,.7)';
            video.addEventListener('leavepictureinpicture', function() {
                btn.style.background = '';
            }, { once: true });
        }).catch(function(e) { dbg('PiP denied: ' + e.message); });
    }
}

function addRemoteTile(peerId, stream) {
    var existing = document.getElementById('tile-' + peerId);
    if (existing) {
        existing.querySelector('video').srcObject = stream;
        existing.querySelector('video').play().catch(function(){});
        return;
    }
    var tile = makeTile('tile-' + peerId);
    tile.querySelector('.hud-label').innerText = "PARTICIPANT · " + peerId.substring(0, 6).toUpperCase();
    document.getElementById('video-grid').appendChild(tile);
    var video = tile.querySelector('video');
    video.srcObject = stream;
    video.play().catch(function(e) { dbg("play() warn: " + e.message); });
}

function addParticipant(peerId) {
    var list = document.getElementById('participants-list');
    if (document.getElementById('part-' + peerId)) return;
    var li = document.createElement('li');
    li.id = 'part-' + peerId;
    li.style.cssText = 'display:flex;align-items:center;gap:8px;color:#fff;';
    li.innerHTML = '<div style="width:6px;height:6px;background:#22c55e;border-radius:50%;"></div>Node: ' + peerId.substring(0,6);
    list.appendChild(li);
}

function togglePanel() {
    var p = document.getElementById('participants-panel');
    p.style.display = p.style.display === 'none' ? 'block' : 'none';
}

function toggleAiPanel() {
    var p = document.getElementById('ai-panel');
    var isClosed = p.style.transform === 'translateX(-100%)';
    p.style.transform = isClosed ? 'translateX(0)' : 'translateX(-100%)';
    if (isClosed) {
        setTimeout(function() { document.getElementById('ai-chat-input').focus(); }, 300);
        document.getElementById('btn-ai').classList.add('on');
        document.getElementById('btn-ai').style.background = 'rgba(59,130,246,.2)';
        document.getElementById('btn-ai').style.borderColor = '#3b82f6';
        document.getElementById('btn-ai').style.boxShadow = '0 0 20px rgba(59,130,246,.4)';
    } else {
        document.getElementById('btn-ai').classList.remove('on');
        document.getElementById('btn-ai').style.background = '';
        document.getElementById('btn-ai').style.borderColor = '';
        document.getElementById('btn-ai').style.boxShadow = '';
    }
}

async function sendAiMessage() {
    var input = document.getElementById('ai-chat-input');
    var text = input.value.trim();
    if (!text) return;
    
    input.value = '';
    var history = document.getElementById('ai-chat-history');
    
    // Add user message
    var userMsg = document.createElement('div');
    userMsg.style.cssText = 'align-self:flex-end;background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.1);padding:10px 12px;border-radius:8px;max-width:85%;border-top-right-radius:0;color:#fff;';
    userMsg.innerHTML = '<div style="font-size:8px;color:#9ca3af;margin-bottom:4px;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;">You</div>' + text.replace(/</g, "&lt;").replace(/>/g, "&gt;");
    history.appendChild(userMsg);
    history.scrollTop = history.scrollHeight;
    
    // Add loading indicator
    var loadingMsg = document.createElement('div');
    loadingMsg.id = 'ai-loading';
    loadingMsg.style.cssText = 'align-self:flex-start;background:rgba(59,130,246,.1);border:1px solid rgba(59,130,246,.3);padding:10px 12px;border-radius:8px;max-width:85%;border-top-left-radius:0;color:#9ca3af;font-style:italic;display:flex;align-items:center;gap:6px;';
    loadingMsg.innerHTML = '<div style="width:4px;height:4px;background:#60a5fa;border-radius:50%;animation:pulse 1s infinite;"></div><div style="width:4px;height:4px;background:#60a5fa;border-radius:50%;animation:pulse 1s infinite .2s;"></div><div style="width:4px;height:4px;background:#60a5fa;border-radius:50%;animation:pulse 1s infinite .4s;"></div>';
    history.appendChild(loadingMsg);
    history.scrollTop = history.scrollHeight;
    
    var btn = document.getElementById('ai-send-btn');
    btn.disabled = true;
    btn.style.opacity = '0.5';
    
    try {
        const response = await fetch('krutyam_ai.jsp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                username: MY_NAME,
                prompt: text
            })
        });
        
        const data = await response.json();
        
        // Remove loading
        if (document.getElementById('ai-loading')) {
            document.getElementById('ai-loading').remove();
        }
        
        // Add AI message
        var aiMsg = document.createElement('div');
        aiMsg.style.cssText = 'align-self:flex-start;background:rgba(59,130,246,.1);border:1px solid rgba(59,130,246,.3);padding:10px 12px;border-radius:8px;max-width:85%;border-top-left-radius:0;';
        aiMsg.innerHTML = '<div style="font-size:8px;color:#60a5fa;margin-bottom:4px;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;">Gurukul AI</div>' + (data.response || 'Sorry, I could not process that.').replace(/</g, "&lt;").replace(/>/g, "&gt;");
        history.appendChild(aiMsg);
        
    } catch (err) {
        dbg('AI Fetch Error: ' + err.message);
        if (document.getElementById('ai-loading')) {
            document.getElementById('ai-loading').remove();
        }
        var errorMsg = document.createElement('div');
        errorMsg.style.cssText = 'align-self:flex-start;background:rgba(220,38,38,.1);border:1px solid rgba(220,38,38,.3);padding:10px 12px;border-radius:8px;max-width:85%;border-top-left-radius:0;color:#f87171;';
        errorMsg.innerHTML = '<div style="font-size:8px;color:#ef4444;margin-bottom:4px;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;">Error</div>Could not connect to Gurukul AI.';
        history.appendChild(errorMsg);
    }
    
    history.scrollTop = history.scrollHeight;
    btn.disabled = false;
    btn.style.opacity = '1';
    input.focus();
}

function toggleMic() {
    var t = localStream.getAudioTracks()[0];
    t.enabled = !t.enabled;
    var btn = document.getElementById('btn-mic');
    btn.className = 'ctrl-btn' + (t.enabled ? ' on' : '');
    btn.querySelector('i').setAttribute('data-lucide', t.enabled ? 'mic' : 'mic-off');
    lucide.createIcons();
}

function toggleCam() {
    if (screenStream) return; // cam toggle disabled while sharing screen
    var t = localStream.getVideoTracks()[0];
    t.enabled = !t.enabled;
    var btn = document.getElementById('btn-cam');
    btn.className = 'ctrl-btn' + (t.enabled ? ' on' : '');
    btn.querySelector('i').setAttribute('data-lucide', t.enabled ? 'video' : 'video-off');
    lucide.createIcons();
}

async function toggleScreenShare() {
    var btn = document.getElementById('btn-screen');

    if (screenStream) {
        // ── STOP screen share ─────────────────────────────────────────────────
        screenStream.getTracks().forEach(function(t) { t.stop(); });
        screenStream = null;

        // Replace screen track back with camera track in all peer connections
        var camTrack = localStream.getVideoTracks()[0];
        Object.values(peers).forEach(function(pc) {
            var sender = pc.getSenders().find(function(s) { return s.track && s.track.kind === 'video'; });
            if (sender && camTrack) sender.replaceTrack(camTrack);
        });

        // Restore local tile to camera feed
        document.getElementById('local-tile').querySelector('video').srcObject = localStream;

        btn.className = 'ctrl-btn';
        btn.querySelector('i').setAttribute('data-lucide', 'monitor');
        btn.title = 'Share Screen';
        setStatus('Camera restored');
        dbg('Screen share stopped');
    } else {
        // ── START screen share ────────────────────────────────────────────────
        try {
            screenStream = await navigator.mediaDevices.getDisplayMedia({ video: true, audio: true });
        } catch(e) {
            dbg('getDisplayMedia denied: ' + e.message);
            return;
        }

        var screenTrack = screenStream.getVideoTracks()[0];

        // Replace video track in every active peer connection (no renegotiation needed)
        Object.values(peers).forEach(function(pc) {
            var sender = pc.getSenders().find(function(s) { return s.track && s.track.kind === 'video'; });
            if (sender) sender.replaceTrack(screenTrack);
        });

        // Show screen feed in local tile
        var localVid = document.getElementById('local-tile').querySelector('video');
        localVid.srcObject = screenStream;
        localVid.play().catch(function(){});

        // Auto-stop when user clicks browser's native 'Stop Sharing' button
        screenTrack.onended = function() {
            if (screenStream) toggleScreenShare();
        };

        btn.className = 'ctrl-btn on';
        btn.querySelector('i').setAttribute('data-lucide', 'monitor-x');
        btn.title = 'Stop Sharing';
        setStatus('Screen sharing…');
        dbg('Screen share started');
    }
    lucide.createIcons();
}

function hangup() {
    if (screenStream) { screenStream.getTracks().forEach(function(t) { t.stop(); }); }
    Object.keys(peers).forEach(function(id) { peers[id].close(); });
    if (ws) ws.close();
    if (localStream) localStream.getTracks().forEach(function(t) { t.stop(); });
    window.location.href = REDIRECT;
}

init();
</script>
</body>
</html>
