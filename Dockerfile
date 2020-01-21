FROM balenalib/rpi-debian:buster-run

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install motion -y --no-install-recommends
RUN mkdir -p /mnt/motion && chown motion /mnt/motion
COPY motion.conf /etc/motion/motion.conf

VOLUME /mnt/motion
EXPOSE 8080
EXPOSE 8081
ENTRYPOINT ["motion"]

