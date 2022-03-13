#!/bin/sh
image="latest-image"
mounts="--mount type=bind,source=/home/pi/timelapse,target=/opt/www/images"
docker stop $image
docker rm $image
docker rmi $image
docker build -t $image .
docker run --rm --name $image $mounts --detach --publish 8080:80 $image:latest
