FROM archlinux

# must match pkgver in PKGBUILD
# ARG version

RUN pacman --noconfirm -Syyu base-devel namcap
RUN mkdir /build && chown -R alpm:alpm /build
RUN echo "alpm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /build
COPY --chown=alpm:alpm ./PKGBUILD /build/PKGBUILD
USER alpm
RUN namcap PKGBUILD
RUN makepkg --noconfirm -s
# RUN namcap exfetch-$version-1-x86_64.pkg.tar.zst
