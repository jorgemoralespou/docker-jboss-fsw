ls -l software > files_list.txt
docker build --rm -t "jboss/fsw_installers:6.0.0"  .
