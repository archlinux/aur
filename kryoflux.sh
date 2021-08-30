#!/bin/sh
export PATH=/usr/share/java/kryoflux:$PATH
archlinux-java-run --max 8 -- -jar /usr/share/java/kryoflux/kryoflux-ui.jar
