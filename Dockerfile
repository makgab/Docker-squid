#
# Docker/Podman: Fedora Squid proxy
#
# Commands for examples:
#      (podman search fedora
#      podman pull fedora:latest
#      podman images
#      podman ps -a
#      podman push fedora:myset)
#
#
#      podman build --tag fedora:squid -f ./Dockerfile
#      podman run [-it] -p 33061:3306 --name squid --hostname squid fedora:squid
#      (podman run -e MARIADB_ROOT_PASSWORD=123456 -p 3306:3306 --name mymariadb --hostname mymariadb mariadb:latest)
#      (podman create -v /home/docker:/docker --name mymariadb --hostname mymariadb mariadb:myset)
#      podman container start container_name  # mymariadb
#      podman container stop container_name   # mymariadb
#      podman container ls
#      podman exec -it squid /bin/bash
#      podman rm 02s02d202    # podman rm squid
#      podman rmi squid
#      podman volume ls
#      podman logs 02s02d202  # podman logs squid
#      podman container inspect containername
#      podman image inspect fedora:squid
#
#      podman run [-d] -it -p 3128:3128 --name squid --hostname squid --network host fedora:squid                         # container attach to host machine network interface(s)
#      (podman network create --subnet 10.88.1.0/24 --gateway 192.168.1.3 newnet)
#
#      https://www.freedesktop.org/software/systemd/man/loginctl.html
#      loginctl enable-linger username
#

# fedora:27
FROM    fedora:latest
MAINTAINER MG <makgab@gmail.com>

# RUN
RUN dnf -y update
RUN dnf install squid net-tools bash procps mc -y

# COPY README /tmp

# VOLUME /temp

# Expose port(s)
EXPOSE 3128


# ENTRYPOINT
ENTRYPOINT /usr/sbin/squid --foreground -f /etc/squid/squid.conf
