#!/bin/bash

FSW_VERSION=6.0.0
#
# We delete intermediate containers to get minimal size
#
docker run -it -v /software --name fsw_installers jboss/fsw_installers:${FSW_VERSION} echo "Installers volume ready"
docker run -it --name "sy_install" --volumes-from fsw_installers jboss/base /software/sy/install-sy.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -it --name "sy_install" -v $(PATH_TO_FSW)/fsw/installers/software:/software jboss/base /software/install-sy.sh
#
#
docker commit -m "SY installed" sy_install jboss/fsw_sy_base:${FSW_VERSION}
docker rm -vf sy_install
docker rm -vf fsw_installers

# Build the appropiate images
echo "Creating the SwitchYard image"
docker build --rm -t jboss/fsw_sy:${FSW_VERSION} .
