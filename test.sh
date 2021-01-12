#!/bin/bash
updpkgsums && \
  makepkg --printsrcinfo | tee .SRCINFO && \
  makepkg -f && \
  podman build . -t zim && \
  podman run --rm -it zim /usr/bin/zsh -c 'sudo pacman --noconfirm -U zsh-zim-git-* && zsh'
