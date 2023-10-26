LVM分区
#pv管理工具
pvcreate /dev/vdb1
#vg管理工具
vgcreate vg_data /dev/vdb1
#lv管理工具
    #创建LV，按剩需求分配空间，比如分配10G
    lvcreate -n  lv_data -L 10G vg_data
    #创建LV，按剩余百分比分配空间
    lvcreate -l 100%FREE -n lv_data vg_data
#格式化
mkfs.ext4 /dev/vg_data/lv_data
#挂载
mount /dev/vg_data/lv_data /data
#写入到/etc/fstab
echo "${Disk}1 $Mount ext4 defaults 1 2" >>/etc/fstab

