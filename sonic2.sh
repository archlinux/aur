#!/bin/sh

#So the program stores saves and configs in home
mkdir -p ~/.local/share/sonic2/
cd ~/.local/share/sonic2/

exec /opt/sonic2013/sonic-2
