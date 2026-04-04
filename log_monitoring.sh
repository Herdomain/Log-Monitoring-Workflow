# 🔐 Log Monitoring & Threat Detection (Turn a New Leaf)

#!/bin/bash

# ============================================================
# Script:      log_monitoring.sh
# Project:     Turn a New Leaf
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
#   sudo ./log_monitoring.sh
#
# Required permissions:
#   sudo access is required to read /var/log/auth.log

# Output directory
#   /home/student/log_monitoring/
#
# Expected output:
#   - Console report of flagged IPs (if threshold exceeded)
#   - Summary saved to summary.txt
#   - Anomalies saved to anomalies.txt
#   - Weekly report generated on scheduled Friday runs

# ------------------------------------------------------------
# DEPENDENCIES
# ------------------------------------------------------------
# Bash 4.0 or higher
# Python 3.x (for validate_results.py)
# Standard Linux tools: grep, awk, sort, uniq
# Access to /var/log/auth.log

# ------------------------------------------------------------
# CONFIGURATION
# ------------------------------------------------------------
# Adjust the following variables to match your environment:
#
# LOG_FILE      — Path to the authentication log
#                 Default: /var/log/auth.log
#
# THRESHOLD     — Number of failed attempts before an IP
#                 is flagged as suspicious
#                 Default: 5
#
# REPORT_DIR    — Directory where output files are saved
#                 Default: current working directory
#
# Example:
#   LOG_FILE="/var/log/auth.log"
#   THRESHOLD=5
#   REPORT_DIR="/home/student/reports"

# ------------------------------------------------------------
# CRON SCHEDULE
# ------------------------------------------------------------
# To automate, add the following to your crontab:
#   crontab -e
#
# Run every hour on Thursdays:
#   0 * * * 4 /path/to/log_monitoring.sh
#
# Run weekly report every Friday at 4AM:
#   0 4 * * 5 /path/to/log_monitoring.sh
#
# To verify your cron schedule is active:
#   crontab -l

# ------------------------------------------------------------
# OUTPUT FILES
# ------------------------------------------------------------
# summary.txt
#   — High-level report of monitoring results
#   — Indicates whether any IPs exceeded the threshold
#   — Generated on every run
#
# anomalies.txt
#   — Detailed list of flagged IPs and attempt counts
#   — Only populated when threshold is exceeded
#   — Empty file generated when no anomalies are detected
#
# Weekly Report
#   — Consolidated summary of the week's monitoring activity
#   — Generated automatically on Friday cron runs

# ------------------------------------------------------------
# VALIDATION
# ------------------------------------------------------------
# After the script runs, validate results using:
#   python3 validate_results.py
#
# The validation script confirms:
#   — Detection logic executed correctly
#   — Output files were generated as expected
#   — No false positives present in the anomalies report

# ------------------------------------------------------------
# KNOWN LIMITATIONS
# ------------------------------------------------------------
# - Monitors IPv4 addresses only; IPv6 not currently supported
# - Log rotation may cause missed events if not configured
#   to retain auth.log history
# - Threshold is static; does not adjust based on baseline
#   activity over time
# - Script does not automatically block flagged IPs;
#   containment actions must be taken manually

# ------------------------------------------------------------
# EXAMPLE OUTPUT
# ------------------------------------------------------------
# When no threshold is exceeded:
#   "Failed login attempts are within the normal range.
#    No flagged IPs to report. Weekly report not sent."
#
# When threshold is exceeded:
#   "WARNING: Suspicious activity detected.
#    [IP Address] exceeded threshold with [X] attempts.
#    Report saved to anomalies.txt"

