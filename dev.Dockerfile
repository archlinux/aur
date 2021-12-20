FROM archlinux:base
MAINTAINER Sven Fischer <docker-read-it-later@linux4tw.de>

RUN yes | pacman -Syq --noprogressbar --noconfirm base-devel \
  && useradd -m -G wheel -s /bin/bash ril \
  && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY PKGBUILD /home/ril/read-it-later-git/
RUN chown -R ril: /home/ril \
  && su -c 'cd $HOME/read-it-later-git && makepkg --clean --nocolor --noconfirm --syncdeps' ril

