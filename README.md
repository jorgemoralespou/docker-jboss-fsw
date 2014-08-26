# Create FSW docker containers
This repository has access to many FSW containers that will allow you to run FSW in a variety of ways:

- jmorales_fsw/base:6.0:        Base image that has OpenJDK 1.7 and jboss user with /home/jboss where everything will be installed
- jmorales_fsw/installers:6.0   Image that has installer software in /software volumen that can be added to any container in order to install things
- jmorales_fsw/fsw:6.0          FSW base installation with no CMD or ENTRYPOINT set
- jmorales_fsw/standalone:6.0   FSW install that starts FSW with standalone profile and binding to 0.0.0.0 
- jmorales_fsw/standalone-ha:6.0 FSW install that starts FSW with standalone-ha profile and binding to 0.0.0.0
- jmorales_fsw/standalone-full-ha:6.0 FSW install that starts FSW with standalone-full-ha profile and binding to 0.0.0.0

