# ReconX 🔍
### Unified Reconnaissance Framework (CLI)

ReconX is a **modular, intelligent, terminal-based reconnaissance framework**
built for **penetration testers, bug bounty hunters, and security researchers**.

---

## 🚀 Features

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

## 📦 Installation

```bash
git clone https://github.com/<your-username>/ReconX.git
cd ReconX
chmod +x install.sh
./install.sh

## Usage
reconx -t example.com --full

## Modules
--passive     Passive recon
--dns         DNS recon
--active      Active recon
--enum        Smart enumeration
--vuln        Vulnerability discovery
--report      Generate report
--full        Run all modules
--bb          Bug bounty mode

## 📁 Output Structure
output/<target>/
├── passive/
├── dns/
├── active/
├── enum/
├── web/
├── vuln/
└── report.md