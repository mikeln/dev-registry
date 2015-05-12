#!/bin/bash 

if [ -z $1 ]; then
	echo "usage: addrunportfw.sh <port>"
	exit 1
fi
echo "adding running boot2docker-vm port forward $1"
VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port$1,tcp,,$1,,$1";
if [ $? -ne 0 ];then
	echo "ERROR modifying running vm for tcp port $1"
else
	echo "Added boot2docker-vm running tcp port forward $1"
fi
VBoxManage controlvm "boot2docker-vm" natpf1 "udp-port$1,udp,,$1,,$1";
if [ $? -ne 0 ];then
	echo "ERROR modifying running vm for udp port $1"
else
	echo "Added boot2docker-vm running udp port forward $1"
fi

