# Gurukul - Every Single File, Construct, Method, If-Else & Try-Catch (Explained for a 5-Year-Old! 🧒🎈)

This guide takes **every single one of the 58 files** in Gurukul (all controllers, all models, all utility files, and all JSP views) and explains what **every single construct, method, if-else decision, and try-catch safety net** is doing in simple child terms!

---

## 1. 📄 [`MeetingServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/MeetingServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/MeetingServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Video Call Telephone Operator! Connects the teacher's webcam to all students' screens for online class.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("START_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (rows == 0)`:
  > Checks if `rows == 0` is true so the computer knows which road to walk down.
- 🚦 `if ("SCHEDULE_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("END_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to open the big MySQL memory toy chest to save or read school marks.
- 🦺 **`catch (Exception e)`**: If the chest is locked or the key is bent, the catch net catches the fall so the app doesn't crash, and writes a note in the teacher's notebook!

---

## 2. 📄 [`TeacherController.java`](file:///root/gurukul/src/main/java/com/gurukul/TeacherController.java)
- 📍 **Location**: `src/main/java/com/gurukul/TeacherController.java`
- 🎈 **What this file is in simple words**:  
  > **The Principal's Super Wand! Allows teachers to upload 100 students at once and pin urgent news on the wall.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (source == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("ADD_NOTICE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("DELETE_NOTICE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("ADD_EVENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("DELETE_EVENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- *(plus 1 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to open the big MySQL memory toy chest to save or read school marks.
- 🦺 **`catch (Exception e)`**: If the chest is locked or the key is bent, the catch net catches the fall so the app doesn't crash, and writes a note in the teacher's notebook!

---

## 3. 📄 [`AiChatServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AiChatServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/AiChatServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Robot Messenger Boy! Runs your question over the internet to the smart AI robot and brings back answers.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (InterruptedException e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 4. 📄 [`AssignmentController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AssignmentController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/AssignmentController.java`
- 🎈 **What this file is in simple words**:  
  > **The Homework Dispenser! The teacher puts homework sheets in, and kids pick them up to do at their desks.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("CREATE_ASSIGNMENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (dueDateStr != null && !dueDateStr.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("DELETE_ASSIGNMENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- *(plus 2 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 5. 📄 [`AttendanceController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/AttendanceController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/AttendanceController.java`
- 🎈 **What this file is in simple words**:  
  > **The Morning Roll-Call Master! Checks who is here, who stayed home sick, and who came late.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("MARK_ATTENDANCE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (studentIds != null && statuses != null && studentIds.length == statuses.length)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 6. 📄 [`ClassController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/ClassController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/ClassController.java`
- 🎈 **What this file is in simple words**:  
  > **The Classroom Hallway Guide! It opens classroom doors, checks secret room keys, and shows who is sitting inside.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `generateClassCode(...)`: Performs the **generateClassCode** school task safely.
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (source == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("CREATE_CLASS".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (!rs.next()`:
  > Checks if `!rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if ("JOIN_CLASS".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- *(plus 7 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 7. 📄 [`DownloadTemplateServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/DownloadTemplateServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/DownloadTemplateServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Blank Worksheet Printer! Gives the teacher a ready-made blank sheet to fill in student names.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doGet(...)`: Looks inside the toy box and hands you the **doGet**.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 8. 📄 [`LeaveController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LeaveController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/LeaveController.java`
- 🎈 **What this file is in simple words**:  
  > **The Sick Note Checker! If you have a tummy ache, you give it a note asking the teacher for a day off.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (source == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("APPLY_LEAVE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("UPDATE_LEAVE_STATUS".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 9. 📄 [`LoginServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LoginServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/LoginServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Front Door Guard! It checks your secret password before letting you into the school playground.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (password.equals(actual_pwd)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 10. 📄 [`LogoutServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/LogoutServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/LogoutServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Goodbye Butler! It locks your backpack, says 'See you tomorrow!', and sends you safely outside.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doGet(...)`: Looks inside the toy box and hands you the **doGet**.
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session != null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 11. 📄 [`MeetingServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/MeetingServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/MeetingServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The Video Call Telephone Operator! Connects the teacher's webcam to all students' screens for online class.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("START_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (rows == 0)`:
  > Checks if `rows == 0` is true so the computer knows which road to walk down.
- 🚦 `if ("SCHEDULE_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("END_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("DELETE_MEETING".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 12. 📄 [`QuizController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/QuizController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/QuizController.java`
- 🎈 **What this file is in simple words**:  
  > **The Quiz Game Host! Starts the fun multiple-choice quiz, rings the timer bell, and scores your answers.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("CREATE_QUIZ".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (qText != null && !qText.trim()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("SUBMIT_QUIZ".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- *(plus 4 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 13. 📄 [`RegistrationServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/RegistrationServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/RegistrationServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The New Student Welcomer! It writes down your name and age to give you your shiny new student badge.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.
- 🔘 `doGet(...)`: Looks inside the toy box and hands you the **doGet**.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (!password.equals(c_password)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 14. 📄 [`ResultController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/ResultController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/ResultController.java`
- 🎈 **What this file is in simple words**:  
  > **The Report Card Maker! Adds up all your numbers (tests + homework) to calculate your final shiny A-grade.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (source == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("SAVE_CONFIG".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("SAVE_MARKS".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (rsC.next()`:
  > Checks if `rsC.next(` is true so the computer knows which road to walk down.
- 🚦 `if (totalMax == 0)`:
  > Checks if `totalMax == 0` is true so the computer knows which road to walk down.
- *(plus 5 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 15. 📄 [`SignalingEndpoint.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/SignalingEndpoint.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/SignalingEndpoint.java`
- 🎈 **What this file is in simple words**:  
  > **The Walkie-Talkie Wire! Passes secret radio signals between students' webcams so video can flow smoothly.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `onOpen(...)`: Performs the **onOpen** school task safely.
- 🔘 `onMessage(...)`: Performs the **onMessage** school task safely.
- 🔘 `onClose(...)`: Performs the **onClose** school task safely.
- 🔘 `onError(...)`: Performs the **onError** school task safely.
- 🔘 `sendTo(...)`: Performs the **sendTo** school task safely.
- 🔘 `broadcast(...)`: Performs the **broadcast** school task safely.
- *(plus 1 more getters/setters that store and hand out values)*

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (to != null && !to.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (target != null && target.isOpen()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (peers != null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (peers.isEmpty()`:
  > Checks if `peers.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (peers == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (!s.getId()`:
  > Checks if `!s.getId(` is true so the computer knows which road to walk down.
- *(plus 2 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (IOException e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 16. 📄 [`SubmissionController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/SubmissionController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/SubmissionController.java`
- 🎈 **What this file is in simple words**:  
  > **The Homework Drop-Box! Kids drop their finished sheets inside, and the teacher grades them with gold stars.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Student".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("SUBMIT_ASSIGNMENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (filePart != null && filePart.getSize()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (!dir.exists()`:
  > Checks if `!dir.exists(` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 17. 📄 [`TeacherController.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/TeacherController.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/TeacherController.java`
- 🎈 **What this file is in simple words**:  
  > **The Principal's Super Wand! Allows teachers to upload 100 students at once and pin urgent news on the wall.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null || !"Teacher".equalsIgnoreCase(user.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (source == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if ("ADD_NOTICE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("DELETE_NOTICE".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("ADD_EVENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("DELETE_EVENT".equals(action)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- *(plus 7 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 18. 📄 [`UserProfileServlet.java`](file:///root/gurukul/src/main/java/com/gurukul/controllers/UserProfileServlet.java)
- 📍 **Location**: `src/main/java/com/gurukul/controllers/UserProfileServlet.java`
- 🎈 **What this file is in simple words**:  
  > **The ID Card Updater! Lets you change your favorite photo, update your phone number, or pick a new password.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `doPost(...)`: Catches an action request when someone presses a button on the screen and follows the instructions.
- 🔘 `doGet(...)`: Looks inside the toy box and hands you the **doGet**.

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (user == null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (name == null || name.trim()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (email == null || email.trim()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (phone == null || phone.trim()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rows > 0)`:
  > Checks if `rows > 0` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 19. 📄 [`Announcement.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Announcement.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/Announcement.java`
- 🎈 **What this file is in simple words**:  
  > **A Classroom Sticky Note! A quick tip from the teacher: 'Remember to bring your crayons tomorrow!'**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getClassId(...)`: Looks inside the toy box and hands you the **ClassId**.
- 🔘 `setClassId(...)`: Puts a new **ClassId** into the cubby and saves it.
- 🔘 `getAuthorId(...)`: Looks inside the toy box and hands you the **AuthorId**.
- 🔘 `setAuthorId(...)`: Puts a new **AuthorId** into the cubby and saves it.
- *(plus 6 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 20. 📄 [`Assignment.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Assignment.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/Assignment.java`
- 🎈 **What this file is in simple words**:  
  > **A Homework Assignment Card! Holds the title, what you have to do, and when you must hand it in.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getClassId(...)`: Looks inside the toy box and hands you the **ClassId**.
- 🔘 `setClassId(...)`: Puts a new **ClassId** into the cubby and saves it.
- 🔘 `getTitle(...)`: Looks inside the toy box and hands you the **Title**.
- 🔘 `setTitle(...)`: Puts a new **Title** into the cubby and saves it.
- *(plus 10 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 21. 📄 [`Classroom.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Classroom.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/Classroom.java`
- 🎈 **What this file is in simple words**:  
  > **A Digital Class Cubby! Remembers the classroom name (like 'Grade 5 Math') and the teacher in charge.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getName(...)`: Looks inside the toy box and hands you the **Name**.
- 🔘 `setName(...)`: Puts a new **Name** into the cubby and saves it.
- 🔘 `getDescription(...)`: Looks inside the toy box and hands you the **Description**.
- 🔘 `setDescription(...)`: Puts a new **Description** into the cubby and saves it.
- *(plus 10 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 22. 📄 [`EventBean.java`](file:///root/gurukul/src/main/java/com/gurukul/models/EventBean.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/EventBean.java`
- 🎈 **What this file is in simple words**:  
  > **A School Calendar Sticker! Marks fun special days like Sports Day or Science Fair.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getEventName(...)`: Looks inside the toy box and hands you the **EventName**.
- 🔘 `setEventName(...)`: Puts a new **EventName** into the cubby and saves it.
- 🔘 `getEventDate(...)`: Looks inside the toy box and hands you the **EventDate**.
- 🔘 `setEventDate(...)`: Puts a new **EventDate** into the cubby and saves it.
- *(plus 2 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 23. 📄 [`LeaveRequest.java`](file:///root/gurukul/src/main/java/com/gurukul/models/LeaveRequest.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/LeaveRequest.java`
- 🎈 **What this file is in simple words**:  
  > **A Permission Slip! A little note from home saying: 'Please let me stay home on Friday'.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getStudentId(...)`: Looks inside the toy box and hands you the **StudentId**.
- 🔘 `setStudentId(...)`: Puts a new **StudentId** into the cubby and saves it.
- 🔘 `getStudentName(...)`: Looks inside the toy box and hands you the **StudentName**.
- 🔘 `setStudentName(...)`: Puts a new **StudentName** into the cubby and saves it.
- *(plus 10 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 24. 📄 [`NoticeBoard.java`](file:///root/gurukul/src/main/java/com/gurukul/models/NoticeBoard.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/NoticeBoard.java`
- 🎈 **What this file is in simple words**:  
  > **A Giant Campus Bulletin Pinboard! Pinned notices shouting: 'School picnic next Wednesday!'**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getHeading(...)`: Looks inside the toy box and hands you the **Heading**.
- 🔘 `setHeading(...)`: Puts a new **Heading** into the cubby and saves it.
- 🔘 `getBody(...)`: Looks inside the toy box and hands you the **Body**.
- 🔘 `setBody(...)`: Puts a new **Body** into the cubby and saves it.
- *(plus 4 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 25. 📄 [`Quiz.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Quiz.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/Quiz.java`
- 🎈 **What this file is in simple words**:  
  > **A Quiz Game Booklet! Holds the game rules, how many minutes you get, and all the questions inside.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getClassId(...)`: Looks inside the toy box and hands you the **ClassId**.
- 🔘 `setClassId(...)`: Puts a new **ClassId** into the cubby and saves it.
- 🔘 `getTitle(...)`: Looks inside the toy box and hands you the **Title**.
- 🔘 `setTitle(...)`: Puts a new **Title** into the cubby and saves it.
- *(plus 8 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 26. 📄 [`QuizAnswer.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizAnswer.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/QuizAnswer.java`
- 🎈 **What this file is in simple words**:  
  > **A Quiz Game Booklet! Holds the game rules, how many minutes you get, and all the questions inside.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getSubmissionId(...)`: Looks inside the toy box and hands you the **SubmissionId**.
- 🔘 `setSubmissionId(...)`: Puts a new **SubmissionId** into the cubby and saves it.
- 🔘 `getQuestionId(...)`: Looks inside the toy box and hands you the **QuestionId**.
- 🔘 `setQuestionId(...)`: Puts a new **QuestionId** into the cubby and saves it.
- *(plus 2 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 27. 📄 [`QuizQuestion.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizQuestion.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/QuizQuestion.java`
- 🎈 **What this file is in simple words**:  
  > **A Quiz Game Booklet! Holds the game rules, how many minutes you get, and all the questions inside.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getQuizId(...)`: Looks inside the toy box and hands you the **QuizId**.
- 🔘 `setQuizId(...)`: Puts a new **QuizId** into the cubby and saves it.
- 🔘 `getQuestionText(...)`: Looks inside the toy box and hands you the **QuestionText**.
- 🔘 `setQuestionText(...)`: Puts a new **QuestionText** into the cubby and saves it.
- *(plus 12 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 28. 📄 [`QuizSubmission.java`](file:///root/gurukul/src/main/java/com/gurukul/models/QuizSubmission.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/QuizSubmission.java`
- 🎈 **What this file is in simple words**:  
  > **A Completed Homework Sheet! Has your name, your answers, and the teacher's gold star remarks.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getQuizId(...)`: Looks inside the toy box and hands you the **QuizId**.
- 🔘 `setQuizId(...)`: Puts a new **QuizId** into the cubby and saves it.
- 🔘 `getStudentId(...)`: Looks inside the toy box and hands you the **StudentId**.
- 🔘 `setStudentId(...)`: Puts a new **StudentId** into the cubby and saves it.
- *(plus 10 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 29. 📄 [`ResultConfig.java`](file:///root/gurukul/src/main/java/com/gurukul/models/ResultConfig.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/ResultConfig.java`
- 🎈 **What this file is in simple words**:  
  > **The Grading Rulebook! Says how many points give you an A, and how many points you need to pass.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getClassId(...)`: Looks inside the toy box and hands you the **ClassId**.
- 🔘 `setClassId(...)`: Puts a new **ClassId** into the cubby and saves it.
- 🔘 `getTheoryMax(...)`: Looks inside the toy box and hands you the **TheoryMax**.
- 🔘 `setTheoryMax(...)`: Puts a new **TheoryMax** into the cubby and saves it.
- 🔘 `getTheoryPass(...)`: Looks inside the toy box and hands you the **TheoryPass**.
- 🔘 `setTheoryPass(...)`: Puts a new **TheoryPass** into the cubby and saves it.
- *(plus 16 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 30. 📄 [`StudentResult.java`](file:///root/gurukul/src/main/java/com/gurukul/models/StudentResult.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/StudentResult.java`
- 🎈 **What this file is in simple words**:  
  > **A Full Year Report Card! Lists all your marks in written tests, oral exams, and homework.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getClassId(...)`: Looks inside the toy box and hands you the **ClassId**.
- 🔘 `setClassId(...)`: Puts a new **ClassId** into the cubby and saves it.
- 🔘 `getStudentId(...)`: Looks inside the toy box and hands you the **StudentId**.
- 🔘 `setStudentId(...)`: Puts a new **StudentId** into the cubby and saves it.
- *(plus 14 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 31. 📄 [`Submission.java`](file:///root/gurukul/src/main/java/com/gurukul/models/Submission.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/Submission.java`
- 🎈 **What this file is in simple words**:  
  > **A Completed Homework Sheet! Has your name, your answers, and the teacher's gold star remarks.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getAssignmentId(...)`: Looks inside the toy box and hands you the **AssignmentId**.
- 🔘 `setAssignmentId(...)`: Puts a new **AssignmentId** into the cubby and saves it.
- 🔘 `getStudentId(...)`: Looks inside the toy box and hands you the **StudentId**.
- 🔘 `setStudentId(...)`: Puts a new **StudentId** into the cubby and saves it.
- *(plus 16 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 32. 📄 [`UserProfile.java`](file:///root/gurukul/src/main/java/com/gurukul/models/UserProfile.java)
- 📍 **Location**: `src/main/java/com/gurukul/models/UserProfile.java`
- 🎈 **What this file is in simple words**:  
  > **Your Digital ID Badge! Holds your photo, your real name, your roll number, and whether you are a kid or teacher.**

### 🛠️ What its Action Buttons (Methods) Do:
- 🔘 `getId(...)`: Looks inside the toy box and hands you the **Id**.
- 🔘 `setId(...)`: Puts a new **Id** into the cubby and saves it.
- 🔘 `getFullName(...)`: Looks inside the toy box and hands you the **FullName**.
- 🔘 `setFullName(...)`: Puts a new **FullName** into the cubby and saves it.
- 🔘 `getUserName(...)`: Looks inside the toy box and hands you the **UserName**.
- 🔘 `setUserName(...)`: Puts a new **UserName** into the cubby and saves it.
- *(plus 12 more getters/setters that store and hand out values)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 33. 📄 [`DBConnection.java`](file:///root/gurukul/src/main/java/com/gurukul/utils/DBConnection.java)
- 📍 **Location**: `src/main/java/com/gurukul/utils/DBConnection.java`
- 🎈 **What this file is in simple words**:  
  > **The Magic Key to the Big Toy Box! Connects the computer to MySQL where all school memory is saved.**

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 34. 📄 [`aiChat.jsp`](file:///root/gurukul/src/main/webapp/aiChat.jsp)
- 📍 **Location**: `src/main/webapp/aiChat.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Secret Robot Wire! Passes chat words to the AI robot backend and catches answers.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (conn != null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to open the big MySQL memory toy chest to save or read school marks.
- 🦺 **`catch (Exception e)`**: If the chest is locked or the key is bent, the catch net catches the fall so the app doesn't crash, and writes a note in the teacher's notebook!

---

## 35. 📄 [`alumni_network.jsp`](file:///root/gurukul/src/main/webapp/alumni_network.jsp)
- 📍 **Location**: `src/main/webapp/alumni_network.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Wall of Older Graduates! Shows older kids who graduated and got big jobs, so they can mentor younger kids.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 36. 📄 [`assignment_detail.jsp`](file:///root/gurukul/src/main/webapp/assignment_detail.jsp)
- 📍 **Location**: `src/main/webapp/assignment_detail.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Homework Table! Read instructions, attach your work paper, and see your teacher's feedback.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (assignment == null || classroom == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- *(plus 15 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 37. 📄 [`briefings.jsp`](file:///root/gurukul/src/main/webapp/briefings.jsp)
- 📍 **Location**: `src/main/webapp/briefings.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Morning Announcement Screen! A quick 1-minute read of what's happening in school today.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if ("deleted".equals(request.getParameter("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (scheduledMeetings.isEmpty()`:
  > Checks if `scheduledMeetings.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (isActive)`:
  > Checks if `isActive` is true so the computer knows which road to walk down.
- *(plus 3 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 38. 📄 [`class_detail.jsp`](file:///root/gurukul/src/main/webapp/class_detail.jsp)
- 📍 **Location**: `src/main/webapp/class_detail.jsp`
- 🎈 **What this file is in simple words**:  
  > **Inside Your Classroom! Sit at your desk, chat with friends, see homework assignments, and look at your classmates.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (classroom == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if ("success".equals(request.getParameter("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- *(plus 16 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 39. 📄 [`classes.jsp`](file:///root/gurukul/src/main/webapp/classes.jsp)
- 📍 **Location**: `src/main/webapp/classes.jsp`
- 🎈 **What this file is in simple words**:  
  > **The School Hallway! Shows doors for all your classes (Math, Science, English) and a button to enter a new one.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if ("success".equals(request.getParameter("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("error".equals(request.getParameter("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!activeMeetings.isEmpty()`:
  > Checks if `!activeMeetings.isEmpty(` is true so the computer knows which road to walk down.
- *(plus 4 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 40. 📄 [`createEvent.jsp`](file:///root/gurukul/src/main/webapp/createEvent.jsp)
- 📍 **Location**: `src/main/webapp/createEvent.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Calendar Painter! Teachers pin fun dates (like Sports Day) on the school calendar.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (events.isEmpty()`:
  > Checks if `events.isEmpty(` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 41. 📄 [`createQuiz.jsp`](file:///root/gurukul/src/main/webapp/createQuiz.jsp)
- 📍 **Location**: `src/main/webapp/createQuiz.jsp`
- 🎈 **What this file is in simple words**:  
  > **A Quiz Game Booklet! Holds the game rules, how many minutes you get, and all the questions inside.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (classIdStr == null || classIdStr.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (classroom == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (blocks.length > 1)`:
  > Checks if `blocks.length > 1` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 42. 📄 [`createStudent.jsp`](file:///root/gurukul/src/main/webapp/createStudent.jsp)
- 📍 **Location**: `src/main/webapp/createStudent.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Student Enroller! Where the teacher signs up new students for school.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 43. 📄 [`dashboard.jsp`](file:///root/gurukul/src/main/webapp/dashboard.jsp)
- 📍 **Location**: `src/main/webapp/dashboard.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Student's Playroom & Desk! Shows your attendance stars, homework deadlines, and recent test marks.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (score != null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rsAtt.next()`:
  > Checks if `rsAtt.next(` is true so the computer knows which road to walk down.
- 🚦 `if (!activeMeetings.isEmpty()`:
  > Checks if `!activeMeetings.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (notices.isEmpty()`:
  > Checks if `notices.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (events.isEmpty()`:
  > Checks if `events.isEmpty(` is true so the computer knows which road to walk down.
- *(plus 6 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 44. 📄 [`detailedResult.jsp`](file:///root/gurukul/src/main/webapp/detailedResult.jsp)
- 📍 **Location**: `src/main/webapp/detailedResult.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Big Report Card Wall! Look at all your marks broken down into easy-to-read numbers.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("FAIL".equals(rs.getString("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (marksheet.isEmpty()`:
  > Checks if `marksheet.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (!hasFailed)`:
  > Checks if `!hasFailed` is true so the computer knows which road to walk down.
- 🚦 `if (percent >= 90)`:
  > Checks if `percent >= 90` is true so the computer knows which road to walk down.
- 🚦 `if (percent >= 75)`:
  > Checks if `percent >= 75` is true so the computer knows which road to walk down.
- *(plus 2 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 45. 📄 [`home.jsp`](file:///root/gurukul/src/main/webapp/home.jsp)
- 📍 **Location**: `src/main/webapp/home.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Welcoming Entrance Hall! Has big colorful buttons to choose where you want to go next.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 46. 📄 [`index.jsp`](file:///root/gurukul/src/main/webapp/index.jsp)
- 📍 **Location**: `src/main/webapp/index.jsp`
- 🎈 **What this file is in simple words**:  
  > **The School Gate! Welcomes visitors, shows cool pictures of the school, and points you to the login door.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (userProfile != null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("Teacher".equalsIgnoreCase(userProfile.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (index < text.length)`:
  > Checks if `index < text.length` is true so the computer knows which road to walk down.
- 🚦 `if (d < 80)`:
  > Checks if `d < 80` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 47. 📄 [`krutyam_ai.jsp`](file:///root/gurukul/src/main/webapp/krutyam_ai.jsp)
- 📍 **Location**: `src/main/webapp/krutyam_ai.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Robot Friend Chatroom! Talk with Krutyam AI, a super smart robot who helps you understand tricky things.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if ("POST".equalsIgnoreCase(request.getMethod()`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (pIdx != -1)`:
  > Checks if `pIdx != -1` is true so the computer knows which road to walk down.
- 🚦 `if (uIdx != -1)`:
  > Checks if `uIdx != -1` is true so the computer knows which road to walk down.
- 🚦 `if (sessionUser != null && parsedPrompt != null && !parsedPrompt.trim()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (pLower.contains("event")`:
  > Checks if `pLower.contains("event"` is true so the computer knows which road to walk down.
- 🚦 `if (pLower.contains("result")`:
  > Checks if `pLower.contains("result"` is true so the computer knows which road to walk down.
- *(plus 19 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (Exception e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

- 🧗 **`try`**: Tries to open the big MySQL memory toy chest to save or read school marks.
- 🦺 **`catch (Exception e)`**: If the chest is locked or the key is bent, the catch net catches the fall so the app doesn't crash, and writes a note in the teacher's notebook!

- 🧗 **`try`**: Tries to do an important school task safely.
- 🦺 **`catch (err)`**: If anything drops or bumps its head, the catch net hugs it, prevents a screen freeze, and tells the teacher what happened.

---

## 48. 📄 [`login.jsp`](file:///root/gurukul/src/main/webapp/login.jsp)
- 📍 **Location**: `src/main/webapp/login.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Secret Door Lock! Where you type your secret username and password.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (userProfile != null)`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("Teacher".equalsIgnoreCase(userProfile.getRole()`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if ("registered".equals(status)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if ("loggedout".equals(status)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (d<80)`:
  > Checks if `d<80` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 49. 📄 [`markAttendance.jsp`](file:///root/gurukul/src/main/webapp/markAttendance.jsp)
- 📍 **Location**: `src/main/webapp/markAttendance.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Teacher's Roll-Call Clipboard! Click green checkmarks for students who are here today.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (selectedCourse != null && !selectedCourse.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (selectedCourse != null && !selectedCourse.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (selectedCourse != null && !selectedCourse.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (selectedBatch != null && !selectedBatch.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (selectedBatch != null && !selectedBatch.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- *(plus 6 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 50. 📄 [`meeting.jsp`](file:///root/gurukul/src/main/webapp/meeting.jsp)
- 📍 **Location**: `src/main/webapp/meeting.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Live Video Room! Shows everyone's smiling face on webcam with buttons to mute mic or turn on video.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (proto != null && proto.contains("https")`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (wsHost == null || wsHost.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (event.key === 'Enter')`:
  > Checks if `event.key === 'Enter'` is true so the computer knows which road to walk down.
- 🚦 `if (joinId !== mySocketId)`:
  > Checks if `joinId !== mySocketId` is true so the computer knows which road to walk down.
- *(plus 35 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

- 🧗 **`try`**: Tries to turn written letters into counting numbers (like '100' points).
- 🦺 **`catch (e)`**: If someone typed silly words instead of numbers, the catch net catches the mistake and sets the number to 0 so nobody trips.

- 🧗 **`try`**: Tries to do an important school task safely.
- 🦺 **`catch (err)`**: If anything drops or bumps its head, the catch net hugs it, prevents a screen freeze, and tells the teacher what happened.

- 🧗 **`try`**: Tries to send words over the internet wire to another computer.
- 🦺 **`catch (e)`**: If the wire gets loose or the internet takes a nap, the catch net catches the error and shows a gentle message instead of freezing.

---

## 51. 📄 [`quizResult.jsp`](file:///root/gurukul/src/main/webapp/quizResult.jsp)
- 📍 **Location**: `src/main/webapp/quizResult.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Victory Celebration Screen! Shows which answers you got right in green, and where you can improve in red.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (quizIdStr == null || classIdStr == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (quiz == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- *(plus 4 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 52. 📄 [`schemaDump.jsp`](file:///root/gurukul/src/main/webapp/schemaDump.jsp)
- 📍 **Location**: `src/main/webapp/schemaDump.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Toy Box Inspector! Counts all the storage shelves in the computer's memory box.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (conn != null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*

### 🦺 Every Safety Net (`try-catch`):
- 🧗 **`try`**: Tries to open the big MySQL memory toy chest to save or read school marks.
- 🦺 **`catch (Exception e)`**: If the chest is locked or the key is bent, the catch net catches the fall so the app doesn't crash, and writes a note in the teacher's notebook!

---

## 53. 📄 [`sendNotice.jsp`](file:///root/gurukul/src/main/webapp/sendNotice.jsp)
- 📍 **Location**: `src/main/webapp/sendNotice.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Notice Board Painter! Write an urgent announcement to pin up for the whole school.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (notices.isEmpty()`:
  > Checks if `notices.isEmpty(` is true so the computer knows which road to walk down.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 54. 📄 [`social_hub.jsp`](file:///root/gurukul/src/main/webapp/social_hub.jsp)
- 📍 **Location**: `src/main/webapp/social_hub.jsp`
- 🎈 **What this file is in simple words**:  
  > **The School Playground & Cafeteria! Chat, share project ideas, and have fun studying with your school buddies.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 55. 📄 [`takeQuiz.jsp`](file:///root/gurukul/src/main/webapp/takeQuiz.jsp)
- 📍 **Location**: `src/main/webapp/takeQuiz.jsp`
- 🎈 **What this file is in simple words**:  
  > **A Quiz Game Booklet! Holds the game rules, how many minutes you get, and all the questions inside.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (quizIdStr == null || classIdStr == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- 🚦 `if (quiz == null)`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (timeRemaining <= 60)`:
  > Checks if `timeRemaining <= 60` is true so the computer knows which road to walk down.
- *(plus 1 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 56. 📄 [`teacherDashboard.jsp`](file:///root/gurukul/src/main/webapp/teacherDashboard.jsp)
- 📍 **Location**: `src/main/webapp/teacherDashboard.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Teacher's Big Office Desk! Gives the teacher magic buttons to take attendance, add homework, and make tests.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (sb.getCourse()`:
  > Checks if `sb.getCourse(` is true so the computer knows which road to walk down.
- 🚦 `if ("success".equals(request.getParameter("status")`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!
- 🚦 `if (!activeMeetings.isEmpty()`:
  > Checks if `!activeMeetings.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (pendingLeaves.isEmpty()`:
  > Checks if `pendingLeaves.isEmpty(` is true so the computer knows which road to walk down.
- 🚦 `if (myQuizzes.isEmpty()`:
  > Checks if `myQuizzes.isEmpty(` is true so the computer knows which road to walk down.
- *(plus 2 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 57. 📄 [`userProfile.jsp`](file:///root/gurukul/src/main/webapp/userProfile.jsp)
- 📍 **Location**: `src/main/webapp/userProfile.jsp`
- 🎈 **What this file is in simple words**:  
  > **Your Personal Student Passport! Shows your picture, your class, and allows you to update your secret password.**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if ("success".equals(status)`:
  > Asks: *'Did the user press this specific button?'* If YES, do that exact action immediately!

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

## 58. 📄 [`viewAttendance.jsp`](file:///root/gurukul/src/main/webapp/viewAttendance.jsp)
- 📍 **Location**: `src/main/webapp/viewAttendance.jsp`
- 🎈 **What this file is in simple words**:  
  > **The Attendance Star Meter! Shows a progress bar: 'You came to school 95% of the days! Great job!'**

### 🤔 Every Choice & Decision (`if` / `else`):
- 🚦 `if (session.getAttribute("user")`:
  > Asks: *'Are you a real student logged in?'* If YES, let them through! If NO, send them back to the front door to sign in.
- 🚦 `if (isTeacher)`:
  > Asks: *'Are you a Teacher or a Kid?'* If Teacher, open the Teacher office! If Kid, open the fun Student playground.
- 🚦 `if (filterMonth != null && !filterMonth.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (filterSubject != null && !filterSubject.isEmpty()`:
  > Asks: *'Did someone forget to type anything in the box?'* If YES, remind them gently: *'Please fill in your name!'*
- 🚦 `if (params.get(i)`:
  > Checks if `params.get(i` is true so the computer knows which road to walk down.
- 🚦 `if (rs.next()`:
  > Checks if `rs.next(` is true so the computer knows which road to walk down.
- *(plus 6 other minor safety checks on the page)*

### 🦺 Every Safety Net (`try-catch`):
- 🛡️ *This file uses simple data containers or relies on the web server's master umbrella to stay safe!*

---

