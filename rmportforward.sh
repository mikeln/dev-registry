#!/bin/bash
for i in {49000..49900}; do
 VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "tcp-port$i";
 VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "udp-port$i";
done
