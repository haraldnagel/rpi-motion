# Docker image for motion camera on Raspberry Pi

This runs a motion-detecting camera connected to a Raspberry Pi. The videos are saved into a folder on the host machine (i.e. outside of the Docker container), and can be streamed over the network too.

## Building the image

1. Figure out which [Balena base image](https://www.balena.io/docs/reference/base-images/base-images/) works for your hardware.
2. Edit the first line of the `Dockerfile` to source that image
3. `docker build . -t lazyatom/rpi-motion`

## Running

If you're happy with the defaults, you can run this using the included script:

    ./run.sh

This will connect to a webcam via `/dev/video0`, create and mount the video directory in a directory called `videos` within the current directory, and start running as a daemon.

If you need anything more customized, then you can use the commands inside `run.sh` as the basis for that.

