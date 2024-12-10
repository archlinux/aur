#!/usr/bin/bash

default_jvm_home="/usr/lib/jvm/$(archlinux-java status | tail -n +2 | sort | cut -d ' ' -f 3 | sort -nr -k 2 -t '-' | grep 'java-' -m 1)";

log(){
    case "$1" in
        "info")
            echo -e "\033[34mNOTE: $2\033[0m";
        ;;
        "warn")
            echo -e "\033[33mWARN: $2\033[0m";
        ;;
    esac
}

set_jvm_if_unset(){
    local config_file="$1";
    # 检查配置文件是否存在
    if [ ! -f "${config_file}" ]; then
        log "warn" "Config file ${config_file} not found !";
        exit 0
    fi

    local config_jvm_path=$(grep -B 5 '^-vmargs' "${config_file}" | grep -v '^-vmargs' | grep -A 1 '^-vm' | tail -n 1)
    if [ -n "${config_jvm_path}" ]; then
        log "warn" "File ${config_file} configured ${config_jvm_path} ignored it .";
        exit 0;
    fi

    sed -i '/^-vmarg/ {
i-vm\
'"${default_jvm_home}"'/bin
}' "${config_file}"

    log "info" "Configured jvm ${default_jvm_home} ==> ${config_file} .";
}


while read -r file
do
    set_jvm_if_unset "${file}";
done