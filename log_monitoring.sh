# 🔐 Log Monitoring & Threat Detection (Turn a New Leaf)

Manual log review doesn't scale. In a real SOC environment, thousands of 
authentication events are generated daily — making automated detection not 
just useful, but necessary. This project builds an automated workflow that 
parses system logs, identifies suspicious login patterns, and flags potential 
brute-force attempts without human intervention.

---

## What Was Built

A bash-based log monitoring script that analyzes failed authentication logs 
(`/var/log/auth.log`), groups activity by IP address, and triggers an alert 
when any single IP exceeds five failed login attempts within the monitoring 
window. Automated via cron to simulate continuous SOC monitoring.

**Why five attempts?** The threshold was chosen to filter out normal user 
error — a forgotten password doesn't look the same as a brute-force attack. 
Keeping the threshold low enough to catch threats while high enough to avoid 
alert fatigue is a core SOC tuning decision.

---

## How It Works

1. **Log Parsing** — Script reads `/var/log/auth.log` and extracts failed 
   login events using `grep`
2. **IP Grouping** — Failed attempts aggregated by source IP using `awk`, 
   `sort`, and `uniq`
3. **Threshold Detection** — Any IP exceeding five failed attempts is flagged
4. **Automated Scheduling** — Cron runs the script hourly on Thursdays and 
   weekly every Friday at 4AM to simulate continuous monitoring
5. **Python Validation** — A secondary script verifies detection accuracy 
   and confirms no false positives

---

## Example Outputs

**Script Execution**

![Script execution showing no flagged IPs and weekly report status](images/script-execution.png)

**Automated Scheduling (Cron)**

![Cron schedule running the script hourly on Thursdays and weekly on Fridays](images/cron-schedule.png)

**Python Validation**

![Python validation confirming no anomalies detected](images/python-validation.png)

---

## If a Threat Were Detected

1. **Validate** — Confirm repeated failures from the same IP; rule out 
   misconfigured services or user error
2. **Investigate** — Review IP reputation, login timing, frequency, 
   and targeted accounts
3. **Escalate** — Classify as potential brute-force attempt; document 
   and notify the appropriate team
4. **Contain** — Recommend IP blocking and enforce account lockout or MFA
5. **Improve** — Adjust threshold and tune detection rules based on findings

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Bash (`grep`, `awk`, `sort`, `uniq`) | Log parsing and threshold detection |
| Python | Detection accuracy validation and output reporting |
| Cron | Automated scheduling and continuous monitoring |
| Linux | Log analysis environment |

---

## Alignment & Controls

Workflow simulates core SOC monitoring practices aligned with **NIST SP 
800-61** incident detection and response principles.


