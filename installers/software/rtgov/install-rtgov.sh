#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
java -jar ${DIR}/../jboss-fsw-installer-6.0.0.GA-redhat-4.jar ${DIR}/install-rtgov.xml -variablefile ${DIR}/install-rtgov.xml.variables
PATCH="BZ-1085860"
ROLLUP="6.0_2_2014"
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-base.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-dtgov.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-rtgov-server.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-s-ramp.zip -d /home/jboss
# unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-switchyard.zip -d /home/jboss

###
# Customize configuration for RTGov
#
