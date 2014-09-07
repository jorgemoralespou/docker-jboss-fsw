echo "ls -l software > files_list.txt"
FSW_VERSION=6.0.2
docker build --rm -t "jmorales/fsw_installers:${FSW_VERSION}"  .
docker tag jmorales/fsw_installers:${FSW_VERSION} jmorales/fsw_installers
