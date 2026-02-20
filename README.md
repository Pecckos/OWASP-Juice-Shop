🛡 OWASP Juice Shop – Security Testing Lab
Dockerized Pentesting Environment
---


## 🔎 Overview

This repository contains a **Docker-based pentesting lab** used to assess OWASP Juice Shop in a controlled setup.  
The lab is designed to be **reproducible**, **isolated**, and safe for educational security testing.

**Vulnerabilities tested:**
- Stored XSS (cookie exfiltration proof)
- Reflected XSS
- SQL Injection
- IDOR (Broken Access Control)
- Cryptographic failures (MD5)
- Authentication failures (brute force)
- Information disclosure via error messages
- Vulnerable & outdated components (Retire.js)

---

## 🧱 Environment

Two containers are orchestrated using Docker Compose:

- **juice-shop** (target app)
- **jessica-tools** (attack container with tools)

**Access Juice Shop in browser:**  
`http://localhost:3000`

**From inside tools-container, reach target via:**  
`http://juice-shop:3000`

## 🧰 Tools Included

| Tool | Category | Used for |
|------|----------|----------|
| Burp Suite | Proxy | Intercept/modify HTTP requests |
| sqlmap | Exploitation | Verify SQL injection + dump data |
| gobuster | Discovery | Find hidden paths (e.g. `/ftp`) |
| nuclei | DAST | Automated vulnerability scanning |
| John the Ripper | Cracking | Crack extracted MD5 hashes |
| Retire.js | Component Scanner | Detect vulnerable JS libraries |
| curl | Utility | Manual HTTP testing |
| python3 / listen_cookie.sh | Listener | Capture exfiltrated cookies |


# Environment Setup

Build and Start the Lab

Run the following command inside the project directory:
```
docker compose up --build -d
```
What this does:

- Builds the custom tools container from the Dockerfile

- Pulls OWASP Juice Shop image

- Starts both containers

- Runs everything in the background


Verify Containers Are Running

Check that both containers are active:
```
docker ps
```
You should see:
```
juice-shop

jessica-tools
```
 Open the Target Application

Open your browser and go to:
```
http://localhost:3000
```
This is the vulnerable application.

---
# Access the Tools Container 

To use penetration testing tools, enter the attack container:
```
docker exec -it jessica-tools bash
```
Inside the container, the target is reachable via:
```
http://juice-shop:3000
```
 Stop the Lab

When finished, stop everything:
```
docker compose down
```
🧠 How It Works (Simple Explanation)

docker compose up → starts the lab

--build → rebuilds the tools container if needed

-d → runs containers in background

docker exec -it → opens an interactive shell inside the tools container

---

# 🧪 Verified Vulnerabilities

✔ Reflected XSS

✔ Stored XSS (Session Exfiltration)

✔ SQL Injection (Boolean & Time-based)

✔ IDOR

✔ Cryptographic Failure (MD5)

✔ Authentication Brute Force

✔ Error Message Information Disclosure

✔ Vulnerable JS Components

---
# 🐳 Useful Docker Commands

List running containers:

docker ps

Stop environment:

docker compose down

Full clean rebuild:

docker compose down --rmi all
docker compose up --build -d

---
# 🔐 Security Model

Isolated Docker bridge network

No external exposure

Juice Shop runs intentionally in unsafe mode

Used strictly for educational testing

---
# 📚 References

OWASP Juice Shop

OWASP Top 10 (2025)

MITRE CWE

CVE Database

Retire.js Documentation

---
# ⚠ Disclaimer

This project is for educational purposes only.
All vulnerabilities were exploited in a controlled local lab environment.

# Do not test systems without explicit authorization.
