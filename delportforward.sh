#!/bin/bash 

if [ -z $1 ]; then
	echo "usage: delportforward <port>"
	exit 1
fi
echo "deleting boot2docker-vm port forward $1"
VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "tcp-port$1";
if [ $? -ne 0 ];then
	echo "ERROR deleting vm tcp port $1"
else
	echo "Removed boot2docker tcp port forward $1"
fi
VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "udp-port$1";
if [ $? -ne 0 ];then
	echo "ERROR deleting vm udp port $1"
else
	echo "Removed boot2docker udp port forward $1"
fi

