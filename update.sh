#!/bin/sh

updpkgsums
makepkg --printsrcinfo > .SRCINFO
