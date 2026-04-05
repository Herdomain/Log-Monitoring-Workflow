# 🔐 Log Monitoring & Threat Detection (SOC Workflow)

#!/bin/bash

# ============================================================
# Script:      log_monitoring.sh
# Project:     Turn a New Leaf - Automated Log Monitoring
# Description: Automated log monitoring workflow for detecting
#              repeated failed login attempts as an early
#              indicator of brute-force activity
# Author:      Herdomain (Asheotsa Arigu)
# Version:     1.0
# Last Updated: 2025
# ============================================================

# ------------------------------------------------------------
# USAGE
# ------------------------------------------------------------
# Run manually:
#   sudo ./turn_a_newleaf.sh
#
# Required permissions:
#   sudo access is required to read /var/log/auth.log
#
# Output directory:
#   /home/student/log_monitoring/

# ------------------------------------------------------------
# VARIABLES
# ------------------------------------------------------------
# log_file="/var/log/auth.log"
#   Path to the system authentication log file
#
# threshold=5
#   Maximum number of failed login attempts before
#   triggering an alert
#
# alert_email="TurnaNewLeaf@gmail.com"
#   Email address to receive security alerts and weekly reports
#
# failed_logins_file="/home/student/log_monitoring/failed_logins.txt"
#   Stores all extracted failed login attempts
#
# summary_file="/home/student/log_monitoring/summary.txt"
#   Stores failed login attempts grouped and sorted by IP
#
# report_file="/home/student/log_monitoring/weekly_report.txt"
#   Stores the weekly security report

# ------------------------------------------------------------
# HOW IT WORKS
# ------------------------------------------------------------
# Step 1: Extract Failed Login Attempts
#   grep "failed password" $log_file > $failed_logins_file
#   Searches auth.log for lines containing "failed password"
#   and saves them to failed_logins.txt
#
# Step 2: Count Total Failed Login Attempts
#   fail_attempts=$(wc -l < "$failed_logins_file")
#   Counts the total number of failed login lines
#   Result stored in the fail_attempts variable
#
# Step 3: Summarize Failed Login Attempts by IP
#   awk '/failed password/ {print $(NF-3)}' $failed_logins_file
#   | sort | uniq -c | sort -nr > $summary_file
#   Extracts IP addresses, counts occurrences per IP,
#   and sorts results in descending order into summary.txt
#
# Step 4: Check Threshold for Failed Attempts
#   if [ "$fail_attempts" -gt "$threshold" ]; then
#   Compares total failed attempts against the threshold
#
#   If threshold exceeded:
#     "High number of failed login attempts detected: $fail_attempts"
#     Email alert sent to $alert_email
#
#   If threshold not exceeded:
#     "Failed login attempts are within the normal range."
#
# Step 5: Identify Flagged IPs
#   flagged_ips=$(grep "Invalid user" "$log_file"
#   | awk '{print $(NF-3)}' | sort | uniq)
#   Extracts unique IP addresses associated with
#   "Invalid user" entries in the log file
#
# Step 6: Create and Send Weekly Report
#   If flagged_ips exist:
#     Generates weekly_report.txt containing:
#       - Header: "Weekly Security Report"
#       - Summary of failed login attempts by IP (summary.txt)
#       - List of flagged IPs
#     Emails report to $alert_email
#     Output: "Weekly report sent to $alert_email with flagged IPs."
#
#   If no flagged_ips:
#     Output: "No flagged IPs to report. Weekly report not sent."

# ------------------------------------------------------------
# PYTHON VALIDATION (file_paths_defined.py)
# ------------------------------------------------------------
# Run on Windows via shared folder (Z: drive)
#
# SHARED_FOLDER = "Z:"
# SUMMARY_FILE  = SHARED_FOLDER + "/summary.txt"
# ANOMALIES_FILE = SHARED_FOLDER + "/anomalies.txt"
# THRESHOLD = 5
#
# The Python script:
#   - Reads summary.txt from the shared folder
#   - Splits each line into count and IP
#   - Flags any IP where count exceeds threshold
#   - Writes flagged IPs to anomalies.txt
#
#   If flagged IPs exist:
#     Writes each flagged IP and attempt count to anomalies.txt
#
#   If no flagged IPs:
#     Writes "No anomalies detected." to anomalies.txt
#
#   Output: "Done! Check 'anomalies.txt' for results."
#   Error:  "Error! Input file was not found.
#            Please check the file path."

# ------------------------------------------------------------
# AUTOMATION — CRON SCHEDULE
# ------------------------------------------------------------
# To view active cron jobs:
#   crontab -l
#
# Run every hour on Thursdays:
#   0 * * * 4 /path/to/turn_a_newleaf.sh
#
# Run weekly report every Friday at 4AM:
#   0 4 * * 5 /path/to/turn_a_newleaf.sh

# ------------------------------------------------------------
# UNUSUAL BEHAVIOR & ALERT TRIGGERS
# ------------------------------------------------------------
# The following activity is flagged as suspicious:
#   - More than 5 failed login attempts from a single IP
#   - Repeated failed logins from unexpected or unknown IPs

# ------------------------------------------------------------
# KNOWN LIMITATIONS & POTENTIAL IMPROVEMENTS
# ------------------------------------------------------------
# Dynamic Thresholds
#   Currently uses a static threshold of 5 attempts.
#   Future improvement: Automatically adjust threshold based
#   on login behavior patterns — fewer attempts allowed
#   during off-peak hours, more during peak hours.
#
# IP Geolocation Analysis
#   Currently flags IPs without identifying their origin.
#   Future improvement: Integrate an IP geolocation service
#   to flag attempts from unexpected or high-risk regions.
#
# Real-Time Alerts & Timestamps
#   Currently runs on a scheduled basis with no timestamps.
#   Future improvement: Add continuous monitoring and
#   immediate alerts for high-frequency login attempts,
#   with timestamps for precise event tracking.
