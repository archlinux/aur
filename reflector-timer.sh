#!/usr/bin/bash
options=$(grep -v '^#' /etc/reflector.conf |  paste -s -d' ')
eval "reflector $options"
