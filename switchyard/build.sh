#!/bin/bash

FSW_VERSION=6.0.2
#
# We delete intermediate containers to get minimal size
#
if [[ "$(docker images | grep jmorales/fsw_installers | wc -l)" == 0 ]]
then
   echo "No image with the installers. Build it and then come back"
   exit 255
fi

docker run -it -v /software --name fsw_installers jmorales/fsw_installers:${FSW_VERSION} echo "Installers volume ready"
docker run -it --name "sy_install" --volumes-from fsw_installers jmorales/jboss-base /software/sy/install-sy.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -it --name "sy_install" -v $(PATH_TO_FSW)/fsw/installers/software:/software jmorales/boss-base /software/install-sy.sh
#
#
docker commit -m "SY installed" sy_install jmorales/fsw_sy_base:${FSW_VERSION}
docker rm -vf sy_install
docker rm -vf fsw_installers

# Build the appropiate images
echo "Creating the SwitchYard image"
docker build --rm -t jmorales/fsw_sy:${FSW_VERSION} .
docker tag jmorales/fsw_sy:${FSW_VERSION} jmorales/fsw_sy
