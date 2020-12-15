#!/bin/bash
set -u
set -e





target_base="/media/target"


user_target_link_count=0
user_target_bind_count=0
user_target_bind_mount_count=0
user_target_mount_count=0
user_target_chown_count=0
user_target_bind=("home/dmeck/work/google")


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
    sudo -u dmeck DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "disenable google rclone" 
    umount "/home/dmeck/work/google"
exit
}


trap rollback INT TERM EXIT


# unit bind target exist dirs
echo "check bind target exist dirs"

for item in "${user_target_bind[@]}";
do
    if ! test -d "$target_base/${item}" 
    then
        mkdir -p "$target_base/${item}"
        user_target_bind_count=`expr ${user_target_bind_count} + 1`   
        
    fi
done
echo "check bind target not exist by of create $user_target_bind_count dirs"

#check target dirs is mount bind
echo "check target dirs is mount bind"
for item in "${user_target_bind[@]}";
do
    if grep -qs "$target_base/${item}" /proc/mounts ;
    then
    user_target_bind_mount_count=`expr ${user_target_bind_mount_count} + 1`    
    fi
done
echo "check target dirs is mount bind of $user_target_bind_mount_count"
#bind target user context 
if [ $user_target_bind_mount_count -gt 0 ] 
then

    echo "exist ${user_target_bind_mount_count} bind dir of target,exit!"
    exit 1
else
    #run load mounts target 
    for item in "${user_target_bind[@]}";
    do
        if test -d "$target_base/${item}" 
        then
            echo "$target_base/${item}" 
            sudo -u dmeck DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "enable google rclone "
            if [ `whoami` == "root" ];then
                sudo -H -E  -u dmeck bash -c "$(declare -f proxy_on); proxy_on &&  nohup rclone mount google:  \"$target_base/${item}\" --allow-other --allow-non-empty --vfs-cache-mode writes  &"
            else
               proxy_on &&  nohup rclone mount google:  "$target_base/${item}" --allow-other --allow-non-empty --vfs-cache-mode writes   &
            fi 
             
            user_target_mount_count=`expr ${user_target_mount_count} + 1`   
        
        fi
    done
    echo "target dirs is mount bind of $user_target_mount_count"
    

    
fi



trap - INT TERM EXIT
