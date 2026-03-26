# Log Monitoring Workflow: Turn a New Leaf

## Overview
Automated log monitoring workflow to detect repeated failed login attempts using Bash and Python.

---

## Key Functionality

- Extract failed login attempts (`grep`)  
- Count attempts (`wc -l`)  
- Group by IP (`awk`, `sort`, `uniq`)  
- Apply threshold (>5 attempts)  
- Generate report and email alert  
- Validate results using Python  

---

## Evidence

### Script Execution
![Script Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/script_execution.jpg) 

### Automation (Cron)
![Cron Job](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/cron.jpg)

### Python Validation
![Python Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/python_output.jpg)

---

## Key Result

No IPs exceeded the defined threshold.  
The system correctly identified normal activity and generated no alerts.

---

## Lessons Learned

- Monitoring is valuable even when no threats are detected  
- Automation improves consistency and reduces manual effort  
- Threshold-based detection requires tuning over time  

---

## Improvements

- Real-time monitoring instead of scheduled execution  
- Dynamic thresholds based on activity patterns  
- IP geolocation analysis for better context  

---

## Full Documentation

Detailed workflow and script explanation:  
[View Full Report](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/Turn%20a%20New%20Leaf)
