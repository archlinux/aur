#!/bin/bash

CONFIG_DIR="$HOME/.config/btdex"

mkdir -p $CONFIG_DIR

java -jar /opt/btdex/btdex.jar -f "$CONFIG_DIR/config.properties"
