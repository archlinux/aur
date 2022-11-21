#!/bin/bash
dir=/opt/PathOfBuildingCommunity
export LUA_PATH="$dir/runtime/lua/?.lua;$dir/runtime/lua/?/init.lua${LUA_PATH:+;$LUA_PATH}${LUA_PATH:-;;}"
echo $LUA_PATH
cd $dir && LC_ALL=C ./pobfrontend "$@"
