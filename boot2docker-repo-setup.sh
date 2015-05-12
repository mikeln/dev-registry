#!/bin/bash
#
# setup for private local repo
#
boot2docker ssh "echo $'EXTRA_ARGS=\"--insecure-registry dockerrepo.mineco.lab:5000\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"

. addrunportfw.sh 5000
. addrunportfw.sh 5001
