#!/bin/bash

FSW_VERSION=6.0.2
#
# We delete intermediate containers to get minimal size
#
docker run -it -v /software --name fsw_installers jmorales/fsw_installers:${FSW_VERSION} echo "Installers volume ready"
docker run -it --name "rtgov_install" --volumes-from fsw_installers jmorales/jboss-base /software/rtgov/install-rtgov.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -it --name "rtgov_install" -v $(PATH_TO_FSW)/fsw/installers/software:/software jmorales/boss-base /software/install-rtgov.sh
#
#
docker commit -m "SY installed" rtgov_install jmorales/fsw_rtgov_base:${FSW_VERSION}
docker rm -vf rtgov_install
docker rm -vf fsw_installers

# Build the appropiate images
echo "Creating the RTGov image"
docker build --rm -t jmorales/fsw_rtgov:${FSW_VERSION} .
docker tag jmorales/fsw_rtgov:${FSW_VERSION} jmorales/fsw_rtgov
