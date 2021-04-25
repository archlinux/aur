#!/bin/bash

home=$HOME

if [ $UID -eq 0 ];then
    home=/root;
fi

dir=$home/.config/aria2;

session=$dir/session.lock;
config=$dir/aria2.conf;

#create dir
if [ ! -d $dir ];then
    mkdir -p $dir;
fi
#create session
if [ ! -f $session ];then
    touch $session;
fi
#create config
if [ ! -f $config ];then
    cp /etc/aria2/aria2.conf.example $config;
fi

exec /usr/bin/aria2c --conf-path=$config;
