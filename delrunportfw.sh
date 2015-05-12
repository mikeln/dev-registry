#!/bin/bash 

if [ -z $1 ]; then
	echo "usage: delrunportfw.sh <port>"
	exit 1
fi
echo "deleting boot2docker-vm running port forward $1"
VBoxManage controlvm "boot2docker-vm" natpf1 delete "tcp-port$1";
if [ $? -ne 0 ];then
	echo "ERROR deleting running vm tcp port $1"
else
	echo "Removed boot2docker running tcp port forward $1"
fi
VBoxManage controlvm "boot2docker-vm" natpf1 delete "udp-port$1";
if [ $? -ne 0 ];then
	echo "ERROR deleting running vm udp port $1"
else
	echo "Removed boot2docker running udp port forward $1"
fi

