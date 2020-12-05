#!/bin/bash

makepkg --printsrcinfo > .SRCINFO
makepkg && rm -rf dynfwd pkg src
