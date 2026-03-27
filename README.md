# 🔐 Log Monitoring & Threat Detection (SOC Workflow)

## 📌 Overview

I built an automated log monitoring workflow to detect potential brute-force login attempts by analyzing failed authentication logs.

---

## ⚙️ Problem

I wanted to solve the challenge of manually reviewing large volumes of logs, which makes it difficult to identify repeated failed login attempts that may indicate unauthorized access.

---

## ⚙️ Appoarch

- I parsed system logs for failed login attempts  
- I grouped activity by IP address  
- I flagged suspicious behavior (>5 failed attempts)  
- I automated execution using cron  
- I validated results using a Python script  

---

## 📊 Key Decisions

- **Threshold (>5 attempts):** I chose this to reduce noise from normal user errors  
- **Automation (cron):** I used scheduling to simulate continuous SOC monitoring  
- **Validation (Python):** I added this to ensure the accuracy of detection results
  
---

## 🎯 Results

During testing, no IPs exceeded the detection threshold. This validated that the workflow correctly distinguishes normal user behavior from potential threats.

---

## ❗ Detection & Response Scenario

If suspicious activity were detected, I would take the following steps:

1. **Validate the alert**
   - Confirm repeated failed login attempts from the same IP  
   - Check for false positives (e.g., user error, misconfigured service)  

2. **Investigate the source**
   - Review IP reputation (internal vs external)  
   - Analyze login patterns (frequency, timing, targeted accounts)  

3. **Escalate if necessary**
   - Flag as potential brute-force attack  
   - Document findings and notify appropriate team  

4. **Containment actions**
   - Recommend temporary IP blocking  
   - Suggest account lockout or MFA enforcement  

5. **Improve detection**
   - Adjust thresholds if needed  
   - Tune rules to reduce false positives  

---

## 🖼️ Example Outputs

### Script Execution
![Script Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/script_execution.jpg)

### Automated Scheduling (Cron)
![Cron Job](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/cron.jpg)

### Python Validation
![Python Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/python_output.jpg)

---

## 📚 Impact

- I demonstrated how automated log monitoring can support threat detection  
- I reduced the need for manual log analysis  
- I simulated a real-world SOC monitoring workflow  
  
---
  
## 📚 Next Steps

- I would integrate this workflow into a SIEM (e.g., Splunk)  
- I would implement dynamic threshold tuning  
- I would incorporate threat intelligence (IP reputation data)  
  
