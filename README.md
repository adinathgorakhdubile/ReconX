<div align="center">

# 🔐 ReconX  
### Unified Reconnaissance Framework (CLI)

**Linux-based • Modular • Intelligent • Bug Bounty Safe**

ReconX is a **terminal-driven reconnaissance and vulnerability assessment framework** designed for **penetration testers, bug bounty hunters, and offensive security professionals**.

It automates the **entire reconnaissance lifecycle** — from passive OSINT to vulnerability discovery — using a **service-aware, performance-optimized, and legally safe approach**.

---

![Platform](https://img.shields.io/badge/Platform-Linux-blue?style=flat-square)
![Language](https://img.shields.io/badge/Language-Bash-lightgrey?style=flat-square)
![Domain](https://img.shields.io/badge/Domain-Offensive%20Security-red?style=flat-square)
![Status](https://img.shields.io/badge/Status-Stable-green?style=flat-square)

</div>

---

## 🧠 Overview

ReconX is built to streamline and automate reconnaissance workflows commonly used in **penetration testing and bug bounty engagements**.

Rather than acting as a simple wrapper around existing tools, ReconX implements **service-aware logic**, **parallel execution**, and **mode-based behavior** to closely mirror real-world offensive security methodology.

---

## 🚀 Core Features

### 🛰️ Passive Reconnaissance (OSINT)
- WHOIS intelligence gathering
- Subdomain enumeration
- Certificate Transparency (crt.sh)
- Zero interaction with target infrastructure

### 🌐 DNS Reconnaissance
- NS, MX, TXT, A, AAAA record enumeration
- Zone transfer (AXFR) testing
- Parallelized DNS queries for improved performance

### ⚡ Active Reconnaissance
- Smart Nmap scanning (two-phase strategy)
- Port discovery followed by service and version detection
- Bug bounty–safe scanning behavior

### 🧠 Smart Enumeration Engine
ReconX automatically detects running services and triggers only relevant enumeration tasks:
- HTTP / HTTPS → Web reconnaissance
- SMB → enum4linux
- FTP / SSH → Banner grabbing

This minimizes unnecessary scans and reduces noise.

### 🌍 Web Reconnaissance
- Live host detection
- Technology fingerprinting
- Directory and endpoint fuzzing
- Controlled request rates

### 💣 Vulnerability Discovery
- Integrated **Nuclei** vulnerability scanning
- Severity-based filtering (High / Critical)
- Machine-readable JSON output

### 🧾 Reporting Engine
- Auto-generated **Markdown penetration testing report**
- Aggregates reconnaissance and vulnerability findings
- Ready for bug bounty submissions or security assessments

---

## 🛡️ Bug Bounty Safe Mode

ReconX includes a dedicated **Bug Bounty Mode** designed to:
- Limit scan aggressiveness
- Reduce request rates
- Focus on web-safe assets
- Help prevent scope violations

---

## ⚙️ Engineering Highlights

- Pure **Bash / Shell-based CLI**
- Modular, production-style architecture
- Parallel execution for performance optimization
- Fault-tolerant (gracefully skips missing tools)
- No sudo dependency for most modules
- Installer with global CLI access

---

## 🧰 Tools & Technologies

### Languages & Scripting
- Bash / Shell
- Linux CLI

### Security Tools
- Nmap
- Subfinder
- Amass
- httpx
- ffuf
- Nuclei
- enum4linux
- dig, whois

### Security Domains
- Penetration Testing
- Reconnaissance & Enumeration
- Web Application Security
- Network Security
- OSINT
- Vulnerability Assessment
- Bug Bounty Methodology

---

## 📁 Output Structure

```text
output/<target>/
├── passive/
├── dns/
├── active/
├── enum/
├── web/
├── vuln/
└── report.md
📦 Installation
Clone the repository and install ReconX using the built-in installer:

bash
Copy code
git clone https://github.com/<your-username>/ReconX.git
cd ReconX
chmod +x install.sh
./install.sh
Once installed, ReconX can be executed globally from anywhere in the terminal:

bash
Copy code
reconx -t example.com --full
📌 Usage
Run the full reconnaissance pipeline against a target:

bash
Copy code
reconx -t <target> --full
Available Modules
text
Copy code
--passive     Passive reconnaissance (OSINT)
--dns         DNS reconnaissance
--active      Active reconnaissance (Nmap)
--enum        Smart service enumeration
--vuln        Vulnerability discovery
--report      Generate Markdown report
--full        Run full pipeline
--bb          Bug bounty safe mode
⚠️ Legal Disclaimer
ReconX is intended only for authorized security testing and educational purposes.
The author assumes no liability for misuse or unauthorized activity.

👨‍💻 Author
Adinath Dubile
Cyber Security • Penetration Testing • Security Tool Development

<div align="center">
⭐ If ReconX helped you, consider starring the repository ⭐

</div> ```
