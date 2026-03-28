#!/bin/bash
# Script 4: Log File Analyzer
# Author: Kushagra Chaturvedi | Reg No: 24BCE11481 | Slot: F11 | Date: 27 March 2026
# Course: Open Source Software (CSE0002) | VIT Bhopal
# Usage: ./script4_log_analyzer.sh [logfile] [keyword]

LOGFILE=${1:-/var/log/postgresql/postgresql-14-main.log}
KEYWORD=${2:-"error"}
COUNT=0
MATCHING_LINES=()

echo "================================================================"
echo "  LOG FILE ANALYZER | File: $LOGFILE | Keyword: '$KEYWORD'"
echo "================================================================"

if [ ! -f "$LOGFILE" ]; then
    echo "  '$LOGFILE' not found — trying fallbacks..."
    for FB in /var/log/postgresql/postgresql-*-main.log \
              "/var/log/syslog" "/var/log/kern.log"; do
        if [ -f "$FB" ]; then
            echo "  Using fallback: $FB"
            LOGFILE="$FB"
            break
        fi
    done
    [ ! -f "$LOGFILE" ] && echo "  No readable log file found." && exit 1
fi

echo "  Scanning..."
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCHING_LINES+=("$LINE")
    fi
done < "$LOGFILE"

echo "  Keyword '$KEYWORD' found: $COUNT line(s)"
echo ""

if [ "$COUNT" -gt 0 ]; then
    echo "  LAST 5 MATCHING LINES:"
    echo "  -------------------------------------------------------"
    TOTAL=${#MATCHING_LINES[@]}
    START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))
    for (( i=START; i<TOTAL; i++ )); do
        echo "  > ${MATCHING_LINES[$i]:0:100}"
    done
else
    echo "  No matches. Try: warning, fatal, connection, auth, syntax"
fi
echo "================================================================"
