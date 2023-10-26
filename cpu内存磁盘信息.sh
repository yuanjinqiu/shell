#####################################################
# File Name: cpu_mem_disk.sh
# Author:jinqiu                                     #
# mail:18338671101@183.com                          #
# Created Time: 2023-07-05                          #
#####################################################

#!/bin/bash

#!/bin/bash

DATE=$(date +%F" "%H:%M)
IP=$(ifconfig eth0 |awk '/netmask/ {print $2}')
if ! which vmstat &> /dev/null; then
    echo "vmstat command no found, Please install procps package."
    exit 1
fi

## CPU
US=$(vmstat |awk 'NR==3 {print $13}')
SY=$(vmstat |awk 'NR==3 {print $14}')
IDLE=$(vmstat |awk 'NR==3 {print $15}')
WAIT=$(vmstat |awk 'NR==3 {print $15}')
USE=$(($US+$SY))
echo -e  "\e[32m======CPU INFO=====\033[0m"
echo -e  "us(%):\\t$US%"
echo -e  "sy(%):\\t$SY%"
echo -e  "id(%):\\t$IDLE%"
echo -e  "wa(%):\\t$WAIT%"
echo -e  "use(%):\\t$USE%"

if [ $USE -ge 50 ];then
    echo -e "\033[41;30m
    Date: $DATE
    Host: $IP
    Problem: CPU utilization $USE\033[0m"
fi

## Mem
TOTAL=$(free -m |awk '/Mem/ {print $2}')
USE=$(free -m |awk '/Mem/ {print $3}')
FREE=$(free -m |awk '/Mem/ {print $4+$6}')
echo -e  "\e[33m======MEM INFO=====\033[0m"
echo -e  "TOTAL:\\t$TOTAL"
echo -e  "USE:\\t$USE"
echo -e  "FREE:\\t$FREE"


if [ $FREE -lt 1024 ]; then
    echo -e "\033[41;30m
    Date: $DATE
    Host: $IP
    Problem: Total=$TOTAL,Use=$USE,Free=$FREE\033[0m"
fi

#disk
PART_USE=$(df -h |awk -F'[% ]+' 'BEGIN{OFS="="} /^\/dev/ {print $1,$2,$3,$5,$6}')
for i in $PART_USE; do
    PART=$(echo $i |cut -d"=" -f1)
    TOTAL=$(echo $i |cut -d "=" -f2)
    USE=$(echo $i |cut -d"=" -f3)
    U=$(echo $i |cut -d"=" -f4)
    MOUNT=$(echo $i |cut -d"=" -f5)
    echo -e  "\e[34m======DISK INFO=====\033[0m"
    echo -e  "PART:\t$PART"
    echo -e  "TOTAL:\t$TOTAL"
    echo -e  "USE:\t$USE"
    echo -e  "MOUNT:\t$MOUNT"
    if [ $U -gt 80 ]; then
        echo -e  "\033[41;30m
        Date: $DATE
        Host: $IP
        Total: $TOTAL
        Problem: $PART=$USE($MOUNT)\033[0m"
    fi
done