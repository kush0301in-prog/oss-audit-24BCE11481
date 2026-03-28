#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Kushagra Chaturvedi | Reg No: 24BCE11481 | Slot: F11 | Date: 27 March 2026
# Course: Open Source Software (CSE0002) | VIT Bhopal

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var/lib" "/usr/share")

echo "================================================================"
echo "  DISK AND PERMISSION AUDITOR — PostgreSQL Audit"
echo "================================================================"
printf "  %-22s %-12s %-10s %-10s %-8s\n" "DIRECTORY" "PERMS" "OWNER" "GROUP" "SIZE"
echo "  ------------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-22s %-12s %-10s %-10s %-8s\n" \
               "$DIR" "$PERMS" "$OWNER" "$GROUP" "${SIZE:-N/A}"
    else
        printf "  %-22s %s\n" "$DIR" "[NOT FOUND]"
    fi
done

echo ""
echo "  POSTGRESQL-SPECIFIC PATHS:"
echo "  ------------------------------------------------------------------"
PG_PATHS=("/etc/postgresql" "/var/lib/postgresql"
          "/var/log/postgresql" "/run/postgresql"
          "/usr/bin/psql" "/usr/lib/postgresql")

for PPATH in "${PG_PATHS[@]}"; do
    if [ -e "$PPATH" ]; then
        PERMS=$(ls -ld "$PPATH" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$PPATH" 2>/dev/null | cut -f1)
        echo "  $PPATH"
        echo "    Perms/Owner/Group : $PERMS | Size: ${SIZE:-N/A}"
    else
        echo "  $PPATH — [NOT FOUND / not installed]"
    fi
done

echo ""
echo "  /var/lib/postgresql is postgres:postgres (700) — data is strictly private."
echo "  /etc/postgresql is root:root — only admins can change server configuration."
echo "  /run/postgresql holds the Unix socket — local connections bypass TCP entirely."
echo "================================================================"
