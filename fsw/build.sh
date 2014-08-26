#
# We delete intermediate containers to get minimal size
#
docker run -it -v /software --name fsw_installers jboss/fsw_installers:6.0.0 echo "Installers volume ready"
docker run -it --name "fsw_install" --volumes-from fsw_installers jboss/base /software/fsw/install-fsw.sh
#
# If you dont have the volume with the software, but have it locally, can build with (replace two lines above):
# docker run -t -i --name "dtgov_install" -v /home/jmorales/repositories/jorgemoralespou/jboss-virtual-environments.git/docker-containers/docker/fsw/installers/software:/software jboss/base /software/install-fsw.sh
#
#
docker commit -m "FSW installed" fsw_install jboss/fsw_base:6.0.0
docker rm -f fsw_install
docker rm -f fsw_installers

# Build the appropiate images
echo "Creating the FSW image"
docker build --rm -t jboss/fsw:6.0.0 .
