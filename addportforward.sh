#!/bin/bash 

if [ -z $1 ]; then
	echo "usage: addportforward <port>"
	exit 1
fi
echo "adding boot2docker-vm port forward $1"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$1,tcp,,$1,,$1";
if [ $? -ne 0 ];then
	echo "ERROR modifying vm for tcp port $1"
else
	echo "Added boot2docker-vm tcp port forward $1"
fi
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$1,udp,,$1,,$1";
if [ $? -ne 0 ];then
	echo "ERROR modifying vm for udp port $1"
else
	echo "Added boot2docker-vm udp port forward $1"
fi

