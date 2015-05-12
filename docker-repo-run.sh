#!/bin/bash
#
# Run the docker containers for the local dev image repo
# 5/12/2015 MLN
#
# Assumes:
#  1) boot2docker
#  2) boot2docker --insecure-registry dockerrepo.mineco.lab:5000
#  2) boot2docker-vm ports 5000, 5001 open
#  3) DNS: dockerrepo.mineco.lab
#
# the above may be performed via: boot2docker-repo-setup.sh
#
#
docker run -d --name devreg -v /Users/mikeln/dev/cloud/docker-image-repo:/DockerRepo -p 5000:5000 -p 5001:5001 quay.io/mikeln/registry_mln:notls

