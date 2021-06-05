#!/bin/bash

FIRMWARE=$1
echo "firmware path: $1"

rm -rf img

if [ -z "$FIRMWARE" ];then
	echo "need firmware path."
	exit
fi

img_unpack $1 img
afptool -unpack img/update.img img/update

cd img/update

tree
