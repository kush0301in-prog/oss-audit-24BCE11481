#!/bin/bash
# Script 1: System Identity Report
# Author: Kushagra Chaturvedi | Reg No: 24BCE11481 | Slot: F11 | Date: 27 March 2026
# Course: Open Source Software (CSE0002) | VIT Bhopal
# Chosen Software: PostgreSQL

STUDENT_NAME="Kushagra Chaturvedi"
REG_NUMBER="24BCE11481"
SOFTWARE_CHOICE="PostgreSQL Database System"

KERNEL=$(uname -r)
ARCH=$(uname -m)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
PG_VER=$(psql --version 2>/dev/null | head -1 || echo "PostgreSQL not installed")
PG_LICENSE="PostgreSQL License (BSD-style, permissive) — PostgreSQL Global Development Group"

echo "============================================================"
echo "  OPEN SOURCE AUDIT — $STUDENT_NAME ($REG_NUMBER)"
echo "  Software: $SOFTWARE_CHOICE"
echo "============================================================"
echo "  Distro      : $DISTRO"
echo "  Kernel      : $KERNEL ($ARCH)"
echo "  PostgreSQL  : $PG_VER"
echo "  User        : $USER_NAME | Home: $HOME_DIR"
echo "  Uptime      : $UPTIME"
echo "  Date/Time   : $CURRENT_DATE  $CURRENT_TIME"
echo "  License     : $PG_LICENSE"
echo "  Freedoms    : Run | Study | Redistribute | Modify and Share"
echo "============================================================"
