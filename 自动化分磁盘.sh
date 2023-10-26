
#!/bin/bash

#磁盘
Disk="/dev/vdb"
#挂载点
Mount="/data"
if [ -e $Mount ]
then
   echo " "
else
   mkdir -p ${Mount}
fi

#分区，并改为LVM
fdisk $Disk  <<EOF
n

p

1


t

8e

wq

EOF

mkfs.ext4 ${Disk}1
echo "${Disk}1 $Mount ext4 defaults 1 2" >>/etc/fstab
mount ${Disk}1 $Mount












