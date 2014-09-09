echo "ls -l software > files_list.txt"
FSW_VERSION=6.0.2
[ ! -e software/jboss-fsw-installer-6.0.0.GA-redhat-4.jar ] && echo "No FSW installer in software (jboss-fsw-installer-6.0.0.GA-redhat-4.jar)" && exit 1
chmod 666 software/*.jar 
[ ! -d software/patchsets/BZ-1085860 ] && echo "Extract patchset BZ-1085860 in software/patchsets/BZ-1085860" && exit 1
chmod 755 software/patchsets
chmod 755 software/patchsets/BZ-1085860
chmod 666 software/patchsets/BZ-1085860/*.zip 
#
# Build the image
docker build --rm -t "jmorales/fsw_installers:${FSW_VERSION}"  .
docker tag jmorales/fsw_installers:${FSW_VERSION} jmorales/fsw_installers
