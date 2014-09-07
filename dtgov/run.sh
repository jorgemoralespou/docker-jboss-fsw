# You can add /input volume, /output volume, 8787 port mapping for debugging, and command line options like, "-c standalone-ha.xml" or "--debug"
#
#
docker run -it --rm -p 8080:8080 -p 9990:9990 -p 9999:9999 jmorales/fsw_dtgov
