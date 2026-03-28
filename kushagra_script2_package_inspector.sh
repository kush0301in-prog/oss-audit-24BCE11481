#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Kushagra Chaturvedi | Reg No: 24BCE11481 | Slot: F11 | Date: 27 March 2026
# Course: Open Source Software (CSE0002) | VIT Bhopal

PACKAGE="${1:-postgresql}"

echo "================================================================"
echo "  FOSS PACKAGE INSPECTOR — Package: $PACKAGE"
echo "================================================================"

if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "  STATUS  : INSTALLED"
    VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    echo "  Version : $VERSION"
    apt-cache show "$PACKAGE" 2>/dev/null | \
        grep -E "^(Maintainer|Homepage|Section)" | \
        awk -F': ' '{printf "  %-12s: %s\n", $1, $2}'
else
    echo "  STATUS  : NOT INSTALLED"
    echo "  Install : sudo apt install $PACKAGE"
fi

echo ""
echo "  OPEN SOURCE PHILOSOPHY NOTE:"
case "$PACKAGE" in
    postgresql|postgresql-*)
        echo "  PostgreSQL: 40 years of academic rigor, zero corporate owners."
        echo "  Started at UC Berkeley in 1986 by Michael Stonebraker, it is"
        echo "  the most SQL-correct open source database in existence. Its"
        echo "  permissive licence enabled cloud giants and startups alike"
        echo "  — and no one has ever been able to buy or close it." ;;
    mysql-server|mysql*)   echo "  MySQL: dual-license database, Oracle-owned since 2010." ;;
    mariadb*)              echo "  MariaDB: MySQL's community fork, free of Oracle's shadow." ;;
    apache2)               echo "  Apache: the 'A' in LAMP, the web's foundation since 1995." ;;
    python3*)              echo "  Python: the language most data engineers use with PostgreSQL." ;;
    libreoffice)           echo "  LibreOffice: document freedom, forked from Oracle's shadow." ;;
    git)                   echo "  Git: Torvalds built it in 10 days; every dev uses it now." ;;
    *)                     echo "  '$PACKAGE': open source — readable, auditable, and free." ;;
esac
echo "================================================================"
