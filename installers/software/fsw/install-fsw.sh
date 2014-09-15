#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
java -jar ${DIR}/../jboss-fsw-installer-6.0.0.GA-redhat-4.jar ${DIR}/install-fsw.xml -variablefile ${DIR}/install-fsw.xml.variables
PATCH="BZ-1085860"
ROLLUP="6.0_2_2014"
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-base.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-dtgov.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-rtgov-server.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-s-ramp.zip -d /home/jboss
unzip -o ${DIR}/../patchsets/${PATCH}/fsw-${ROLLUP}-switchyard.zip -d /home/jboss

###
# BEGIN - Customize configuration for Switchyard
#

# Enable metrics collection
sed -i -e 's/collectionEnabled=false/collectionEnabled=true/g' /home/jboss/jboss-eap-6.1/standalone/configuration/overlord-rtgov.properties 2> /dev/null

#
# BEGIN - Customize configuration for Switchyard
###

###
# BEGIN - Customize configuration for DTGov
#
PROFILE="standalone.xml"
JBOSS_CONSOLE_LOG=jboss-setup-console.log
STARTUP_WAIT=30
echo "Starting JBoss EAP in 'admin-only' mode."
# To start in admin-mode user:   --admin-only
# Workflows can not be installed in admin-only as they are installed using s-ramp console
/home/jboss/jboss-eap-6.1/bin/standalone.sh -c ${PROFILE} -b 0.0.0.0 -bmanagement 0.0.0.0  2>&1 > $JBOSS_CONSOLE_LOG &

# Some wait code. Wait till the system is ready. Basically copied from the EAP .sh scripts.
count=0
launched=false

until [ $count -gt $STARTUP_WAIT ]
  do
    grep 'JBAS015874:' $JBOSS_CONSOLE_LOG > /dev/null
    if [ $? -eq 0 ] ; then
      launched=true
      break
    fi
    sleep 1
    let count=$count+1;
  done
  
  #Check that the platform has started, otherwise exit.

 if [ $launched = "false" ]
 then
	echo "JBoss EAP did not start correctly. Exiting."
	exit 1
else
	echo "JBoss EAP started."
fi

#
# We install the workflows
#
/home/jboss/jboss-eap-6.1/bin/s-ramp.sh -f ${DIR}/s-ramp-workflow.commands

#
# We set mail server configuration, with defaults. Linked container name must be mail, and exposed port 25
#
/home/jboss/jboss-eap-6.1/bin/jboss-cli.sh -c --user=admin --password=admin123! --file=${DIR}/install-dtgov-jbosscli.commands

# And we can shutdown the system using the CLI.
echo "Shutting down JBoss EAP."
/home/jboss/jboss-eap-6.1/bin/jboss-cli.sh -c ":shutdown"
#
# END - Customize configuration for DTGov
###

