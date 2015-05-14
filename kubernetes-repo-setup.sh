#!/bin/bash
#
# setup for private local repo in kubernetes
#
# this is for local boot2docker access: the local dockerd has to know the private repo is insecure
#
#boot2docker ssh "echo $'EXTRA_ARGS=\"--insecure-registry dockerrepo.mineco.lab:5000\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"

#
# only needed on the repo server side...open the ports to the outside world
#
#. addrunportfw.sh 5000
#. addrunportfw.sh 5001

#
# the kub nodes need to know the private repo is insecure
#
#edit: kraken/cloud_configs/node.yaml
#
#- name: docker.service
#      drop-ins:
#        - name: 51-docker-flannel.conf
#          content: |
#            [Unit]
#            # startup, otherwise containers won't land in flannel's network...
#            Requires=flanneld.service
#            After=flanneld.service
#
#            [Service]
#            ExecStart=
#            ExecStart=/usr/lib/coreos/dockerd --daemon --insecure-registry=dockerrepo.mineco.lab:5000 --host=fd:// $DOCKER_OPTS $DOCKER_OPT_BIP $DOCKER_OPT_MTU $DOCKER_OPT_IPMASQ
#            Environment=DOCKER_OPTS='--registry-mirror="http://$DOCKER_CACHE:5000"'
