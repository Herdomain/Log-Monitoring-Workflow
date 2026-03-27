# 🔐 Log Monitoring Workflow: Turn a New Leaf

## 📌 Overview
In this project, I built a simple automated workflow to monitor system logs and detect repeated failed login attempts.

My goal was to make it easier to spot unusual activity (such as potential unauthorized access attempts) without manually reviewing large volumes of log data.

---

## ⚙️ What I Did

This workflow automatically:

- Scans system logs for failed login attempts  
- Counts how many times login attempts fail  
- Groups attempts by IP address  
- Flags suspicious activity based on a defined threshold (>5 attempts)  
- Generates a report and sends an alert if needed  
- Validates results using a Python script 

---

## 🖼️ Example Outputs

### Script Execution
![Script Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/script_execution.jpg)

### Automated Scheduling (Cron)
![Cron Job](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/images/cron.jpg)

### Python Validation
![Python Output](https://github.com/Herdomain/Log-Monitoring-Workflow/blob/main/python_output.jpg)

---

## 📊 Key Result

During testing, I found that no IP addresses exceeded the defined threshold.

This means:
- No suspicious activity was detected  
- The system correctly identified normal behavior  
- The monitoring workflow worked as expected
  
---

## 🎯 Why This Matters

Through this project, I learned that:

- Failed login attempts can indicate brute-force attacks  
- Automating log monitoring saves time and reduces manual effort  
- Even when no threats are detected, it confirms that systems are behaving normally  

---

## 📚 What I Learned

- Monitoring systems are valuable even when no alerts are triggered  
- Automation improves consistency and reliability  
- Detection thresholds need to be adjusted over time based on system activity  

---

## 🚀 Future Improvements

If I were to expand this project, I would:

- Add real-time monitoring instead of scheduled checks  
- Use dynamic thresholds based on activity patterns  
- Include IP geolocation for better context  
- Expand detection to identify other suspicious behaviors  

---

## Full Documentation

For a detailed breakdown of the workflow and scripts, see:  
👉 [View Full Report](https://docs.google.com/document/d/1oy1rIcUv8pQq3Gfbgc3rMBt2dk85vHLdjwlEAP2HPNc/edit?usp=sharing)
