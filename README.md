==
Local Image Repo helpers
==

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
#docker run -d --name devreg -v /Users/mikeln/dev/cloud/docker-image-repo:/DockerRepo -p 5000:5000 -p 5001:5001 quay.io/mikeln/registry_mln:notls


Also assumes you build docker /Distribution image yourself.

````
        storage:
           cache:
               layerinfo: inmemory
           filesystem:
               rootdirectory: /DockerRepo
           maintenance:
               uploadpurging:
                   enabled: false
`````

specify the repo with the image: e.g.

        docker push dockerrepo.mineco.lab:5000/animage:vXX


This runs as a non-secured repo (i.e no SSL/TLS or BasicAuth).  It assumes it is within a safe LAN.

NOTE: the volume mount has to be on /Users (if in boot2docker) and connot contain any symbolic links.

