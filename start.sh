#! /bin/bash
# 该脚本用于处理yay安装软件时，由github下载缓慢甚至无法下载的问题
# 检测域名是不是github，如果是，则替换为镜像网站，依旧使用curl下载
# 如果不是github则采用axel代替curl进行15线程下载
# 实验用链接：
# https://download.fastgit.org/beekeeper-studio/beekeeper-studio/releases/download/v1.6.11/beekeeper-studio_1.6.11_amd64.deb
# https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v1.6.11/beekeeper-studio_1.6.11_amd64.deb

domin=`echo $2 | cut -f3 -d'/'`;
others=`echo $2 | cut -f4- -d'/'`;
case "$domin" in 
    "github.com")
    url="https://download.fastgit.org/"$others;
    echo "download from github mirror $url";
    /usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o $1 $url;
    ;;
    *)
    url=$2;
    /usr/bin/axel -n 15 -a -o $1 $url;
    ;;
esac
