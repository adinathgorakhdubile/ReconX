# ReconX 🔐  
### Unified Reconnaissance Framework for Penetration Testing & Bug Bounty

ReconX is a **Linux-based, terminal-driven reconnaissance and vulnerability assessment framework** designed for **penetration testers, bug bounty hunters, and offensive security professionals**.

It automates the **entire reconnaissance lifecycle** — from passive OSINT to vulnerability discovery — using a **modular, service-aware, and performance-optimized approach**, closely aligned with real-world pentesting methodologies.

---

## 🚀 Why ReconX?

ReconX is built to solve common problems in reconnaissance:
- Tool sprawl
- Manual decision-making
- Inefficient scan workflows
- Poor reporting
- Unsafe bug bounty practices

Unlike simple wrapper scripts, ReconX applies **intelligent execution logic**, **parallel processing**, and **mode-based behavior** to deliver fast, accurate, and legally safe results.

---

## 🔍 Core Features

### 🛰️ Passive Reconnaissance (OSINT)
- WHOIS analysis
- Subdomain enumeration
- Certificate Transparency (crt.sh)
- Zero interaction with target infrastructure

### 🌐 DNS Reconnaissance
- NS, MX, TXT, A, AAAA record enumeration
- Zone transfer (AXFR) testing
- Parallelized DNS queries for speed

### ⚡ Active Reconnaissance
- Smart Nmap scanning (two-phase approach)
- Port discovery followed by service & version detection
- Bug bounty–safe scanning behavior

### 🧠 Smart Enumeration Engine
- Automatically detects running services
- Triggers service-specific enumeration:
  - HTTP / HTTPS → Web recon
  - SMB → enum4linux
  - FTP / SSH → Banner grabbing
- Eliminates unnecessary scans

### 🌍 Web Reconnaissance
- Live host detection
- Technology fingerprinting
- Directory and endpoint fuzzing
- Noise-controlled execution

### 💣 Vulnerability Discovery
- Integrated **Nuclei** vulnerability scanning
- Severity-based filtering (High / Critical)
- Machine-readable JSON output

### 🧾 Reporting Engine
- Auto-generated **Markdown penetration testing report**
- Consolidates recon and vulnerability findings
- Suitable for bug bounty submissions and assessments

---

## 🛡️ Bug Bounty Safe Mode

ReconX includes a dedicated **Bug Bounty Mode** that:
- Limits scan aggressiveness
- Reduces request rates
- Focuses on web-safe assets
- Helps prevent scope violations

---

## ⚙️ Engineering Highlights

- Pure **Bash / Shell-based CLI**
- Modular, production-style architecture
- Parallel execution for performance optimization
- Fault-tolerant (handles missing tools gracefully)
- No sudo dependency for most modules
- Installer with global CLI access

---

## 🧰 Tools & Technologies

**Languages & Scripting**
- Bash / Shell
- Linux CLI

**Security Tools**
- Nmap
- Subfinder
- Amass
- httpx
- ffuf
- Nuclei
- enum4linux
- dig, whois

**Security Domains**
- Penetration Testing
- Reconnaissance & Enumeration
- Web Application Security
- Network Security
- OSINT
- Vulnerability Assessment
- Bug Bounty Methodology

---

## 📁 Output Structure

``text
output/<target>/
├── passive/
├── dns/
├── active/
├── enum/
├── web/
├── vuln/
└── report.md

## 📦 Installation
bash
Copy code
git clone https://github.com/<your-username>/ReconX.git
cd ReconX
chmod +x install.sh
./install.sh
Run from anywhere:

bash
Copy code
reconx -t example.com --full
📌 Usage
bash
Copy code
reconx -t <target> --full




## Available Modules
bash
Copy code
--passive     Passive reconnaissance (OSINT)
--dns         DNS reconnaissance
--active      Active reconnaissance (Nmap)
--enum        Smart service enumeration
--vuln        Vulnerability discovery
--report      Generate Markdown report
--full        Run full pipeline
--bb          Bug bounty safe mode


## ⚠️ Legal Disclaimer
ReconX is intended only for authorized security testing and educational purposes.
The author assumes no liability for misuse or unauthorized activity.
# ReconX 🔍
### Unified Reconnaissance Framework (CLI)

ReconX is a **modular, intelligent, terminal-based reconnaissance framework**
built for **penetration testers, bug bounty hunters, and security researchers**.

---

****### 🚀 Features
****
- Passive Recon (OSINT, Subdomains, Certificates)
- DNS Recon (NS, MX, TXT, AXFR)
- Active Recon (Smart Nmap)
- Smart Enumeration (Service-aware)
- Web Recon & Fuzzing
- Vulnerability Discovery (Nuclei)
- Bug Bounty Safe Mode
- Parallel Execution
- Markdown Reporting

---

****### 📦 **Installation**
****
```bash
git clone https://github.com/<your-username>/ReconX.git
cd ReconX
chmod +x install.sh
./install.sh

**### Usage**
reconx -t example.com --full

``text
**### Modules**
--passive     Passive recon
--dns         DNS recon
--active      Active recon
--enum        Smart enumeration
--vuln        Vulnerability discovery
--report      Generate report
--full        Run all modules
--bb          Bug bounty mode

**### 📁**** Output Structure
******output/<target>/
├── passive/
├── dns/
├── active/
├── enum/
├── web/
├── vuln/
└── report.md

****#👨‍💻 Author
****Adinath Dubile
Cyber Security | Penetration Testing | Security Tool Development
