#!/bin/bash

OPTSFILE=/etc/gitbucket/gitbucket.opts
OPTIONS="$(cat $OPTSFILE | sed '/^#/d; /temp_dir/d; /gitbucket.home/d; /^$/d; s:^:--:' )"

home_dir=$HOME
temp_dir=$HOME/.tmp

mkdir -p $temp_dir

exec /usr/bin/java -jar /usr/lib/gitbucket/gitbucket.war $OPTIONS --gitbucket.home=$home_dir --temp_dir=$temp_dir

