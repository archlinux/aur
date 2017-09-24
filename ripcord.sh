#!/usr/bin/env bash
cache="${XDG_CACHE_HOME:-$HOME/.cache}/ripcord/"
echo $cache
mkdir --parents $cache
cd $cache
cp -RT /usr/share/ripcord $cache/
$cache/Ripcord

# TODO make killing ripcord possible
# TODO kill ripcord before upgrade