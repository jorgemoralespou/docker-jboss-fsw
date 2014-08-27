#!/bina/bash

FSW_VERSION=6.0.0
#
# We delete intermediate containers to get minimal size
#
docker run -it -v /software --name fsw_installers jboss/fsw_installers:${FSW_VERSION} echo "Installers volume ready"
docker run -it --name "fsw_install" --volumes-from fsw_installers jboss/base /software/fsw/install-fsw.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -t -i --name "fsw_install" -v $(PATH_TO_FSW)/fsw/installers/software:/software jboss/base /software/install-fsw.sh
#
#
docker commit -m "FSW installed" fsw_install jboss/fsw_base:${FSW_VERSION}
docker rm -vf fsw_install
docker rm -vf fsw_installers

# Build the appropiate images
echo "Creating the FSW image"
docker build --rm -t jboss/fsw:${FSW_VERSION} .
