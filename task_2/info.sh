#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echow () {
        echo -e "${RED}$1${NC}"
        echo " $2 "
        echo -e '\n'
}

break_line () {
        echo -e '\n'
}

# Display the hostname of the machine
hostname=$(hostname)
echow "Hostname:" $hostname

# Display the current date and time
date=$(date)
echow "Date:" "${date}"

# Display the system information using the 'uname' command
kernel=$(uname -r)
os=$(uname -o)
arch=$(uname -m)
echow "Kernel Release:" $kernel
echow "Operating System:" $os
echow "Architecture:" $arch

# Display CPU information using 'lscpu' command
echow "CPU Information:" lscpu | grep "Model name"

# Display memory information using 'free' command
echo -e "${RED}Memory Information:${NC}"
free -h
break_line

# Display disk space information using 'df' command
echo -e "${RED}Disk Space:${NC}"
df -h
break_line

# Display network information using 'ip' command
echo -e "${RED}Network Information:${NC}"
ip a
break_line

# Display user information
echo -e "${RED}User Information:${NC}"
who
break_line

# Display the system's uptime
echo -e "${RED}Uptime:${NC}"
uptime
break_line

# Display the system's last reboot information
echo -e "${RED}Last Reboot:${NC}"
last reboot | head -n 1
break_line

# Display the system load average
loadavg=$(cat /proc/loadavg)
echo -e "${RED}Load Average:${NC}"
echo $loadavg
break_line
