FROM archlinux:latest

RUN pacman --noconfirm -Syyu base-devel namcap devtools
RUN mkdir /build && chown -R alpm:alpm /build
RUN echo "alpm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /build
COPY --chown=alpm:alpm ./PKGBUILD /build/PKGBUILD
USER alpm
RUN namcap PKGBUILD
RUN makepkg --noconfirm -s
CMD bash -c "makepkg --noconfirm -i && exfetch"
