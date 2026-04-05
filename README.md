# 🔐 Log Monitoring & Threat Detection

Manual log review doesn't scale. In a real SOC environment, thousands of authentication events are generated daily, making automated detection not just useful, but necessary. 

This project builds an automated workflow that parses system logs, identifies suspicious login patterns, and flags potential brute-force attempts without human intervention.
---

## What Was Built

A bash-based log monitoring script that analyzes failed authentication logs, groups activity by IP address, and triggers an alert when any single IP exceeds five failed login attempts within the monitoring window. Automated via cron to simulate continuous SOC monitoring.

**Why five attempts?** 

The threshold was chosen to filter out normal user error because a forgotten password doesn't look the same as a brute-force attack.
Keeping the threshold low enough to catch threats while high enough to avoid alert fatigue is a core SOC tuning decision.

---

## How It Works

1. **Log Parsing** — Script reads system authentication logs and extracts failed login events
2. **IP Grouping** — Failed attempts are aggregated by source IP address
3. **Threshold Detection** — Any IP exceeding five failed attempts is flagged
4. **Automated Scheduling** — Cron runs the script continuously to simulate real-time monitoring
5. **Python Validation** — A secondary Python script verifies detection accuracy and confirms no false positives

---

## Example Outputs

**Script Execution**

![Script execution showing no flagged IPs and weekly report status](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/script_execution.jpg)

**Automated Scheduling (Cron)**

![Cron schedule running the script hourly on Thursdays and weekly on Fridays](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/cron.jpg)

**Python Validation**

![Python validation confirming no anomalies detected](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/python_output.jpg)

---

## If a Threat Were Detected

1. **Validate** — Confirm repeated failures from the same IP; rule out misconfigured services or user error
2. **Investigate** — Review IP reputation, login timing, frequency, and targeted accounts
3. **Escalate** — Classify as potential brute-force attempt; document and notify the appropriate team
4. **Contain** — Recommend IP blocking and enforce account lockout or MFA
5. **Improve** — Adjust thresholds and tune detection rules based on findings

---

## Alignment & Controls

| Component | Purpose |
|---|---|
| Bash Script | Log parsing and threshold-based detection |
| Cron Scheduling | Continuous automated monitoring |
| Python Validation | Detection accuracy verification |
| Alert Threshold (>5) | Balances sensitivity and alert fatigue |

Workflow simulates core SOC monitoring practices aligned with **NIST SP 800-61** incident detection and response principles.

---

## Next Steps

- Integrate into a SIEM platform (Splunk, Microsoft Sentinel) for centralized log correlation
  
- Implement dynamic threshold tuning based on historical baseline activity
  
- Incorporate IP reputation feeds for enriched threat context on flagged addresses

