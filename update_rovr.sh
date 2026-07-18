 #!/usr/bin/env bash

updpkgsums

makepkg -o

makepkg --printsrcinfo > .SRCINFO
