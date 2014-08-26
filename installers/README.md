# Installers software container
This container is used to share software instllation files with the fsw images that will be built, but not embedding the software into the image, rather providing a volume.

## Software included
* BZ-1085860 (Directory containing the corresponding contents for the FSW Rollup Patch 2)
* install-fsw.sh: Install script for the FSW and the patch
* install-fsw.xml: Silent xml installation script for base install
* install-fsw.xml.variables: Variables for silent script
* jboss-fsw-installer-6.0.0.GA-redhat-4.jar: FSW 6.0.0 installer file
