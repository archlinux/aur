#!/bin/sh
#开始安装 aria2
usr=`whoami`
file="/etc/aria2"
file_session=/etc/aria2/aria2.session
file_conf=/etc/aria2/aria2.conf
userpath=/home/$usr/Downloads
if [ ! -d "$file" ]; then
    echo "正在安装 aria2 "
    sudo pacman -S --noconfirm aria2
    echo "创建目录 $file"
    sudo mkdir $file
    echo "创建文件 $file_session"
    sudo touch $file_session
    echo "创建文件 $file_conf"
    sudo touch $file_conf
    sudo chmod 777 $file_session
    sudo chmod 777 $file_conf
    echo "写入默认配置信息..."
    sudo echo "#＝＝＝＝＝＝＝＝＝文件保存目录自行修改">> $file_conf
    sudo echo "#username根据实际情况修改">> $file_conf
    sudo echo "dir=$userpath">> $file_conf
    sudo echo "disable-ipv6=true">> $file_conf
    sudo echo "">> $file_conf
    sudo echo "#打开rpc的目的是为了给web管理端用">> $file_conf
    sudo echo "enable-rpc=true">> $file_conf
    sudo echo "rpc-allow-origin-all=true">> $file_conf
    sudo echo "rpc-listen-all=true">> $file_conf
    sudo echo "#rpc-listen-port=6800">> $file_conf
    sudo echo "#断点续传">> $file_conf
    sudo echo "continue=true">> $file_conf
    sudo echo "input-file=$file_session">> $file_conf
    sudo echo "save-session=$file_session">> $file_conf
    sudo echo "">> $file_conf
    sudo echo "#最大同时下载任务数">> $file_conf
    sudo echo "max-concurrent-downloads=20">> $file_conf
    sudo echo "save-session-interval=120">> $file_conf
    sudo echo "">> $file_conf
    sudo echo "# Http/FTP 相关">> $file_conf
    sudo echo "connect-timeout=120">> $file_conf
    sudo echo "#lowest-speed-limit=10K">> $file_conf
    sudo echo "#同服务器连接数">> $file_conf
    sudo echo "max-connection-per-server=10">> $file_conf
    sudo echo "#max-file-not-found=2">> $file_conf
    sudo echo "#最小文件分片大小, 下载线程数上限取决于能分出多少片, 对于小文件重要">> $file_conf
    sudo echo "min-split-size=10M">> $file_conf
    sudo echo "#单文件最大线程数, 路由建议值: 5">> $file_conf
    sudo echo "split=10">> $file_conf
    sudo echo "check-certificate=false">> $file_conf
    sudo echo "#http-no-cache=true">> $file_conf
fi

#开始安装服务
aria2ser=/etc/systemd/system//aria2c.service
if [ ! -d "$aria2ser" ]; then
    echo "开始安装 aria2c 服务"
    sudo cp aria2c.service $aria2ser
    sudo chmod 755 $aria2ser
    echo "重载 systemctl 配置"
    sudo systemctl daemon-reload
    echo "设置开机启动项"
    sudo systemctl enable aria2c
    echo "安装完成"
    sudo systemctl aria2c stop
    sudo systemctl aria2c start
    echo "重启服务成功"
fi
