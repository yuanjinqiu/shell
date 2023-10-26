#####################################################
# File Name: user_add.sh
# Author:jinqiu                                     #
# mail:18338671101@183.com                          #
# Created Time: 2023-07-04                          #
#####################################################
#!/bin/bash
#创建10个用户，并分别设置密码，密码要求10位且包含大小写字母以及数字
#最后需要把每个用户的密码存在指定文件中
#前提条件：安装yum install expect命令
#生成10个用户的序列（00-09）

#判断mkpasswd是否安装
n=`rpm -qa expect|wc -l`
if [ $n -eq 0 ]
then
   yum install expect -y
else
  echo "mkpasswd已安装"
fi 

#for u in `seq -w 0 09`
for u in `cat user.txt` #通过文件创建用户
do
  user=$u #添加用户只需改$u
  id ${user} > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
  echo "${user} 已存在！"
  else
 #创建用户
  useradd $user
 #生成密码
  p=`mkpasswd -s 0 -l 10`
 #从标准输入中读取密码进行修改（不安全）
  echo $p|passwd --stdin $user
 #常规修改密码
 #echo -e "$p\n$p"|passwd user_$u
 #将创建的用户及对应的密码记录到日志文件中
  echo "$user $p" >> ./userpassword
  fi
done