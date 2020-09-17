#!/usr/bin/env sh

config="${HOME}/.config"
name='amidst-for-minetest'

if [ ! -z ${XDG_CONFIG_HOME} ]; then
    config="${XDG_CONFIG_HOME}"
fi

java \
    -jar /usr/share/java/${name}.jar \
    -biome-profiles "${config}/${name}/biome-profiles"
