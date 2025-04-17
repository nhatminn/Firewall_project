# 🛡️ Linux Firewall Project (iptables) - Cybersecurity Resume Portfolio

This project demonstrates a custom Linux firewall configured using `iptables` on Kali Linux. It’s designed to simulate a Security Operations Center (SOC) engineer's approach to controlling network traffic and defending a system.

## 📁 Project Structure
firewall-project/ 
├── firewall.sh # Activates the custom firewall rules 
├── reset.sh # Resets all firewall rules to allow all traffic 
├── logs/ 
│ └── firewall.log # Captures dropped packets (logged via kernel) 
└── README.md # This documentation file

## 🚀 Features

- ✅ **Blocks All Incoming Traffic** by default
- ✅ **Allows Trusted Services**:  
  - SSH (port 22)  
  - HTTP (port 80)  
  - HTTPS (port 443)
- ✅ **Drops Ping Requests (ICMP)** for stealth
- ✅ **Logs Dropped Packets** to `logs/firewall.log`
- ✅ **Easy Reset Script** to revert all rules

---

## 🧠 How It Works

The `firewall.sh` script:
- Flushes existing rules
- Sets default policy to DROP
- Allows essential services (SSH, Web)
- Enables connection tracking
- Logs and drops all other packets

---
