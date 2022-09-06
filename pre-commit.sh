#! /bin/bash

updpkgsums

makepkg --printsrcinfo > .SRCINFO

rm marksman-bin*
rm LICENSE
