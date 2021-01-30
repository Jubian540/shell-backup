#!/bin/bash 

ROOTFS=${1-rootfs}
TARGET=${2-rootfs.img}
MKDIR=build-rootfs

echo "start of $ROOTFS! output: $TARGET"

sudo dd if=/dev/zero of=$TARGET bs=1G count=8 status=progress
mkdir $MKDIR
sudo mkfs.ext4 $TARGET
sudo mount $TARGET $MKDIR

if [ ! -d  $MKDIR ];then
    mkdir $MKDIR
fi

sudo cp -rf $ROOTFS/* $MKDIR/
sudo umount $MKDIR
sudo rm -rf $MKDIR

sudo e2fsck -p -f $TARGET
sudo resize2fs  -M $TARGET