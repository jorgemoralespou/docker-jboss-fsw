#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
java -jar ${DIR}/../jboss-fsw-installer-6.0.0.GA-redhat-4.jar ${DIR}/install-sy.xml -variablefile ${DIR}/install-sy.xml.variables
PATCH="BZ-1085860"
ROLLUP="6.0_2_2014"
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-base.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-dtgov.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-rtgov-server.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-s-ramp.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-switchyard.zip -d /home/jboss

#
# Enable debug
#
echo 'JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=8787,server=y,suspend=n"' >> /home/jboss/jboss-eap-6.1/bin/standalone.conf


###
# Customize configuration for Switchyard
#

#
# Fix hostnames
#
# sed -i -e 's/localhost/dtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/dtgov.properties 2> /dev/null
# sed -i -e 's/localhost/dtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/dtgov-ui.properties 2> /dev/null
# sed -i -e 's/localhost/dtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/sramp.properties 2> /dev/null
# sed -i -e 's/localhost/dtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/dtgov-ui.properties 2> /dev/null
# sed -i -e 's/localhost/rtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/overlord-rtgov.properties 2> /dev/null
# sed -i -e 's/localhost/rtgov/g' ${_install_path}/jboss-eap-6.1/standalone/configuration/gadget-server.properties 2> /dev/null
