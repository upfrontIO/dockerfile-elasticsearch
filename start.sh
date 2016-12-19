#!/bin/sh
set -e

# Deployment recommendations: http://www.elastic.co/guide/en/elasticsearch/guide/current/deploy.html
echo Checking elasticsearch setup...
mapmax=`cat /proc/sys/vm/max_map_count`
filemax=`cat /proc/sys/fs/file-max`
filedescriptors=`ulimit -n`

echo "fs.file_max: $filemax"
echo "vm.max_map_count: $mapmax"
echo "ulimit.file_descriptors: $filedescriptors"

fds=`ulimit -n`
if [ "$fds" -lt "64000" ] ; then
  echo ""
  echo "Elasticsearch recommends 64k open files per process. you have $filedescriptors"
  echo "the docker deamon should be run with increased file descriptors to increase those available in the container"
  echo " try \`ulimit -n 64000\`"
else
  echo "you have more than 64k allowed file descriptors. awesome"
fi

if [ "$1" = 'elasticsearch' ]; then
	echo -e '\nStarting elasticsearch...'
	exec elasticsearch "$@"
fi

exec "$@"
