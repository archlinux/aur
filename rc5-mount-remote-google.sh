#!/bin/bash
set -u
set -e



user_target_link_count=0
user_target_bind_count=0
user_target_bind_mount_count=0
user_target_mount_count=0
user_target_chown_count=0


toHelp() {
    echo "hello, world"
}

# proxy list
proxy_off(){
     unset http_proxy
     unset https_proxy
     unset socks5_proxy
     echo -e "已关闭代理"
}
proxy_on() {
     export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
     export http_proxy=http://127.0.0.1:8119
     export https_proxy=$http_proxy
     export socks5_proxy="127.0.0.1:1081"  
     echo -e "已开启代理"
}

rollback() {
    echo "umount user context"
    proxy_off
    sudo -u dmeck DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "rclone" "shell exec error" 
    exit
}


trap rollback INT TERM EXIT


toRunGoogleContainer() {

    # unit bind target exist dirs
    echo "check bind target exist dirs"
    if ! test -d "$2" 
    then
        mkdir -p "$2"
        user_target_bind_count=`expr ${user_target_bind_count} + 1`   
        
    fi
    echo "check bind target not exist by of create $user_target_bind_count dirs"

    #check target dirs is mount bind
    echo "check target dirs is mount bind"
    if grep -qs "$2" /proc/mounts ;
    then
        user_target_bind_mount_count=`expr ${user_target_bind_mount_count} + 1`    
    fi
    echo "check target dirs is mount bind of $user_target_bind_mount_count"
    #bind target user context 
    if [ $user_target_bind_mount_count -gt 0 ] 
    then

        echo "exist ${user_target_bind_mount_count} bind dir of target,exit!"
        exit 1
    else
        #run load mounts target 
        if test -d "$2" 
        then
            echo "$2" 
            sudo -u dmeck DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "enable google rclone "
            if [ `whoami` == "root" ];then
                sudo -H -E  -u dmeck bash -c "$(declare -f proxy_on); proxy_on &&  nohup rclone mount google:  \"$2\" --allow-other --allow-non-empty --vfs-cache-mode writes  &"
            else
               proxy_on &&  nohup rclone mount google:  "$2" --allow-other --allow-non-empty --vfs-cache-mode writes   &
            fi 
             
            user_target_mount_count=`expr ${user_target_mount_count} + 1`   
        
        fi
        echo "target dirs is mount bind of $user_target_mount_count"
        

        
    fi
}

toRun() {


    user_target_bind="/media/target/home/dmeck/work/google"

    if [ $# -eq 1 ]; then
        case $1 in
        google)
            # if you need to launch another app, add the app name here.
            echo " start $1 application"
            toRunGoogleContainer $1 $user_target_bind
            ;;
        all)
            echo "start all application"
            toRunGoogleContainer $1 $user_target_bind
            ;;
        *)
            echo "unsupport your application"
            ;;
        esac
    else
        toHelp
    fi
}

toStopGoogleContaine() {

    proxy_off
    sudo -u dmeck DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "disenable $1 rclone" 
    fusermount -uz  "$2"
}

toStop() {
    user_target_bind="/media/target/home/dmeck/work/google"

    if [ $# -eq 1 ]; then
        case $1 in
        google)
            # if you need to stop another app, add the app name here.
            echo "stop $1 application"
            toStopGoogleContaine $1 $user_target_bind
            ;;
        all)
            echo "stop all application"
            toStopGoogleContaine $1 $user_target_bind
            ;;
        *)
            echo "unsupport your application"
            ;;
        esac
    else
        toHelp
    fi
}


case $1 in
-r)
    toRun $2 
    ;;
-s)
    toStop $2
    ;;
-h) ;&
*)
    toHelp
    ;;
esac


trap - INT TERM EXIT
