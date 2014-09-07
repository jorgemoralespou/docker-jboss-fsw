#
#
#
FROM jmorales/fsw_sy
MAINTAINER jmorales <jmorales@redhat.com>

#
# We create the directories that will be used as volume in the specific containers
#
RUN mkdir /home/jboss/dev /home/jboss/qa /home/jboss/stage /home/jboss/prod && chmod 777 /home/jboss/dev && chmod 777 /home/jboss/qa && chmod 777 /home/jboss/stage

# Install the files that will copy the artifact from the volume to the deployment target 
#
#
ADD deployment-file-copier-0.0.1-SNAPSHOT.jar /home/jboss/jboss-eap-6.1/standalone/deployments/
