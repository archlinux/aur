FROM archlinux:latest
ARG USERID
ARG GROUPID
RUN pacman --noconfirm -Syyu base-devel namcap pacman-contrib devtools nvchecker
RUN mkdir /build && chown -R alpm:alpm /build
RUN echo "alpm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN sed -r -i "s/alpm:x:[[:digit:]]+:[[:digit:]]+:(.*)$/alpm:x:$USERID:$GROUPID:\1/" /etc/passwd
VOLUME /build
WORKDIR /build
USER alpm
