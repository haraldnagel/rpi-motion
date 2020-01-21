#!/bin/sh

MOTION_IMAGE_NAME=rpi-motion
MOTION_PWD=$(pwd)
MOTION_TZ=$(cat /etc/timezone)
MOTION_VIDEODIR=${MOTION_PWD}/videos

mkdir -p "$MOTION_VIDEODIR"

docker run -d \
	--restart=unless-stopped \
	-e TZ="$MOTION_TZ" \
	--device=/dev/video0:/dev/video0 \
	-v "$MOTION_VIDEODIR":/mnt/motion \
	-p 8080:8080 \
	-p 8081:8081 \
	--name motion \
	"$MOTION_IMAGE_NAME"

