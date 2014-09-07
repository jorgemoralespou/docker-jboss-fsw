#
#
FROM jmorales/fsw_base:6.0.2
MAINTAINER jmorales <jmorales@redhat.com>

# Add EAP_HOME environment variable, to easily upgrade the script for different EAP versions
ENV EAP_HOME /home/jboss/jboss-eap-6.1

# Enable binding to all network interfaces and debugging inside the EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> ${EAP_HOME}/bin/standalone.conf

# Add volume if you want to externalize logs
VOLUME ${EAP_HOME}/standalone/logs

# Add 2 volumes to test file bindings
VOLUME /input
VOLUME /output

# Expose the required port
EXPOSE 8080 9990 9999 8787

# Start FSW
ENTRYPOINT ["/home/jboss/jboss-eap-6.1/bin/standalone.sh"]
CMD []
