#!/bin/bash
set -euo pipefail
sudo mv /etc/makepkg.conf.d/20-gcc.conf{,.disabled}
sudo mv /etc/makepkg.conf.d/20-clang.conf{.disabled,}
