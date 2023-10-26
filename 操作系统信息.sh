#####################################################
# File Name: system_info.sh
# Author:jinqiu                                     #
# mail:18338671101@183.com                          #
# Created Time: 2023-07-05                          #
#####################################################

#!/bin/bash
echo -e "\e[31m -------------------------------System Information----------------------------\e[0m"
echo -e "\e[32m Hostname:\t\t`hostname`\e[0m"
echo -e "\e[32m uptime:\t\t`uptime | awk '{print $3,$4}' | sed 's/,//'`\e[0m"
echo -e "\e[32m Manufacturer:\t\t`cat /sys/class/dmi/id/chassis_vendor`\e[0m"
echo -e "\e[32m Product Name:\t\t`cat /sys/class/dmi/id/product_name`\e[0m"
echo -e "\e[32m Version:\t\t`cat /sys/class/dmi/id/product_version`\e[0m"
echo -e "\e[32m Serial Number:\t\t`cat /sys/class/dmi/id/product_serial`\e[0m"
echo -e "\e[32m Machine Type:\t\t`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`\e[0m"
echo -e "\e[32m Operating System:\t`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`\e[0m"
echo -e "\e[32m Kernel:\t\t`uname -r`\e[0m"
echo -e "\e[32m Architecture:\t\t`arch`\e[0m"
echo -e "\e[32m Processor Name:\t`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`\e[0m"
echo -e "\e[32m Active User:\t\t`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`\e[0m"
echo -e "\e[32m System Main IP:\t`hostname -I`\e[0m"
echo -e "\e[32m `lscpu|grep 'CPU(s)'|head -1`\e[0m"
echo -e "\e[32m Mem:\t\t\t`free -h|awk -F' '  'NR==2 {print $2}'`\e[0m"