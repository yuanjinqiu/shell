#####################################################
# File Name: telnet_ip.sh
# Author:jinqiu                                     #
# mail:18338671101@183.com                          #
# Created Time: 2023-04-03                          #
#####################################################

#!/bin/bash


# for i in `cat ip`
# do
#   ip=`echo $i|awk -F':' '{print $1}'`
#   port=`echo $i|awk -F':' '{print $2}'`

#   echo -e "\n"|telnet $ip $port |grep "Connected to\|Escape character" >/dev/null
#   if [ $? -eq 0 ];then
#      echo "$LOCALIP result $ip $port
#   else
#      echo "$LOCALIP result $ip $port
#   fi
# done




function foo(){
   echo 'hello'
}


foo






