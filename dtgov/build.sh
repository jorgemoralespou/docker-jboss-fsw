#!/bin/bash

FSW_VERSION=6.0.2
#
# We delete intermediate containers to get minimal size
#
docker run -it -v /software --name fsw_installers jmorales/fsw_installers:${FSW_VERSION} echo "Installers volume ready"
docker run -it --name "dtgov_install" --volumes-from fsw_installers jmorales/jboss-base /software/dtgov/install-dtgov.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -it --name "dtgov_install" -v $(PATH_TO_FSW)/fsw/installers/software:/software jmorales/boss-base /software/install-dtgov.sh
#
#
docker commit -m "DTGov installed" dtgov_install jmorales/fsw_dtgov_base:${FSW_VERSION}
docker rm -vf dtgov_install
docker rm -vf fsw_installers

# Build the appropiate images
echo "Creating the DTGov image"
docker build --rm -t jmorales/fsw_dtgov:${FSW_VERSION} .
docker tag jmorales/fsw_dtgov:${FSW_VERSION} jmorales/fsw_dtgov
