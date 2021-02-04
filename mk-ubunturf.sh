#!/bin/bash

sudo cp -b /etc/resolv.conf etc/resolv.conf
sudo cp /usr/bin/qemu-*-static usr/bin/
sudo cp  -r /etc/skel etc/

sed -i s@/ports.ubuntu.com/@/mirrors.ustc.edu.cn/@g etc/apt/sources.list

mount -v --bind /dev dev
mount -vt devpts devpts dev/pts -o gid=5,mode=620
mount -vt proc proc proc
mount -vt sysfs sysfs sys
sudo mount -vt tmpfs tmpfs run

chmod 777 tmp
chroot .

sudo umount -vt devpts dev/pts
sudo umount -vt proc proc 
sudo umount -vt sysfs sys
sudo umount -vt tmpfs run
sudo umount -v dev

sudo rm -rf /etc/apt/sources.list.d/*.key
sudo rm -rf /packages
sudo rm -rf /var/lib/apt/lists/*
