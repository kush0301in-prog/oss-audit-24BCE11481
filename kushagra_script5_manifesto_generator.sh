#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Kushagra Chaturvedi | Reg No: 24BCE11481 | Slot: F11 | Date: 27 March 2026
# Course: Open Source Software (CSE0002) | VIT Bhopal

# ALIAS CONCEPT:
# In an interactive shell: alias pgver='psql --version'
# Aliases DO NOT expand inside scripts by default (bash disables
# alias expansion in non-interactive mode). A named function is
# the correct portable equivalent; it behaves identically everywhere.
pgver() { psql --version 2>/dev/null | head -1 || echo "PostgreSQL not found"; }

echo "================================================================"
echo "  OPEN SOURCE MANIFESTO GENERATOR — PostgreSQL Audit"
echo "================================================================"
echo "  Answer three questions. Your manifesto is saved to a .txt file."
echo ""

read -p "  1. One open-source tool you use every day: " TOOL
while [ -z "$TOOL" ]; do
    echo "     Required (e.g. PostgreSQL, bash, git)"
    read -p "  1. One open-source tool you use every day: " TOOL
done

read -p "  2. One word — what does data integrity mean to you? " INTEGRITY
while [ -z "$INTEGRITY" ]; do
    echo "     Required — one word (e.g. trust, correctness, reliability)"
    read -p "  2. One word for data integrity: " INTEGRITY
done

read -p "  3. Something you would build and release as open source: " BUILD
while [ -z "$BUILD" ]; do
    echo "     Required (e.g. a student information system)"
    read -p "  3. What you would build and share: " BUILD
done

DATE=$(date '+%d %B %Y')
PG_VERSION=$(pgver)
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

echo ""
echo "  Writing manifesto to $OUTPUT..."
echo ""

echo "=================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  $AUTHOR | $DATE" >> "$OUTPUT"
echo "  $PG_VERSION" >> "$OUTPUT"
echo "=================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "In 1986, a professor at Berkeley named Michael" >> "$OUTPUT"
echo "Stonebraker started a database project. Not for a" >> "$OUTPUT"
echo "company. Not for a product. As a research question:" >> "$OUTPUT"
echo "what should a database do that relational theory" >> "$OUTPUT"
echo "had not figured out? He called it POSTGRES. He gave" >> "$OUTPUT"
echo "the code away. He did not know he was building" >> "$OUTPUT"
echo "infrastructure that forty years later would hold" >> "$OUTPUT"
echo "some of the world's most critical data." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I use $TOOL every day. The data I store in it is" >> "$OUTPUT"
echo "correct — not approximately, not mostly, but correct." >> "$OUTPUT"
echo "PostgreSQL enforces every constraint I declare." >> "$OUTPUT"
echo "This is not a limitation. It is a commitment to" >> "$OUTPUT"
echo "the people whose data it holds." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Data integrity means $INTEGRITY to me. The database" >> "$OUTPUT"
echo "managing critical data must answer to no commercial" >> "$OUTPUT"
echo "interest that might override correctness for profit." >> "$OUTPUT"
echo "PostgreSQL is owned by no company. Its licence" >> "$OUTPUT"
echo "places no conditions on use. Its governance answers" >> "$OUTPUT"
echo "only to its community. That is what I want for the" >> "$OUTPUT"
echo "data I am responsible for." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "If I could build one thing and give it away freely," >> "$OUTPUT"
echo "it would be $BUILD — stored in PostgreSQL, licensed" >> "$OUTPUT"
echo "openly, maintained with the same commitment to" >> "$OUTPUT"
echo "correctness that forty years of research built." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $AUTHOR | $DATE" >> "$OUTPUT"
echo "=================================================" >> "$OUTPUT"

cat "$OUTPUT"
echo ""
echo "  Saved to: $OUTPUT"
echo "================================================================"
