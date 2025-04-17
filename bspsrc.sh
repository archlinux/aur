#!/bin/sh

java ${VM_OPTIONS} -cp "/usr/share/bspsrc/bspsrc-app-shaded.jar" info.ata4.bspsrc.app.src.BspSourceLauncher "${@}"
