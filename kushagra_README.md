# OSS Audit — PostgreSQL
**Student Name:** Kushagra Chaturvedi  
**Registration Number:** 24BCE11481  
**Course:** CSE0002 — Open Source Software | VIT Bhopal University  
**Software Audited:** PostgreSQL Database System (PostgreSQL License)  
**Repository:** `oss-audit-24BCE11481`

---

## About This Project

This repository contains the five shell scripts for the Open Source Software Capstone Project — *The Open Source Audit*. The project audits **PostgreSQL**, examining its origin story (Michael Stonebraker's POSTGRES project at UC Berkeley, 1986), the PostgreSQL License (the most permissive of all licenses covered in this course), philosophy, Linux footprint, FOSS ecosystem, and a critical comparison with Oracle Database and MySQL.

---

## Repository Contents

| File | Description |
|------|-------------|
| `script1_system_identity.sh` | Displays system info: PostgreSQL version, distro, kernel, uptime, user, and PostgreSQL License details |
| `script2_package_inspector.sh` | Checks if a FOSS package is installed, shows version/metadata, and prints a philosophy note (case statement) |
| `script3_disk_permission_auditor.sh` | Audits system directories and PostgreSQL-specific paths: permissions, ownership, and disk usage using a for loop |
| `script4_log_analyzer.sh` | Reads a log file line by line, counts keyword matches, and displays the last 5 matches |
| `script5_manifesto_generator.sh` | Interactively generates and saves a personalised open-source philosophy statement |
| `README.md` | This file |

The project report PDF is submitted separately via the VITyarthi portal.

---

## Environment Requirements

- **OS:** Ubuntu 22.04 LTS or any Debian-based Linux
- **Shell:** Bash (version 4.0+)
- **Dependencies:** `postgresql`, `postgresql-client`, `uname`, `whoami`, `uptime`, `dpkg`, `apt-cache`, `ls`, `du`, `grep`, `awk`, `cut`, `date`
- **Permissions:** Script 4 requires `sudo` to read `/var/log/postgresql/` log files

---

## Setup Instructions

### Step 1 — Clone the repository
```bash
git clone https://github.com/[your-github-username]/oss-audit-24BCE11481.git
cd oss-audit-24BCE11481
```

### Step 2 — Install PostgreSQL (if not already installed)
```bash
sudo apt update && sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
psql --version    # Confirm installation
```

### Step 3 — Make all scripts executable
```bash
chmod +x *.sh
```

---

## Running Each Script

### Script 1 — System Identity Report
Displays system info and PostgreSQL license details.
```bash
./script1_system_identity.sh
```
**Expected output:** PostgreSQL version, distribution name, kernel, uptime, user info, date/time, and PostgreSQL License statement.

---

### Script 2 — FOSS Package Inspector
Checks if a package is installed and prints a philosophy note.
```bash
# Inspect postgresql (default)
./script2_package_inspector.sh

# Inspect specific packages
./script2_package_inspector.sh postgresql
./script2_package_inspector.sh postgresql-14
./script2_package_inspector.sh python3
./script2_package_inspector.sh git
```
**Expected output:** Package install status, version, metadata, and a philosophy note.

---

### Script 3 — Disk and Permission Auditor
Audits system directories and PostgreSQL-specific paths.
```bash
./script3_disk_permission_auditor.sh
```
**Expected output:** Formatted table with permissions, owner, group, and size. Also checks `/etc/postgresql`, `/var/lib/postgresql` (strictly 700), `/var/log/postgresql`, `/run/postgresql` (socket), `/usr/bin/psql`, and `/usr/lib/postgresql`.

> **Note:** `/var/lib/postgresql` has permissions `drwx------` (700) — readable only by the `postgres` system user. This is the strictest protection of any software audited in this course.

---

### Script 4 — Log File Analyzer
Reads a log file and counts keyword matches. **PostgreSQL logs require sudo.**
```bash
# Analyse PostgreSQL error log for 'error' entries (default)
sudo ./script4_log_analyzer.sh /var/log/postgresql/postgresql-14-main.log error

# Search for authentication failures
sudo ./script4_log_analyzer.sh /var/log/postgresql/postgresql-14-main.log "auth"

# Search for fatal errors
sudo ./script4_log_analyzer.sh /var/log/postgresql/postgresql-14-main.log fatal

# Fallback: use syslog
sudo ./script4_log_analyzer.sh /var/log/syslog postgresql
```
**Expected output:** Match count and the last 5 matching lines.

> **Note:** PostgreSQL logs are in `/var/log/postgresql/` owned by `postgres:postgres`. Add yourself to the group or use sudo: `sudo ./script4_log_analyzer.sh`.

---

### Script 5 — Open Source Manifesto Generator
Interactive — asks three questions and saves a personalised manifesto.
```bash
./script5_manifesto_generator.sh
```
**Follow the prompts:**
1. Enter a tool you use every day (e.g., `PostgreSQL`, `bash`, `git`)
2. Enter one word for what data integrity means (e.g., `trust`, `correctness`, `reliability`)
3. Enter something you would build and share (e.g., `a student information system`)

**Expected output:** A manifesto printed to the terminal and saved as `manifesto_[yourusername].txt`.

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `Permission denied` on script | Run `chmod +x scriptname.sh` |
| `psql: command not found` | Install with `sudo apt install postgresql-client` |
| PostgreSQL service not running | Start with `sudo systemctl start postgresql` |
| Log file not accessible (Script 4) | Use sudo: `sudo ./script4_log_analyzer.sh /var/log/postgresql/postgresql-14-main.log error` |
| Log file not found | Script auto-tries fallback versions; or use `sudo ./script4_log_analyzer.sh /var/log/syslog postgresql` |
| `dpkg: not found` (Script 2) | Replace `dpkg -l` with `rpm -qa` for RPM-based systems |
| Script outputs nothing | Ensure Bash is your shell: `echo $SHELL` should show `/bin/bash` |

---

## License

These scripts are written for educational purposes as part of the VIT Bhopal OSS course. They may be freely used and modified.

---

*VIT Bhopal University | CSE0002 — Open Source Software | Capstone Project*
