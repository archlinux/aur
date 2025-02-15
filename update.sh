#!/bin/bash

updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg -sf --noconfirm
