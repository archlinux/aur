#! /bin/bash
# 该脚本用于处理aur安装软件时，由github下载缓慢甚至无法下载的问题

domin=`echo $2 | cut -f3 -d'/'`;
others=`echo $2 | cut -f4- -d'/'`;
case "$domin" in 
    "github.com")
    url="https://ghproxy.com/https://github.com/"$others;
    echo "download from github mirror $url";
    /usr/bin/aria2c -x 16 -s 8 -k 1M -o $1 $url;
    ;;
    *)
    url=$2;
    /usr/bin/aria2c -x 16 -s 8 -k 1M -o $1 $url;
    ;;
esac
