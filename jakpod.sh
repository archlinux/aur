#!/bin/bash
set -e

[ -d ~/.jakpod/config ] || mkdir -p ~/.jakpod/config
[ -f ~/.jakpod/config/jakpod.properties ] || sed "s#!USER_MOUNT!#/run/media/$USER#" /opt/jakpod/jakpod.properties > ~/.jakpod/config/jakpod.properties

java -Xmx512M -cp . -jar /opt/jakpod/jakpod.jar
