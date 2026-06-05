package com.gurukul.controllers;

import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * WebSocket signaling server for WebRTC peer-to-peer calls.
 * Routes offer/answer/ICE messages directly between peers using the 'to' field.
 */
@ServerEndpoint("/signal/{room}")
public class SignalingEndpoint {

    // roomId → set of open WebSocket sessions
    private static final Map<String, Set<Session>> ROOMS = new ConcurrentHashMap<>();
    // sessionId → Session (for targeted messaging)
    private static final Map<String, Session>       SESSIONS = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("room") String room) {
        SESSIONS.put(session.getId(), session);
        ROOMS.computeIfAbsent(room, k -> Collections.synchronizedSet(new HashSet<>())).add(session);

        // 1. Tell this new user their own session ID
        sendTo(session, "{\"type\":\"your-id\",\"id\":\"" + session.getId() + "\"}");

        // 2. Tell every other peer that this user joined
        broadcast(room, session, "{\"type\":\"user-joined\",\"id\":\"" + session.getId() + "\"}");

        System.out.println("[Signal] " + session.getId() + " joined room: " + room
                + " | peers now: " + ROOMS.get(room).size());
    }

    @OnMessage
    public void onMessage(String message, Session sender, @PathParam("room") String room) {
        // Parse "to" field from JSON to route directly (avoids broadcasting to unintended peers)
        String to = extractField(message, "to");
        if (to != null && !to.isEmpty()) {
            // Targeted message — send only to the intended recipient
            Session target = SESSIONS.get(to);
            if (target != null && target.isOpen()) {
                sendTo(target, message);
            }
        } else {
            // Broadcast (e.g., user-joined, user-left) — send to all others in the room
            broadcast(room, sender, message);
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("room") String room) {
        SESSIONS.remove(session.getId());
        Set<Session> peers = ROOMS.get(room);
        if (peers != null) {
            peers.remove(session);
            if (peers.isEmpty()) ROOMS.remove(room);
        }
        broadcast(room, session, "{\"type\":\"user-left\",\"id\":\"" + session.getId() + "\"}");
        System.out.println("[Signal] " + session.getId() + " left room: " + room);
    }

    @OnError
    public void onError(Session session, Throwable t) {
        System.err.println("[Signal] Error on " + session.getId() + ": " + t.getMessage());
    }

    // ── helpers ──────────────────────────────────────────────────────────────

    private void sendTo(Session s, String message) {
        try {
            s.getBasicRemote().sendText(message);
        } catch (IOException e) {
            System.err.println("[Signal] Failed to send to " + s.getId() + ": " + e.getMessage());
        }
    }

    private void broadcast(String room, Session exclude, String message) {
        Set<Session> peers = ROOMS.get(room);
        if (peers == null) return;
        for (Session s : peers) {
            if (!s.getId().equals(exclude.getId()) && s.isOpen()) {
                sendTo(s, message);
            }
        }
    }

    /** Very lightweight JSON field extractor — no external dependency needed. */
    private String extractField(String json, String field) {
        String key = "\"" + field + "\"";
        int idx = json.indexOf(key);
        if (idx < 0) return null;
        int colon = json.indexOf(':', idx + key.length());
        if (colon < 0) return null;
        // Skip whitespace and opening quote
        int start = colon + 1;
        while (start < json.length() && (json.charAt(start) == ' ' || json.charAt(start) == '"')) start++;
        int end = start;
        // Read until closing quote or comma/brace
        while (end < json.length() && json.charAt(end) != '"' && json.charAt(end) != ',' && json.charAt(end) != '}') end++;
        return json.substring(start, end).trim();
    }
}
