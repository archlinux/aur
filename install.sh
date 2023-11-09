#!/bin/bash

# filename   : install.sh
# created at : 2023-11-09 20:27:39
# author     : xiliuya <xiliuya@aliyun.com>

while getopts ":b:h" opt; do
        case $opt in
        b)
                b_arg=$OPTARG
                ;;
        h)
                echo "-b hdx,y"
                ;;
        ?)
                echo "unknow"
                exit 1
                ;;
        esac
done

if [ -n "${b_arg}" ]; then
        grub_file_name="/etc/grub.d/40_custom"
        cat >>${grub_file_name} <<EOF
menuentry "Boot Windows NT6+" {
    probe -s dev_uuid -u (${b_arg});
    if [ "\${grub_platform}" = "efi" ];
    then
        chainloader /ntloader/ntloader initrd=/ntloader/initrd.cpio uuid=\${dev_uuid};
    else
        linux16 /ntloader/ntloader uuid=\${dev_uuid};
        initrd16 /ntloader/initrd.cpio;
    fi;
}
EOF
else
        echo "Plase give windows part like -b \"hdx,y\""
fi

if [ -d /boot/ntloader/ ]; then
        echo "/boot/ntloader/ is exist."
else
        cp -r /opt/ntloader/ /boot/
fi
