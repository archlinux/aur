#!/bin/sh

#So the program stores saves and configs in home
mkdir -p ~/.local/share/sonic1/
cd ~/.local/share/sonic1/

exec /opt/sonic2013/sonic-1
