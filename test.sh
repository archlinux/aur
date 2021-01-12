#!/bin/bash
updpkgsums && \
  makepkg -f && \
  podman build . -t zim && \
  podman run --rm -it zim /usr/bin/zsh -c 'sudo pacman --noconfirm -U zsh-zim-git-* && zsh'
